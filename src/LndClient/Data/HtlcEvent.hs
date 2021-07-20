module LndClient.Data.HtlcEvent
  ( HtlcEvent (..),
  )
where

import LndClient.Import
import qualified Proto.RouterGrpc as LnGRPC
import qualified Proto.RouterGrpc_Fields as LnGRPC

data HtlcEvent
  = HtlcEvent
      { incomingChannelId :: Word64,
        outgoingChannelId :: Word64,
        incomingHtlcId :: Word64,
        outgoingHtlcId :: Word64,
        timestampNs :: Word64,
        eventType :: EventType
      }
  deriving (Eq)

data EventType
  = UNKNOWN
  | SEND
  | RECEIVE
  | FORWARD
  deriving (Eq)

instance FromGrpc HtlcEvent LnGRPC.HtlcEvent where
  fromGrpc x =
    HtlcEvent
      <$> fromGrpc (x ^. LnGRPC.incomingChannelId)
      <*> fromGrpc (x ^. LnGRPC.outgoingChannelId)
      <*> fromGrpc (x ^. LnGRPC.incomingHtlcId)
      <*> fromGrpc (x ^. LnGRPC.outgoingHtlcId)
      <*> fromGrpc (x ^. LnGRPC.timestampNs)
      <*> fromGrpc (x ^. LnGRPC.eventType)

instance FromGrpc EventType LnGRPC.HtlcEvent'EventType where
  fromGrpc x =
    case x of
      LnGRPC.HtlcEvent'UNKNOWN -> Right UNKNOWN
      LnGRPC.HtlcEvent'SEND -> Right SEND
      LnGRPC.HtlcEvent'RECEIVE -> Right RECEIVE
      LnGRPC.HtlcEvent'FORWARD -> Right FORWARD
      _ -> Left $ FromGrpcError "Can't parse EventType"
