module LndClient.Data.WaitingCloseChannel
  ( WaitingCloseChannel (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.PendingChannel
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data WaitingCloseChannel
  = WaitingCloseChannel
      { channel :: PendingChannel,
        limboBalance :: MSat
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
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_WaitingCloseChannelLimboBalance x)
          )
    where
      pendingChannel =
        GRPC.pendingChannelsResponse_WaitingCloseChannelChannel x

instance
  C2.FromGrpc
    WaitingCloseChannel
    LnGRPC.PendingChannelsResponse'WaitingCloseChannel
  where
  fromGrpc x =
    WaitingCloseChannel
      <$> ( case pendingChannel of
              Nothing ->
                Left $ FromGrpcError "PendingChannel is required"
              Just this ->
                C2.fromGrpc this
          )
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.limboBalance)
          )
    where
      pendingChannel =
        x ^. LnGRPC.maybe'channel
