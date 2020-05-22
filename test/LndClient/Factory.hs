{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Factory
  ( initTestWallet,
  )
where

import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Import
import LndClient.RPC

initTestWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
initTestWallet env =
  initWallet env initWalletRequest
  where
    initWalletRequest =
      InitWalletRequest
        { walletPassword = LndWalletPassword "developer",
          aezeedPassphrase = Nothing,
          cipherSeedMnemonic = initWalletSeed
        }
    initWalletSeed =
      CipherSeedMnemonic
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
