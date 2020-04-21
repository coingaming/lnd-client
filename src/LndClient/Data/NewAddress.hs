{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
  )
where

import Data.Aeson (FromJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON)

newtype NewAddressResponse
  = NewAddressResponse
      { address :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON NewAddressResponse where
  parseJSON = stdParseJSON
