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
        capacity :: MSat,
        localBalance :: MSat,
        remoteBalance :: MSat,
        localChanReserveSat :: MSat,
        remoteChanReserveSat :: MSat
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
      <*> (toMSat <$> fromGrpc (GRPC.pendingChannelsResponse_PendingChannelCapacity x))
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_PendingChannelLocalBalance x)
          )
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_PendingChannelRemoteBalance x)
          )
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_PendingChannelLocalChanReserveSat x)
          )
      <*> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponse_PendingChannelRemoteChanReserveSat x)
          )
