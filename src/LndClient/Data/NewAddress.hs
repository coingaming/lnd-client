{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
  )
where

import LndClient.Import

newtype NewAddressResponse
  = NewAddressResponse
      { address :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON NewAddressResponse where
  parseJSON = stdParseJSON
