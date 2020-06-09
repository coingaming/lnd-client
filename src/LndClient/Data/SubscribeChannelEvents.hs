module LndClient.Data.SubscribeChannelEvents
  ( ChannelEventUpdate (..),
  )
where

import Data.Either.Extra (maybeToEither)
import LndClient.Import
import qualified LndGrpc as GRPC

data ChannelEventUpdate
  = ChannelEventUpdate
      { channelEvent :: GRPC.ChannelEventUpdateChannel,
        eventType :: Enumerated GRPC.ChannelEventUpdate_UpdateType
      }
  deriving (Show)

--data ChannelEvent
--  = OpenChannel GRPC.Channel
--  | ClosedChannel GRPC.ChannelCloseSummary
--  | ActiveChannel GRPC.ChannelPoint
--  | InactiveChannel GRPC.ChannelPoint
--  | PendingOpenChannel GRPC.PendingUpdate

instance FromGrpc ChannelEventUpdate GRPC.ChannelEventUpdate where
  fromGrpc x =
    ChannelEventUpdate
      <$> maybeToEither (FromGrpcError "Empty channelUpdate") (GRPC.channelEventUpdateChannel x)
      <*> fromGrpc (GRPC.channelEventUpdateType x)
