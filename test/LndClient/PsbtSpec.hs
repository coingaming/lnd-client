{-# OPTIONS_GHC -Wno-deprecations #-}
module LndClient.PsbtSpec
  ( spec,
  )
where

import qualified Data.Map as M
import qualified LndClient.Data.FinalizePsbt as FNP
import qualified LndClient.Data.FundPsbt as FP
import qualified LndClient.Data.ListUnspent as LU
import qualified LndClient.Data.NewAddress as NA
import qualified LndClient.Data.OutPoint as OP
import qualified LndClient.Data.PublishTransaction as PT
import qualified LndClient.Data.SendCoins as SC
import qualified LndClient.Data.PsbtShim as PS
import LndClient.Data.GetInfo (GetInfoResponse (..))
-- import qualified Control.Concurrent.Async as Async
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Katip
import LndClient.TestApp
import Test.Hspec
import LndClient.Data.OpenChannel

genAddr :: (KatipContext f, MonadUnliftIO f) => LndEnv -> f Text
genAddr lnd =
  fmap NA.address $
    liftLndResult =<< newAddress lnd (NA.NewAddressRequest NA.WITNESS_PUBKEY_HASH Nothing)

findUtxosByTxId :: (KatipContext m, MonadUnliftIO m) => LndEnv -> ByteString -> m [LU.Utxo]
findUtxosByTxId lnd txid' = do
  utxos <- LU.utxos <$> (liftLndResult =<< listUnspent lnd (LU.ListUnspentRequest 0 10 ""))
  pure $ filter (\u -> txid' == OP.txid (LU.outpoint u)) utxos

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
      let amt = MSat 200000000
      let psbtBackAmt = MSat 100000000
      sendTrx <- liftLndResult =<< sendCoins lndBob (SC.SendCoinsRequest addrAlice amt)
      --print $ "Bob sends to Alice:" ++ show amt ++ " with txid: " ++ show (SC.txid sendTrx)
      mine 2 Bob
      txid <- liftLndResult $ txIdParser $ SC.txid sendTrx
      utxos <- findUtxosByTxId lndAlice txid
      --print $ "Found in Alice unspent list:" ++ show utxos
      let temp = FP.TxTemplate (LU.outpoint <$> utxos) (M.fromList [(addrBob, psbtBackAmt)])
      let fr = FP.FundPsbtRequest "" temp 2 False (FP.SatPerVbyte 2)
      psbt <- liftLndResult =<< fundPsbt lndAlice fr
      fin <- liftLndResult =<< finalizePsbt lndAlice (FNP.FinalizePsbtRequest (FP.fundedPsbt psbt) "")
      --print $ "Final psbt from Alice:" ++ show finPsbt
      let txPsbt = FNP.rawFinalTx fin
      --print $ "Final transaction to publish" ++ show (txIdHex txPsbt)
      res <-
        liftLndResult
          =<< publishTransaction lndAlice (PT.PublishTransactionRequest txPsbt "hehe")
      mine 1 Bob
      liftIO $ shouldBe (PT.publishError res) ""
  it "openChannel with psbt" $ withEnv $ do
    bob <- getLndEnv Bob
    alice <- getLndEnv Alice
    GetInfoResponse bobPubKey _ _ <- liftLndResult =<< getInfo bob
    pcid <- newPendingChanId
    let psbtShim = PS.PsbtShim {
      PS.pendingChanId = pcid,
      PS.basePsbt = Nothing,
      PS.noPublish = False
    }
    let openChannelRequest = OpenChannelRequest {
      nodePubkey = bobPubKey,
      localFundingAmount = MSat 26660000,
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
    _a <- liftLndResult =<< openChannel traceShowM alice openChannelRequest
    liftIO $ do
      shouldBe True True






