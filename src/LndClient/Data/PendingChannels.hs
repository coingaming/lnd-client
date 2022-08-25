{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.PendingChannels
  ( PendingChannelsResponse (..),
  )
where

import LndClient.Data.ClosedChannel
import LndClient.Data.ForceClosedChannel
import LndClient.Data.PendingOpenChannel
import LndClient.Data.WaitingCloseChannel
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data PendingChannelsResponse = PendingChannelsResponse
  { totalLimboBalance :: Msat,
    pendingOpenChannels :: [PendingOpenChannel],
    pendingClosingChannels :: [ClosedChannel],
    pendingForceClosingChannels :: [ForceClosedChannel],
    waitingCloseChannels :: [WaitingCloseChannel]
  }
  deriving stock (Eq, Show, Generic)

instance Out PendingChannelsResponse

instance FromGrpc PendingChannelsResponse LnGRPC.PendingChannelsResponse where
  fromGrpc x =
    PendingChannelsResponse
      <$> fromGrpcSat (x ^. LnGRPC.totalLimboBalance)
      <*> fromGrpc
        (x ^. LnGRPC.pendingOpenChannels)
      <*> fromGrpc
        (x ^. LnGRPC.pendingClosingChannels)
      <*> fromGrpc
        (x ^. LnGRPC.pendingForceClosingChannels)
      <*> fromGrpc
        (x ^. LnGRPC.waitingCloseChannels)
