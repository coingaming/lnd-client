module LndClient.Data.PendingOpenChannel
  ( PendingOpenChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.Lnrpc.Ln as LnGRPC
import qualified Proto.Lnrpc.Ln_Fields as LnGRPC

data PendingOpenChannel = PendingOpenChannel
  { channel :: PendingChannel,
    confirmationHeight :: Word32,
    commitFee :: MSat,
    commitWeight :: Int64,
    feePerKw :: MSat
  }
  deriving stock (Eq, Show, Generic)

instance Out PendingOpenChannel

instance
  FromGrpc
    PendingOpenChannel
    LnGRPC.PendingChannelsResponse'PendingOpenChannel
  where
  fromGrpc x =
    PendingOpenChannel
      <$> fromGrpc
        (x ^. LnGRPC.channel)
      <*> fromGrpc
        (x ^. LnGRPC.confirmationHeight)
      <*> fromGrpcSat (x ^. LnGRPC.commitFee)
      <*> fromGrpc (x ^. LnGRPC.commitWeight)
      <*> fromGrpcSat (x ^. LnGRPC.feePerKw)
