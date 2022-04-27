module LndClient.Data.PayReq
  ( PayReq (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data PayReq = PayReq
  { destination :: NodePubKey,
    paymentHash :: RHash,
    numMsat :: MSat,
    expiry :: Seconds
  }
  deriving stock (Eq, Show, Generic)

instance Out PayReq

instance FromGrpc PayReq LnGRPC.PayReq where
  fromGrpc x =
    PayReq
      <$> fromGrpc (x ^. LnGRPC.destination)
      <*> fromGrpc (x ^. LnGRPC.paymentHash)
      <*> fromGrpcMSat (x ^. LnGRPC.numMsat)
      <*> fromGrpc (x ^. LnGRPC.expiry)
