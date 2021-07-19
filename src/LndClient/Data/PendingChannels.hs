{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.PendingChannels
  ( PendingChannelsResponse (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.ClosedChannel
import LndClient.Data.ForceClosedChannel
import LndClient.Data.PendingOpenChannel
import LndClient.Data.WaitingCloseChannel
import LndClient.Import
--import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data PendingChannelsResponse
  = PendingChannelsResponse
      { totalLimboBalance :: MSat,
        pendingOpenChannels :: [PendingOpenChannel],
        pendingClosingChannels :: [ClosedChannel],
        pendingForceClosingChannels :: [ForceClosedChannel],
        waitingCloseChannels :: [WaitingCloseChannel]
      }
  deriving (Eq, Show)

--instance
--  FromGrpc
--    PendingChannelsResponse
--    GRPC.PendingChannelsResponse
--  where
--  fromGrpc x =
--    PendingChannelsResponse
--      <$> ( toMSat
--              <$> fromGrpc
--                (GRPC.pendingChannelsResponseTotalLimboBalance x)
--          )
--      <*> fromGrpc
--        (GRPC.pendingChannelsResponsePendingOpenChannels x)
--      <*> fromGrpc
--        (GRPC.pendingChannelsResponsePendingClosingChannels x)
--      <*> fromGrpc
--        (GRPC.pendingChannelsResponsePendingForceClosingChannels x)
--      <*> fromGrpc
--        (GRPC.pendingChannelsResponseWaitingCloseChannels x)

instance C2.FromGrpc PendingChannelsResponse LnGRPC.PendingChannelsResponse where
  fromGrpc x =
    PendingChannelsResponse
      <$> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.totalLimboBalance)
          )
      <*> C2.fromGrpc
        (x ^. LnGRPC.pendingOpenChannels)
      <*> C2.fromGrpc
        (x ^. LnGRPC.pendingClosingChannels)
      <*> C2.fromGrpc
        (x ^. LnGRPC.pendingForceClosingChannels)
      <*> C2.fromGrpc
        (x ^. LnGRPC.waitingCloseChannels)
