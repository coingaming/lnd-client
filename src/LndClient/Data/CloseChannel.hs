module LndClient.Data.CloseChannel
  ( CloseChannelRequest (..),
    CloseStatusUpdate (..),
    ChannelPoint (..),
    PendingUpdate (..),
    ChannelCloseUpdate (..),
  )
where

import LndClient.Data.ChannelPoint hiding (outputIndex)
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
  deriving (Eq)

data CloseStatusUpdate
  = Pending PendingUpdate
  | Close ChannelCloseUpdate
  | NothingUpdate
  deriving (Eq)

data PendingUpdate
  = PendingUpdate
      { txid :: ByteString,
        outputIndex :: Word32
      }
  deriving (Eq)

data ChannelCloseUpdate
  = ChannelCloseUpdate
      { closingTxid :: ByteString,
        success :: Bool
      }
  deriving (Eq)

instance ToGrpc CloseChannelRequest GRPC.CloseChannelRequest where
  toGrpc x =
    msg
      <$> (toGrpc $ channelPoint x)
      <*> (toGrpc $ LndClient.Data.CloseChannel.force x)
      <*> (toGrpc $ targetConf x)
      <*> (toGrpc $ satPerByte x)
      <*> (toGrpc $ deliveryAddress x)
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
      GRPC.CloseStatusUpdate (Just (GRPC.CloseStatusUpdateUpdateChanClose a)) ->
        Close <$> (fromGrpc a)
      GRPC.CloseStatusUpdate (Just (GRPC.CloseStatusUpdateUpdateClosePending a)) ->
        Pending <$> (fromGrpc a)
      GRPC.CloseStatusUpdate Nothing ->
        Right NothingUpdate

instance FromGrpc PendingUpdate GRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> (fromGrpc $ GRPC.pendingUpdateTxid x)
      <*> (fromGrpc $ GRPC.pendingUpdateOutputIndex x)

instance FromGrpc ChannelCloseUpdate GRPC.ChannelCloseUpdate where
  fromGrpc x =
    ChannelCloseUpdate
      <$> (fromGrpc $ GRPC.channelCloseUpdateClosingTxid x)
      <*> (fromGrpc $ GRPC.channelCloseUpdateSuccess x)
