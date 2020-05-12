{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Data.Newtypes (PaymentRequest (..))
import LndClient.Utils (stdParseJSON, stdToJSON)

newtype SendPaymentRequest
  = SendPaymentRequest
      { payment_request :: PaymentRequest
      }
  deriving (Generic, Show)

data SendPaymentResponse
  = SendPaymentResponse
      { state :: Text,
        preimage :: Text
      }
  deriving (Generic, Show, Eq)

instance ToJSON SendPaymentRequest where
  toJSON = stdToJSON

instance FromJSON SendPaymentResponse where
  parseJSON = stdParseJSON
