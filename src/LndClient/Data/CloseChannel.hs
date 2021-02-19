module LndClient.Data.CloseChannel
  ( CloseChannelRequest (..),
    CloseStatusUpdate (..),
    ChannelCloseUpdate (..),
    ChannelCloseSummary (..),
  )
where

import LndClient.Data.Channel (PendingUpdate)
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified LndGrpc as GRPC

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
        settledBalance :: MoneyAmount
      }
  deriving (Eq, Ord, Show)

instance FromGrpc ChannelCloseSummary GRPC.ChannelCloseSummary where
  fromGrpc x =
    ChannelCloseSummary
      <$> fromGrpc (GRPC.channelCloseSummaryRemotePubkey x)
      <*> channelPointParser (GRPC.channelCloseSummaryChannelPoint x)
      <*> fromGrpc (GRPC.channelCloseSummarySettledBalance x)

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
