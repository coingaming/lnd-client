{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}

module LndClient.PsbtSpec
  ( spec,
  )
where

import qualified Data.Map as M
import LndClient.Data.ChannelPoint
import qualified LndClient.Data.FinalizePsbt as FNP
import qualified LndClient.Data.FundPsbt as FP
import qualified LndClient.Data.FundingPsbtFinalize as FPF
import qualified LndClient.Data.FundingPsbtVerify as FSS
import qualified LndClient.Data.FundingStateStep as FSS
import LndClient.Data.GetInfo (GetInfoResponse (..))
import qualified LndClient.Data.ListUnspent as LU
import qualified LndClient.Data.NewAddress as NA
import LndClient.Data.OpenChannel
import qualified LndClient.Data.OutPoint as OP
import qualified LndClient.Data.PsbtShim as PS
import qualified LndClient.Data.PublishTransaction as PT
import qualified LndClient.Data.SendCoins as SC
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Katip
import LndClient.TestApp
import Test.Hspec
import qualified UnliftIO.STM as T

genAddr :: (KatipContext f, MonadUnliftIO f) => LndEnv -> f Text
genAddr lnd =
  fmap NA.address $
    liftLndResult =<< newAddress lnd (NA.NewAddressRequest NA.WITNESS_PUBKEY_HASH Nothing)

