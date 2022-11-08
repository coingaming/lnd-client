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
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data ChannelEventUpdate = ChannelEventUpdate
  { channelEvent :: UpdateChannel,
    eventType :: UpdateType
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ChannelEventUpdate

data UpdateChannel
  = ChannelEventUpdateChannelOpenChannel Channel
  | ChannelEventUpdateChannelClosedChannel ChannelCloseSummary
  | ChannelEventUpdateChannelActiveChannel ChannelPoint
  | ChannelEventUpdateChannelInactiveChannel ChannelPoint
  | ChannelEventUpdateChannelPendingOpenChannel (PendingUpdate 'Funding)
  | ChannelEventUpdateChannelFullyResolved ChannelPoint
  deriving stock (Eq, Ord, Show, Generic)

instance Out UpdateChannel

data UpdateType
  = OPEN_CHANNEL
  | CLOSED_CHANNEL
  | ACTIVE_CHANNEL
  | INACTIVE_CHANNEL
  | PENDING_OPEN_CHANNEL
  | FULLY_RESOLVED_CHANNEL
  deriving stock (Eq, Ord, Show, Generic)

instance Out UpdateType

instance FromGrpc UpdateType LnGRPC.ChannelEventUpdate'UpdateType where
  fromGrpc x = case x of
    LnGRPC.ChannelEventUpdate'OPEN_CHANNEL -> Right OPEN_CHANNEL
    LnGRPC.ChannelEventUpdate'ACTIVE_CHANNEL -> Right ACTIVE_CHANNEL
    LnGRPC.ChannelEventUpdate'INACTIVE_CHANNEL -> Right INACTIVE_CHANNEL
    LnGRPC.ChannelEventUpdate'PENDING_OPEN_CHANNEL -> Right PENDING_OPEN_CHANNEL
    LnGRPC.ChannelEventUpdate'CLOSED_CHANNEL -> Right CLOSED_CHANNEL
    LnGRPC.ChannelEventUpdate'FULLY_RESOLVED_CHANNEL -> Right FULLY_RESOLVED_CHANNEL
    LnGRPC.ChannelEventUpdate'UpdateType'Unrecognized v ->
      Left
        . FromGrpcError
        $ "Cannot parse ChannelUpdateType, value:" <> inspectPlain v

instance FromGrpc UpdateChannel LnGRPC.ChannelEventUpdate'Channel where
  fromGrpc x = case x of
    LnGRPC.ChannelEventUpdate'OpenChannel c -> ChannelEventUpdateChannelOpenChannel <$> fromGrpc c
    LnGRPC.ChannelEventUpdate'ActiveChannel cp -> ChannelEventUpdateChannelActiveChannel <$> fromGrpc cp
    LnGRPC.ChannelEventUpdate'InactiveChannel cp -> ChannelEventUpdateChannelInactiveChannel <$> fromGrpc cp
    LnGRPC.ChannelEventUpdate'PendingOpenChannel pa -> ChannelEventUpdateChannelPendingOpenChannel <$> fromGrpc pa
    LnGRPC.ChannelEventUpdate'ClosedChannel cc -> ChannelEventUpdateChannelClosedChannel <$> fromGrpc cc
    LnGRPC.ChannelEventUpdate'FullyResolvedChannel cc -> ChannelEventUpdateChannelFullyResolved <$> fromGrpc cc

instance FromGrpc ChannelEventUpdate LnGRPC.ChannelEventUpdate where
  fromGrpc x =
    ChannelEventUpdate
      <$> ( fromGrpc
              =<< maybeToEither
                (FromGrpcError "Empty channelUpdate")
                (x ^. LnGRPC.maybe'channel)
          )
        <*> fromGrpc (x ^. LnGRPC.type')
