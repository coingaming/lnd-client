module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data PayReq
  = PayReq
      { paymentHash :: RHash,
        numSatoshis :: MoneyAmount,
        expiry :: Seconds
      }
  deriving (Eq)

instance FromGrpc PayReq GRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (GRPC.payReqPaymentHash x)
      <*> fromGrpc (GRPC.payReqNumSatoshis x)
      <*> fromGrpc (GRPC.payReqExpiry x)
