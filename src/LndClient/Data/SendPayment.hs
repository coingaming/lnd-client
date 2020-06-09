module LndClient.Data.SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data SendPaymentRequest
  = SendPaymentRequest
      { paymentRequest :: PaymentRequest,
        amt :: MoneyAmount
      }
  deriving (Eq)

data SendPaymentResponse
  = SendPaymentResponse
      { paymentError :: Text,
        paymentPreimage :: ByteString,
        paymentHash :: ByteString
      }
  deriving (Eq, Show)

instance ToGrpc SendPaymentRequest GRPC.SendRequest where
  toGrpc x =
    msg
      <$> toGrpc (amt x)
      <*> toGrpc (paymentRequest x)
    where
      msg gAmt gPaymentRequest =
        def
          { GRPC.sendRequestAmt = gAmt,
            GRPC.sendRequestPaymentRequest = gPaymentRequest
          }

instance FromGrpc SendPaymentResponse GRPC.SendResponse where
  fromGrpc x =
    SendPaymentResponse
      <$> fromGrpc (GRPC.sendResponsePaymentError x)
      <*> fromGrpc (GRPC.sendResponsePaymentPreimage x)
      <*> fromGrpc (GRPC.sendResponsePaymentHash x)
