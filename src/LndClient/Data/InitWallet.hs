{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdToJSON)

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