findUtxosByTxId :: (KatipContext m, MonadUnliftIO m) => LndEnv -> ByteString -> m [LU.Utxo]
findUtxosByTxId lnd txid' = do
  utxos <- LU.utxos <$> (liftLndResult =<< listUnspent lnd (LU.ListUnspentRequest 0 10 ""))
  pure $ filter (\u -> txid' == OP.txid (LU.outpoint u)) utxos

psbtVerifyReq :: PendingChannelId -> Psbt -> FSS.FundingStateStepRequest
psbtVerifyReq pcid fp =
  FSS.FundingStateStepPsbtVerifyRequest $
    FSS.FundingPsbtVerify
      { FSS.pendingChanId = pcid,
        FSS.fundedPsbt = fp,
        FSS.skipFinalize = False
      }

psbtFinalizeReq :: PendingChannelId -> Psbt -> FSS.FundingStateStepRequest
psbtFinalizeReq pcid sp =
  FSS.FundingStateStepPsbtFinalizeRequest $
    FPF.FundingPsbtFinalize
      { FPF.signedPsbt = sp,
        FPF.pendingChanId = pcid,
        FPF.finalRawTx = RawTx ""
      }

fundPsbtToAddr :: LndTest m Owner => Text -> Msat -> m FP.FundPsbtResponse
fundPsbtToAddr fAddr amt = do
  lndBob <- getLndEnv Bob
  lndAlice <- getLndEnv Alice
  addrAlice <- genAddr lndAlice
  mine 10 Bob
  let bankAmt = amt * 2
  sendTrx <- liftLndResult =<< sendCoins lndBob (SC.SendCoinsRequest addrAlice bankAmt False)
  mine 2 Bob
  txid <- liftLndResult $ txIdParser $ SC.txid sendTrx
  utxos <- findUtxosByTxId lndAlice txid
  --print $ "Found in Alice unspent list:" ++ show utxos
  let temp = FP.TxTemplate (LU.outpoint <$> utxos) (M.fromList [(fAddr, amt)])
  let fr = FP.FundPsbtRequest "" temp 2 False (FP.SatPerVbyte 2)
  liftLndResult =<< fundPsbt lndAlice fr

signPsbt :: LndTest m Owner => FP.FundPsbtResponse -> m FNP.FinalizePsbtResponse
signPsbt psbt' = do
  lndAlice <- getLndEnv Alice
  liftLndResult =<< finalizePsbt lndAlice (FNP.FinalizePsbtRequest (FP.fundedPsbt psbt') "")

openChannelPsbt :: (LndTest m Owner) => LndEnv -> NodePubKey -> Msat -> m (Either Text ChannelPoint)
openChannelPsbt lndEnv toPubKey locFundAmt = do
  chan <- T.newTChanIO
  pcid <- newPendingChanId
  let psbtShim =
        PS.PsbtShim
          { PS.pendingChanId = pcid,
            PS.basePsbt = Nothing,
            PS.noPublish = False
          }
  let openChannelRequest =
        OpenChannelRequest
          { nodePubkey = toPubKey,
            localFundingAmount = locFundAmt,
            pushMSat = Nothing,
            targetConf = Nothing,
            mSatPerByte = Nothing,
            private = Nothing,
            minHtlcMsat = Nothing,
            remoteCsvDelay = Nothing,
            minConfs = Nothing,
            spendUnconfirmed = Nothing,
            closeAddress = Nothing,
            fundingShim = Just psbtShim
          }
  void $ spawnLink $ liftLndResult =<< openChannel (void . T.atomically . T.writeTChan chan) lndEnv openChannelRequest
  fundStep pcid chan
  where
    fundStep pcid chan = do
      upd <- T.atomically $ T.readTChan chan
      $(logTM) DebugS $ logStr $ "Got chan status update" <> inspectPlain @Text upd
      case upd of
        OpenStatusUpdate _ (Just (OpenStatusUpdatePsbtFund (ReadyForPsbtFunding faddr famt _))) -> do
          $logTM DebugS
            . logStr
            $ "Chan ready for funding at addr:"
              <> inspectPlain @Text faddr
              <> " with amt:"
              <> inspectPlain famt
          psbtResp <- fundPsbtToAddr faddr famt
          let psbt' = Psbt $ FP.fundedPsbt psbtResp
          void $ liftLndResult =<< fundingStateStep lndEnv (psbtVerifyReq pcid psbt')
          sPsbtResp <- signPsbt psbtResp
          $logTM DebugS
            . logStr
            $ "Used psbt for funding:" <> inspectPlain @Text sPsbtResp
          void $ liftLndResult =<< fundingStateStep lndEnv (psbtFinalizeReq pcid (Psbt $ FNP.signedPsbt sPsbtResp))
          fundStep pcid chan
        OpenStatusUpdate _ (Just (OpenStatusUpdateChanPending p)) -> do
          $logTM DebugS
            . logStr
            $ "Chan is pending... mining..." <> inspectPlain @Text p
          mine 3 Bob
          fundStep pcid chan
        OpenStatusUpdate _ (Just (OpenStatusUpdateChanOpen (ChannelOpenUpdate cp))) -> do
          $(logTM) DebugS $ logStr $ "Chan is open" <> inspectPlain @Text cp
          pure (Right cp)
        _ -> pure (Left "Unexpected update")

spec :: Spec
spec = do
  it "fundPsbt" $
    withEnv $ do
      lndBob <- getLndEnv Bob
      lndAlice <- getLndEnv Alice
      addrAlice <- genAddr lndAlice
      addrBob <- genAddr lndBob
      --print $ "Alice addr: " <> addrAlice
      --print $ "Bob addr: " <> addrBob
      mine 10 Bob
      let amt = Msat 200000000
      let psbtBackAmt = Msat 100000000
      sendTrx <- liftLndResult =<< sendCoins lndBob (SC.SendCoinsRequest addrAlice amt False)
      --print $ "Bob sends to Alice:" ++ show amt ++ " with txid: " ++ show (SC.txid sendTrx)
      mine 2 Bob
      txid <- liftLndResult $ txIdParser $ SC.txid sendTrx
      utxos <- findUtxosByTxId lndAlice txid
      --print $ "Found in Alice unspent list:" ++ show utxos
      let temp = FP.TxTemplate (LU.outpoint <$> utxos) (M.fromList [(addrBob, psbtBackAmt)])
      let fr = FP.FundPsbtRequest "" temp 2 False (FP.SatPerVbyte 2)
      psbt' <- liftLndResult =<< fundPsbt lndAlice fr
      fin <- liftLndResult =<< finalizePsbt lndAlice (FNP.FinalizePsbtRequest (FP.fundedPsbt psbt') "")
      --print $ "Final psbt from Alice:" ++ show finPsbt
      let txPsbt = FNP.rawFinalTx fin
      --print $ "Final transaction to publish" ++ show (txIdHex txPsbt)
      res <-
        liftLndResult
          =<< publishTransaction lndAlice (PT.PublishTransactionRequest txPsbt "hehe")
      mine 1 Bob
      liftIO $ shouldBe (PT.publishError res) ""
  it "openChannel with psbt" $
    withEnv $ do
      bob <- getLndEnv Bob
      alice <- getLndEnv Alice
      GetInfoResponse bobPubKey _ _ <- liftLndResult =<< getInfo bob
      cp <- openChannelPsbt alice bobPubKey (Msat 266600000)
      liftIO $ shouldSatisfy cp isRight
