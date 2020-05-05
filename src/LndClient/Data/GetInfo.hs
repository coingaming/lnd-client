{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import Data.Aeson (FromJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON)

newtype GetInfoResponse
  = GetInfoResponse
      { identity_pubkey :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON GetInfoResponse where
  parseJSON = stdParseJSON
