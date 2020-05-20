{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import qualified Data.Text.Lazy as TL (Text)
import LndClient.Import
import qualified LndGrpc as GRPC

data SendPaymentRequest
  = SendPaymentRequest
      { paymentRequest :: PaymentRequest,
        amt :: MoneyAmount
      }
  deriving (Generic, Show)

data SendPaymentResponse
  = SendPaymentResponse
      { paymentError :: TL.Text,
        paymentPreimage :: ByteString,
        paymentHash :: ByteString
      }
  deriving (Generic, Show, Eq)

instance ToGrpc SendPaymentRequest GRPC.SendRequest where
  toGrpc x =
    msg
      <$> (toGrpc $ amt x)
      <*> (toGrpc $ paymentRequest x)
    where
      msg gAmt gPaymentRequest =
        def
          { GRPC.sendRequestAmt = gAmt,
            GRPC.sendRequestPaymentRequest = gPaymentRequest
          }

instance FromGrpc SendPaymentResponse GRPC.SendResponse where
  fromGrpc x =
    SendPaymentResponse
      <$> (fromGrpc $ GRPC.sendResponsePaymentError x)
      <*> (fromGrpc $ GRPC.sendResponsePaymentPreimage x)
      <*> (fromGrpc $ GRPC.sendResponsePaymentHash x)