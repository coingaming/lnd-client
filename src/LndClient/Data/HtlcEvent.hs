module LndClient.Data.HtlcEvent
  ( HtlcEvent (..),
  )
where

import LndClient.Import
import qualified RouterGrpc as GRPC

data HtlcEvent
  = HtlcEvent
      { incomingChannelId :: Word64,
        outgoingChannelId :: Word64,
        incomingHtlcId :: Word64,
        outgoingHtlcId :: Word64,
        timestampNs :: Word64,
        eventType :: HtlcEvent_EventType
      }
  deriving (Eq)

instance FromGrpc HtlcEvent GRPC.HtlcEvent where
  fromGrpc x =
    HtlcEvent
      <$> fromGrpc (GRPC.htlcEventIncomingChannelId x)
      <*> fromGrpc (GRPC.htlcEventOutgoingChannelId x)
      <*> fromGrpc (GRPC.htlcEventIncomingHtlcId x)
      <*> fromGrpc (GRPC.htlcEventOutgoingHtlcId x)
      <*> fromGrpc (GRPC.htlcEventTimestampNs x)
      <*> fromGrpc (GRPC.htlcEventEventType x)
