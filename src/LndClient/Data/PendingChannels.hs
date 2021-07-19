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

instance FromGrpc PendingChannelsResponse LnGRPC.PendingChannelsResponse where
  fromGrpc x =
    PendingChannelsResponse
      <$> ( toMSat
              <$> fromGrpc
                (x ^. LnGRPC.totalLimboBalance)
          )
      <*> fromGrpc
        (x ^. LnGRPC.pendingOpenChannels)
      <*> fromGrpc
        (x ^. LnGRPC.pendingClosingChannels)
      <*> fromGrpc
        (x ^. LnGRPC.pendingForceClosingChannels)
      <*> fromGrpc
        (x ^. LnGRPC.waitingCloseChannels)
