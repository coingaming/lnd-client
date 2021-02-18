module LndClient.Data.ClosedChannel
  ( ClosedChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as GRPC

data ClosedChannel
  = ClosedChannel
      { channel :: PendingChannel,
        closingTxid :: ChannelClosingTxId
      }
  deriving (Eq, Show)

instance
  FromGrpc
    ClosedChannel
    GRPC.PendingChannelsResponse_ClosedChannel
  where
  fromGrpc x =
    ClosedChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_ClosedChannelClosingTxid x)
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_ClosedChannelChannel x
