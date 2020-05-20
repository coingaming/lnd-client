{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Factory
  ( initTestWallet,
  )
where

import Katip (KatipContext)
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.Types
import LndClient.Data.Void
import LndClient.Import.External
import LndClient.RPC

initTestWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (LndResult (RPCResponse VoidResponse))
initTestWallet env =
  initWallet env initWalletRequest
  where
    initWalletRequest =
      InitWalletRequest
        { walletPassword = "ZGV2ZWxvcGVy",
          aezeedPassphrase = Nothing,
          cipherSeedMnemonic = initWalletSeed
        }
    initWalletSeed =
      [ "absent",
        "dilemma",
        "mango",
        "firm",
        "hero",
        "green",
        "wide",
        "rebel",
        "pigeon",
        "custom",
        "town",
        "stadium",
        "shock",
        "bind",
        "ocean",
        "seek",
        "enforce",
        "during",
        "bird",
        "honey",
        "enrich",
        "number",
        "wealth",
        "thunder"
      ]
