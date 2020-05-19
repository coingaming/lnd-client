{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import LndClient.Import

newtype GetInfoResponse
  = GetInfoResponse
      { identity_pubkey :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON GetInfoResponse where
  parseJSON = stdParseJSON
