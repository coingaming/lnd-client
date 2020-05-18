{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import LndClient.Data.Newtypes (MoneyAmount (..), PaymentRequest (..))
import LndClient.Import.External
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
        paymentPreimage :: Maybe Text,
        paymentHash :: Text
      }
  deriving (Generic, Show, Eq)

instance ToJSON SendPaymentRequest where
  toJSON = stdToJSON

instance FromJSON SendPaymentResponse where
  parseJSON = stdParseJSON
