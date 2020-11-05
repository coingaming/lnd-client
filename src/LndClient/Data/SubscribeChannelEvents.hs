{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.SubscribeChannelEvents
  ( ChannelEventUpdate (..),
    ChannelEventUpdateChannel (..),
  )
where

import Data.Either.Extra (maybeToEither)
import LndClient.Class
import LndClient.Data.Channel
import LndClient.Data.ChannelPoint
import LndClient.Data.CloseChannel
import LndClient.Import
import qualified LndGrpc as GRPC

data ChannelEventUpdate
  = ChannelEventUpdate
      { channelEvent :: ChannelEventUpdateChannel,
        eventType :: Enumerated GRPC.ChannelEventUpdate_UpdateType
      }
  deriving (Eq)

data ChannelEventUpdateChannel
  = ChannelEventUpdateChannelOpenChannel Channel
  | ChannelEventUpdateChannelClosedChannel ChannelCloseSummary
  | ChannelEventUpdateChannelActiveChannel ChannelPoint
  | ChannelEventUpdateChannelInactiveChannel ChannelPoint
  | ChannelEventUpdateChannelPendingOpenChannel PendingUpdate
  deriving (Eq)

instance FromGrpc ChannelEventUpdate GRPC.ChannelEventUpdate where
  fromGrpc x =
    ChannelEventUpdate
      <$> join (maybeToEither (FromGrpcError "Empty channelUpdate") (fromGrpc <$> GRPC.channelEventUpdateChannel x))
        <*> fromGrpc (GRPC.channelEventUpdateType x)

instance FromGrpc ChannelEventUpdateChannel GRPC.ChannelEventUpdateChannel where
  fromGrpc x = case x of
    GRPC.ChannelEventUpdateChannelOpenChannel c -> ChannelEventUpdateChannelOpenChannel <$> fromGrpc c
    GRPC.ChannelEventUpdateChannelActiveChannel cp -> ChannelEventUpdateChannelActiveChannel <$> fromGrpc cp
    GRPC.ChannelEventUpdateChannelInactiveChannel cp -> ChannelEventUpdateChannelInactiveChannel <$> fromGrpc cp
    GRPC.ChannelEventUpdateChannelPendingOpenChannel pa -> ChannelEventUpdateChannelPendingOpenChannel <$> fromGrpc pa
    GRPC.ChannelEventUpdateChannelClosedChannel cc -> ChannelEventUpdateChannelClosedChannel <$> fromGrpc cc
