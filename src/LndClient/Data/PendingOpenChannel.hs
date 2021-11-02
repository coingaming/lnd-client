module LndClient.Data.PendingOpenChannel
  ( PendingOpenChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PendingOpenChannel = PendingOpenChannel
  { channel :: PendingChannel,
    confirmationHeight :: Word32,
    commitFee :: MSat,
    commitWeight :: Int64,
    feePerKw :: MSat
  }
  deriving (Eq, Show, Generic)

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
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.commitFee)
          )
      <*> fromGrpc
        (x ^. LnGRPC.commitWeight)
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.feePerKw)
          )
