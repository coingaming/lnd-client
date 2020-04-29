{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.Invoice
  ( Invoice (..),
    ResultWrapper (..),
  )
where

import Data.Aeson (FromJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON)

newtype ResultWrapper a
  = ResultWrapper
      { result :: a
      }
  deriving (Generic, Show)

instance (FromJSON a) => FromJSON (ResultWrapper a) where
  parseJSON = stdParseJSON

data Invoice
  = Invoice
      { rHash :: Text,
        amtPaidSat :: Maybe Text,
        creationDate :: Text,
        settleDate :: Maybe Text,
        value :: Text,
        expiry :: Text,
        settled :: Maybe Bool,
        settleIndex :: Maybe Text,
        descriptionHash :: Maybe Text,
        memo :: Maybe Text,
        paymentRequest :: Maybe Text,
        fallbackAddr :: Maybe Text,
        cltvExpiry :: Text,
        private :: Maybe Bool,
        addIndex :: Text,
        state :: Maybe Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON Invoice where
  parseJSON = stdParseJSON
