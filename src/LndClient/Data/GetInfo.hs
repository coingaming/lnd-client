{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import LndClient.Import.External
import LndClient.Utils (stdParseJSON)

newtype GetInfoResponse
  = GetInfoResponse
      { identity_pubkey :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON GetInfoResponse where
  parseJSON = stdParseJSON
