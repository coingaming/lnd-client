{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.SubscribeChannelEvents
  ( ChannelEventUpdate (..),
    UpdateChannel (..),
  )
where

import Data.Either.Extra (maybeToEither)
import LndClient.Data.Channel
import LndClient.Data.ChannelPoint
import LndClient.Data.CloseChannel
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data ChannelEventUpdate
  = ChannelEventUpdate
      { channelEvent :: UpdateChannel,
        eventType :: UpdateType
      }
  deriving (Eq, Ord, Show)

data UpdateChannel
  = ChannelEventUpdateChannelOpenChannel Channel
  | ChannelEventUpdateChannelClosedChannel ChannelCloseSummary
  | ChannelEventUpdateChannelActiveChannel ChannelPoint
  | ChannelEventUpdateChannelInactiveChannel ChannelPoint
  | ChannelEventUpdateChannelPendingOpenChannel (PendingUpdate 'Funding)
  deriving (Eq, Ord, Show)

data UpdateType
  = OPEN_CHANNEL
  | CLOSED_CHANNEL
  | ACTIVE_CHANNEL
  | INACTIVE_CHANNEL
  | PENDING_OPEN_CHANNEL
  deriving (Eq, Ord, Show)

instance FromGrpc UpdateType LnGRPC.ChannelEventUpdate'UpdateType where
  fromGrpc x = case x of
    LnGRPC.ChannelEventUpdate'OPEN_CHANNEL -> Right OPEN_CHANNEL
    LnGRPC.ChannelEventUpdate'ACTIVE_CHANNEL -> Right ACTIVE_CHANNEL
    LnGRPC.ChannelEventUpdate'INACTIVE_CHANNEL -> Right INACTIVE_CHANNEL
    LnGRPC.ChannelEventUpdate'PENDING_OPEN_CHANNEL -> Right PENDING_OPEN_CHANNEL
    LnGRPC.ChannelEventUpdate'CLOSED_CHANNEL -> Right CLOSED_CHANNEL
    _ -> Left $ FromGrpcError "Wrong ChannelUpdateType"

instance FromGrpc UpdateChannel LnGRPC.ChannelEventUpdate'Channel where
  fromGrpc x = case x of
    LnGRPC.ChannelEventUpdate'OpenChannel c -> ChannelEventUpdateChannelOpenChannel <$> fromGrpc c
    LnGRPC.ChannelEventUpdate'ActiveChannel cp -> ChannelEventUpdateChannelActiveChannel <$> fromGrpc cp
    LnGRPC.ChannelEventUpdate'InactiveChannel cp -> ChannelEventUpdateChannelActiveChannel <$> fromGrpc cp
    LnGRPC.ChannelEventUpdate'PendingOpenChannel pa -> ChannelEventUpdateChannelPendingOpenChannel <$> fromGrpc pa
    LnGRPC.ChannelEventUpdate'ClosedChannel cc -> ChannelEventUpdateChannelClosedChannel <$> fromGrpc cc

instance FromGrpc ChannelEventUpdate LnGRPC.ChannelEventUpdate where
  fromGrpc x =
    ChannelEventUpdate
      <$> join
        ( fromGrpc
            <$> maybeToEither
              (FromGrpcError "Empty channelUpdate")
              (x ^. LnGRPC.maybe'channel)
        )
        <*> fromGrpc (x ^. LnGRPC.type')
