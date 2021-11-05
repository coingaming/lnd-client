module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PayReq = PayReq
  { paymentHash :: RHash,
    numMsat :: MSat,
    expiry :: Seconds
  }
  deriving (Eq, Show, Generic)

instance Out PayReq

instance FromGrpc PayReq LnGRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (x ^. LnGRPC.paymentHash)
      <*> fromGrpcToMSat (x ^. LnGRPC.numMsat)
      <*> fromGrpc (x ^. LnGRPC.expiry)
