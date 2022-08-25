module LndClient.Data.PendingChannel
  ( PendingChannel (..),
  )
where

import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data PendingChannel = PendingChannel
  { remoteNodePub :: NodePubKey,
    channelPoint :: ChannelPoint,
    capacity :: Msat,
    localBalance :: Msat,
    remoteBalance :: Msat,
    localChanReserveSat :: Msat,
    remoteChanReserveSat :: Msat,
    initiator :: LnInitiator
  }
  deriving stock (Eq, Show, Generic)

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
      <*> fromGrpcSat (x ^. LnGRPC.capacity)
      <*> fromGrpcSat (x ^. LnGRPC.localBalance)
      <*> fromGrpcSat (x ^. LnGRPC.remoteBalance)
      <*> fromGrpcSat (x ^. LnGRPC.localChanReserveSat)
      <*> fromGrpcSat (x ^. LnGRPC.remoteChanReserveSat)
      <*> fromGrpc (x ^. LnGRPC.initiator)
