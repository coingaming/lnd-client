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
import qualified LndClient.Class2 as C2
import LndClient.Data.Channel (PendingUpdate)
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data CloseChannelRequest
  = CloseChannelRequest
      { channelPoint :: ChannelPoint,
        force :: Bool,
        targetConf :: Maybe Int32,
        satPerByte :: Maybe Int64,
        deliveryAddress :: Maybe Text
      }
  deriving (Eq, Ord, Show)

data CloseStatusUpdate
  = Pending (PendingUpdate 'Closing)
  | Close ChannelCloseUpdate
  | NothingUpdate
  deriving (Eq, Ord, Show)

data ChannelCloseUpdate
  = ChannelCloseUpdate
      { closingTxid :: TxId 'Closing,
        success :: Bool
      }
  deriving (Eq, Ord, Show)

data ChannelCloseSummary
  = ChannelCloseSummary
      { remotePubkey :: NodePubKey,
        chPoint :: ChannelPoint,
        settledBalance :: MSat,
        closingTxId :: TxId 'Closing
      }
  deriving (Eq, Ord, Show)

--instance FromGrpc ChannelCloseSummary GRPC.ChannelCloseSummary where
--  fromGrpc x =
--    ChannelCloseSummary
--      <$> fromGrpc (GRPC.channelCloseSummaryRemotePubkey x)
--      <*> channelPointParser (GRPC.channelCloseSummaryChannelPoint x)
--      <*> (toMSat <$> fromGrpc (GRPC.channelCloseSummarySettledBalance x))
--      <*> fromGrpc (GRPC.channelCloseSummaryClosingTxHash x)
--
--instance FromGrpc [ChannelCloseSummary] GRPC.ClosedChannelsResponse where
--  fromGrpc = fromGrpc . GRPC.closedChannelsResponseChannels
--
instance C2.FromGrpc [ChannelCloseSummary] LnGRPC.ClosedChannelsResponse where
  fromGrpc x = sequence $ C2.fromGrpc <$> (x ^. LnGRPC.channels)

instance ToGrpc CloseChannelRequest GRPC.CloseChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (channelPoint x)
      <*> toGrpc (LndClient.Data.CloseChannel.force x)
      <*> toGrpc (targetConf x)
      <*> toGrpc (satPerByte x)
      <*> toGrpc (deliveryAddress x)
    where
      msg gChannelPoint gForce gTargetConf gSatPerByte gDeliveryAddress =
        def
          { GRPC.closeChannelRequestChannelPoint = Just gChannelPoint,
            GRPC.closeChannelRequestForce = gForce,
            GRPC.closeChannelRequestTargetConf = gTargetConf,
            GRPC.closeChannelRequestSatPerByte = gSatPerByte,
            GRPC.closeChannelRequestDeliveryAddress = gDeliveryAddress
          }

instance C2.ToGrpc CloseChannelRequest LnGRPC.CloseChannelRequest where
  toGrpc x =
    msg
      <$> C2.toGrpc (channelPoint x)
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

instance FromGrpc CloseStatusUpdate GRPC.CloseStatusUpdate where
  fromGrpc x =
    case x of
      GRPC.CloseStatusUpdate
        (Just (GRPC.CloseStatusUpdateUpdateChanClose a)) ->
          Close <$> fromGrpc a
      GRPC.CloseStatusUpdate
        (Just (GRPC.CloseStatusUpdateUpdateClosePending a)) ->
          Pending <$> fromGrpc a
      GRPC.CloseStatusUpdate Nothing ->
        Right NothingUpdate

instance FromGrpc ChannelCloseUpdate GRPC.ChannelCloseUpdate where
  fromGrpc x =
    ChannelCloseUpdate
      <$> fromGrpc (GRPC.channelCloseUpdateClosingTxid x)
      <*> fromGrpc (GRPC.channelCloseUpdateSuccess x)

instance C2.FromGrpc ChannelCloseSummary LnGRPC.ChannelCloseSummary where
  fromGrpc x =
    ChannelCloseSummary
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.remotePubkey)
      <*> channelPointParser (fromStrict $ x ^. LnGRPC.channelPoint)
      <*> fromGrpc (x ^. LnGRPC.settledBalance)
      <*> fromGrpc (fromStrict $ x ^. LnGRPC.closingTxHash)
