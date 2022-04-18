module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln as LnGRPC
import qualified Proto.Lnrpc.Ln_Fields as LnGRPC

data PayReq = PayReq
  { paymentHash :: RHash,
    numMsat :: MSat,
    expiry :: Seconds
  }
  deriving stock (Eq, Show, Generic)

instance Out PayReq

instance FromGrpc PayReq LnGRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (x ^. LnGRPC.paymentHash)
      <*> fromGrpcMSat (x ^. LnGRPC.numMsat)
      <*> fromGrpc (x ^. LnGRPC.expiry)
