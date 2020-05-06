{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.Invoice
  ( Invoice (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Data.Newtypes
import LndClient.Utils (stdParseJSON, stdToJSON)

data Invoice
  = Invoice
      { rHash :: RHash,
        amtPaidSat :: Maybe Text,
        creationDate :: Maybe Text,
        settleDate :: Maybe Text,
        value :: MoneyAmount,
        expiry :: Maybe Text,
        settled :: Maybe Bool,
        settleIndex :: Maybe Text,
        descriptionHash :: Maybe Text,
        memo :: Maybe Text,
        paymentRequest :: Maybe Text,
        fallbackAddr :: Maybe Text,
        cltvExpiry :: Maybe Text,
        private :: Maybe Bool,
        addIndex :: Text,
        state :: Maybe Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON Invoice where
  parseJSON = stdParseJSON

instance ToJSON Invoice where
  toJSON = stdToJSON
