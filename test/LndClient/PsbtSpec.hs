{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}
module LndClient.PsbtSpec
  ( spec,
  )
where

import LndClient.LndTest
import LndClient.QRCode
import LndClient.RPC.Katip
import LndClient.TestApp
import qualified LndClient.Watcher as Watcher
import Test.Hspec

spec :: Spec
spec = do
  it "fundPsbt" $
    withEnv $ do
      lnd <- getLndEnv Bob
