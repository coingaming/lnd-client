{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.CloseChannel
  ( CloseChannelRequest (..),
    CloseStatusUpdate (..),
    ChannelCloseUpdate (..),
    ChannelCloseSummary (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.Channel (PendingUpdate)
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC
import qualified Proto.Lnrpc.Ln0 as LnGRPC0
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC0

data CloseChannelRequest = CloseChannelRequest
  { channelPoint :: ChannelPoint,
    force :: Bool,
    targetConf :: Maybe Int32,
    satPerByte :: Maybe Int64,
    deliveryAddress :: Maybe Text
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out CloseChannelRequest

data CloseStatusUpdate
  = Pending (PendingUpdate 'Closing)
  | Close ChannelCloseUpdate
  | NothingUpdate
  deriving stock (Eq, Ord, Show, Generic)

instance Out CloseStatusUpdate

data ChannelCloseUpdate = ChannelCloseUpdate
  { closingTxid :: TxId 'Closing,
    success :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ChannelCloseUpdate

data ChannelCloseSummary = ChannelCloseSummary
  { remotePubkey :: NodePubKey,
    chPoint :: ChannelPoint,
    chanId :: ChanId,
    settledBalance :: Msat,
    closingTxId :: TxId 'Closing
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ChannelCloseSummary

instance FromGrpc [ChannelCloseSummary] LnGRPC.ClosedChannelsResponse where
  fromGrpc x = mapM fromGrpc (x ^. LnGRPC.channels)

instance ToGrpc CloseChannelRequest LnGRPC.CloseChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (channelPoint x)
      <*> toGrpc (LndClient.Data.CloseChannel.force x)
      <*> toGrpc (targetConf x)
      <*> toGrpc (satPerByte x)
      <*> toGrpc (deliveryAddress x)
    where
      msg gChannelPoint gForce gTargetConf gSatPerByte gDeliveryAddress =
        defMessage
          & LnGRPC.channelPoint .~ gChannelPoint
          & LnGRPC.force .~ gForce
          & LnGRPC.targetConf .~ gTargetConf
          & LnGRPC.satPerByte .~ gSatPerByte
          & LnGRPC.deliveryAddress .~ gDeliveryAddress

instance FromGrpc CloseStatusUpdate LnGRPC.CloseStatusUpdate where
  fromGrpc x =
    case x ^. LnGRPC.maybe'update of
      Just (LnGRPC.CloseStatusUpdate'ClosePending a) -> Pending <$> fromGrpc a
      Just (LnGRPC.CloseStatusUpdate'ChanClose a) -> Close <$> fromGrpc a
      Nothing -> Right NothingUpdate

instance FromGrpc ChannelCloseUpdate LnGRPC.ChannelCloseUpdate where
  fromGrpc x =
    ChannelCloseUpdate
      <$> fromGrpc (x ^. LnGRPC.closingTxid)
      <*> fromGrpc (x ^. LnGRPC.success)

instance FromGrpc ChannelCloseSummary LnGRPC0.ChannelCloseSummary where
  fromGrpc x =
    ChannelCloseSummary
      <$> fromGrpc (x ^. LnGRPC0.remotePubkey)
      <*> channelPointParser (x ^. LnGRPC.channelPoint)
      <*> fromGrpc (x ^. LnGRPC0.chanId)
      <*> fromGrpcSat (x ^. LnGRPC0.settledBalance)
      <*> fromGrpc (x ^. LnGRPC0.closingTxHash)
