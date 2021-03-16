module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data PayReq
  = PayReq
      { paymentHash :: RHash,
        numMsat :: MSat,
        expiry :: Seconds
      }
  deriving (Eq, Show)

instance FromGrpc PayReq GRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (GRPC.payReqPaymentHash x)
      <*> fromGrpc (GRPC.payReqNumMsat x)
      <*> fromGrpc (GRPC.payReqExpiry x)
