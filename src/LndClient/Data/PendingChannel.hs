module LndClient.Data.PendingChannel
  ( PendingChannel (..),
  )
where

import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PendingChannel = PendingChannel
  { remoteNodePub :: NodePubKey,
    channelPoint :: ChannelPoint,
    capacity :: MSat,
    localBalance :: MSat,
    remoteBalance :: MSat,
    localChanReserveSat :: MSat,
    remoteChanReserveSat :: MSat,
    initiator :: LnInitiator
  }
  deriving (Eq, Show, Generic)

instance Out PendingChannel

instance
  FromGrpc
    PendingChannel
    LnGRPC.PendingChannelsResponse'PendingChannel
  where
  fromGrpc x =
    PendingChannel
      <$> fromGrpc
        (x ^. LnGRPC.remoteNodePub)
      <*> channelPointParser
        (x ^. LnGRPC.channelPoint)
      <*> grpcSatToMSat (x ^. LnGRPC.capacity)
      <*> grpcSatToMSat (x ^. LnGRPC.localBalance)
      <*> grpcSatToMSat (x ^. LnGRPC.remoteBalance)
      <*> grpcSatToMSat (x ^. LnGRPC.localChanReserveSat)
      <*> grpcSatToMSat (x ^. LnGRPC.remoteChanReserveSat)
      <*> fromGrpc (x ^. LnGRPC.initiator)
