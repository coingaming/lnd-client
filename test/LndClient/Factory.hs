{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LndClient.Factory
  ( initTestWallet,
  )
where

import LndClient
import LndClient.Data.InitWallet (InitWalletRequest (..))

initTestWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
initTestWallet env =
  initWallet env initWalletRequest
  where
    initWalletRequest =
      InitWalletRequest
        { walletPassword = "developer",
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
