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
import qualified LndGrpc as GRPC

data PendingChannelsResponse
  = PendingChannelsResponse
      { totalLimboBalance :: MSat,
        pendingOpenChannels :: [PendingOpenChannel],
        pendingClosingChannels :: [ClosedChannel],
        pendingForceClosingChannels :: [ForceClosedChannel],
        waitingCloseChannels :: [WaitingCloseChannel]
      }
  deriving (Eq, Show)

instance
  FromGrpc
    PendingChannelsResponse
    GRPC.PendingChannelsResponse
  where
  fromGrpc x =
    PendingChannelsResponse
      <$> ( toMSat
              <$> fromGrpc
                (GRPC.pendingChannelsResponseTotalLimboBalance x)
          )
      <*> fromGrpc
        (GRPC.pendingChannelsResponsePendingOpenChannels x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponsePendingClosingChannels x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponsePendingForceClosingChannels x)
      <*> fromGrpc
        (GRPC.pendingChannelsResponseWaitingCloseChannels x)
