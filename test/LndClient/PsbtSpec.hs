{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -Wno-deprecations #-}
module LndClient.PsbtSpec
  ( spec,
  )
where

import LndClient.Import
import LndClient.LndTest
import LndClient.TestApp
import Test.Hspec
import LndClient.RPC.Katip
import qualified LndClient.Data.NewAddress as NA
import qualified LndClient.Data.SendCoins as SC
import qualified LndClient.Data.ListUnspent as LU
import qualified LndClient.Data.OutPoint as OP
import qualified LndClient.Data.FundPsbt as FP
import qualified LndClient.Data.FinalizePsbt as FNP
import qualified LndClient.Data.PublishTransaction as PT
import qualified Data.Map as M
import Universum


genAddr :: (KatipContext f, MonadUnliftIO f) => LndEnv -> f Text
genAddr lnd = fmap NA.address $
  liftLndResult =<< newAddress lnd (NA.NewAddressRequest NA.WITNESS_PUBKEY_HASH Nothing)


findUtxosByTxId :: (KatipContext m, MonadUnliftIO m) => LndEnv -> ByteString -> m [LU.Utxo]
findUtxosByTxId lnd txid' = do
  utxos <- LU.utxos <$> (liftLndResult =<< listUnspent lnd (LU.ListUnspentRequest 0 10 ""))
  pure $ filter (\u-> txid' == OP.txid (LU.outpoint u)) utxos

spec :: Spec
spec =
  it "fundPsbt" $
  withEnv $ do
    lndBob <- getLndEnv Bob
    lndAlice <- getLndEnv Alice
    addrAlice <- genAddr lndAlice
    addrBob <- genAddr lndBob
    print $ "Alice addr: " <> addrAlice
    print $ "Bob addr: " <> addrBob
    mine 10 Bob
    let amt = MSat 200000000
    let psbtBackAmt = MSat 100000000
    sendTrx <- liftLndResult =<< sendCoins lndBob (SC.SendCoinsRequest addrAlice amt)
    print $ "Bob sends to Alice:" ++ show amt ++ " with txid: " ++ show (SC.txid sendTrx)
    mine 2 Bob
    txid <- liftLndResult $ txIdParser $ SC.txid sendTrx
    utxos <- findUtxosByTxId lndAlice txid
    print $ "Found in Alice unspent list:" ++ show utxos
    let temp = FP.TxTemplate (LU.outpoint <$> utxos) (M.fromList [(addrBob, psbtBackAmt)])
    let fr = FP.FundPsbtRequest "" temp 2 False 2
    psbt <- liftLndResult =<< fundPsbt lndAlice fr
    fin <- liftLndResult =<< finalizePsbt lndAlice (FNP.FinalizePsbtRequest (FP.fundedPsbt psbt) "")
    let finPsbt = psbtBtcCli $ FNP.signedPsbt fin
    print $ "Final psbt from Alice:" ++ show finPsbt
    let txPsbt = FNP.rawFinalTx fin
    print $ "Final transaction to publish" ++ show (txIdHex txPsbt)
    res <- liftLndResult =<< publishTransaction lndAlice (PT.PublishTransactionRequest txPsbt "hehe")
    mine 1 Bob
    liftIO $ shouldBe (PT.publishError res) ""
