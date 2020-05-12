{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Data.Newtypes (MoneyAmount (..), PaymentRequest (..))
import LndClient.Utils (stdParseJSON, stdToJSON)

data SendPaymentRequest
  = SendPaymentRequest
      { paymentRequest :: PaymentRequest,
        amt :: MoneyAmount
      }
  deriving (Generic, Show)

data SendPaymentResponse
  = SendPaymentResponse
      { paymentError :: Text,
        paymentPreimage :: Text,
        paymentHash :: Text
      }
  deriving (Generic, Show, Eq)

instance ToJSON SendPaymentRequest where
  toJSON = stdToJSON

instance FromJSON SendPaymentResponse where
  parseJSON = stdParseJSON
