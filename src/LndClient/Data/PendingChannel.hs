module LndClient.Data.PendingChannel
  ( PendingChannel (..),
  )
where

import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified LndGrpc as GRPC

data PendingChannel
  = PendingChannel
      { remoteNodePub :: Text,
        channelPoint :: ChannelPoint,
        capacity :: MoneyAmount,
        localBalance :: MoneyAmount,
        remoteBalance :: MoneyAmount,
        localChanReserveSat :: MoneyAmount,
        remoteChanReserveSat :: MoneyAmount
      }
  deriving (Eq, Show)

instance
  FromGrpc
    PendingChannel
    GRPC.PendingChannelsResponse_PendingChannel
  where
  fromGrpc x =
    PendingChannel
      <$> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelRemoteNodePub x)
      <*> channelPointParser
        (GRPC.pendingChannelsResponse_PendingChannelChannelPoint x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelCapacity x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelLocalBalance x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelRemoteBalance x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelLocalChanReserveSat x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponse_PendingChannelRemoteChanReserveSat x)
