{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LndClient.Factory
  ( initTestWallet,
  )
where

import Katip (KatipContext)
import LndClient
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Void
import UnliftIO (MonadUnliftIO)

initTestWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError (RPCResponse VoidResponse))
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
