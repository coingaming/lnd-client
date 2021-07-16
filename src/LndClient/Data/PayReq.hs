module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

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

instance C2.FromGrpc PayReq LnGRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.paymentHash)
      <*> fromGrpc (x ^. LnGRPC.numMsat)
      <*> fromGrpc (x ^. LnGRPC.expiry)
