module LndClient.Data.WaitingCloseChannel
  ( WaitingCloseChannel (..),
  )
where

import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as GRPC

data WaitingCloseChannel
  = WaitingCloseChannel
      { channel :: PendingChannel,
        limboBalance :: MoneyAmount
      }
  deriving (Eq, Show)

instance
  FromGrpc
    WaitingCloseChannel
    GRPC.PendingChannelsResponse_WaitingCloseChannel
  where
  fromGrpc x =
    WaitingCloseChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                fromGrpc this
          )
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_WaitingCloseChannelLimboBalance x)
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_WaitingCloseChannelChannel x
