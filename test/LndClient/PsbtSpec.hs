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
import qualified LndClient.Data.FundPsbt as FP
import qualified Data.Map as M

spec :: Spec
spec = do
  it "fundPsbt" $
    withEnv $ do
      lndBob <- getLndEnv Bob
      lndAlice <- getLndEnv Alice
      addr <- fmap NA.address $
        liftLndResult =<< newAddress lndAlice (NA.NewAddressRequest NA.WITNESS_PUBKEY_HASH Nothing)
      mine 200 Bob
      r <- sendCoins lndBob $ SC.SendCoinsRequest addr 200000000
      traceShowM r
      lu <- listUnspent lndAlice $ LU.ListUnspentRequest 0 10 ""
      let temp = FP.TxTemplate . fmap LU.outpoint . LU.utxos <$> lu <*> pure M.empty
      let fr = FP.FundPsbtRequest "" <$> temp <*> pure 0 <*> pure True <*> pure 2
      whenRight fr $ \fr' -> do
        psbt <- fundPsbt lndAlice fr'
        whenRight psbt $ \psbt' -> do
          let t = psbtBtcCli $ FP.fundedPsbt psbt'
          traceShowM t
          pure ()
        pure ()
      liftIO $ shouldBe True True
