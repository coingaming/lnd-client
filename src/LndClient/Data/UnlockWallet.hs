{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.UnlockWallet
  ( UnlockWalletRequest (..),
  )
where

import Data.Aeson (ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdToJSON)

data UnlockWalletRequest
  = UnlockWalletRequest
      { walletPassword :: Text,
        recoveryWindow :: Int
        --
        --  TODO : channel_backups
        --
      }
  deriving (Generic)

instance ToJSON UnlockWalletRequest where
  toJSON = stdToJSON
