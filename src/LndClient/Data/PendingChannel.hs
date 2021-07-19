module LndClient.Data.PendingChannel
  ( PendingChannel (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PendingChannel
  = PendingChannel
      { remoteNodePub :: NodePubKey,
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

instance
  C2.FromGrpc
    PendingChannel
    LnGRPC.PendingChannelsResponse'PendingChannel
  where
  fromGrpc x =
    PendingChannel
      <$> fromGrpc
        (fromStrict $ x ^. LnGRPC.remoteNodePub)
      <*> channelPointParser
        (fromStrict $ x ^. LnGRPC.channelPoint)
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.capacity))
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.localBalance)
          )
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.remoteBalance)
          )
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.localChanReserveSat)
          )
      <*> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.remoteChanReserveSat)
          )
