{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import LndClient.Import

data InitWalletRequest
  = InitWalletRequest
      { walletPassword :: Text, -- base64
        cipherSeedMnemonic :: [Text],
        aezeedPassphrase :: Maybe Text
        --
        --  TODO : channel_backups
        --
      }
  deriving (Generic)

instance ToJSON InitWalletRequest where
  toJSON = stdToJSON
