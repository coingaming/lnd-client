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
        amt :: MSat
      }
  deriving (Eq, Show)

data SendPaymentResponse
  = SendPaymentResponse
      { paymentError :: Text,
        paymentPreimage :: RPreimage,
        paymentHash :: RHash
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
          { GRPC.sendRequestAmtMsat = gAmt,
            GRPC.sendRequestPaymentRequest = gPaymentRequest
          }

instance FromGrpc SendPaymentResponse GRPC.SendResponse where
  fromGrpc x = do
    res <-
      SendPaymentResponse
        <$> fromGrpc (GRPC.sendResponsePaymentError x)
        <*> fromGrpc (GRPC.sendResponsePaymentPreimage x)
        <*> fromGrpc (GRPC.sendResponsePaymentHash x)
    Right res
--  if newRHash (paymentPreimage res) == paymentHash res
--    then Right res
--    else
--      Left . LndError $
--        "paymentPreimage doesn't match paymentHash, error: "
--          <> paymentError res
