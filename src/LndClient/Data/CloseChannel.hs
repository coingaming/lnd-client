{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.CloseChannel
  ( CloseChannelRequest (..),
    CloseStatusUpdate (..),
    ChannelPoint (..),
  )
where

import qualified Data.Text.Lazy as TL (Text)
import LndClient.Import
import qualified LndGrpc as GRPC

data CloseChannelRequest
  = CloseChannelRequest
      { channelPoint :: ChannelPoint,
        force :: Bool,
        targetConf :: Maybe Int32,
        satPerByte :: Maybe Int64,
        deliveryAddress :: Maybe TL.Text
      }
  deriving (Generic, Show)

data CloseStatusUpdate = Pending PendingUpdate | Close ChannelCloseUpdate | NothingUpdate
  deriving (Generic, Show)

data PendingUpdate
  = PendingUpdate
      { txid :: ByteString,
        outputIndex :: Word32
      }
  deriving (Generic, Show)

data ChannelCloseUpdate
  = ChannelCloseUpdate
      { closingTxid :: ByteString,
        success :: Bool
      }
  deriving (Generic, Show)

data ChannelPoint
  = ChannelPoint
      { fundingTxidBytes :: ByteString,
        outputIndex2 :: Word32
      }
  deriving (Generic, Show, Eq)

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

instance ToGrpc ChannelPoint GRPC.ChannelPoint where
  toGrpc x =
    msg <$> (toGrpc $ fundingTxidBytes x)
      <*> (toGrpc $ outputIndex2 x)
    where
      msg gFundingTxidBytes gOutputIndex =
        def
          { GRPC.channelPointFundingTxid = GRPC.ChannelPointFundingTxidFundingTxidBytes <$> gFundingTxidBytes,
            GRPC.channelPointOutputIndex = gOutputIndex
          }

instance FromGrpc CloseStatusUpdate GRPC.CloseStatusUpdate where
  fromGrpc x =
    case x of
      GRPC.CloseStatusUpdate (Just (GRPC.CloseStatusUpdateUpdateChanClose a)) -> Close <$> (fromGrpc a)
      GRPC.CloseStatusUpdate (Just (GRPC.CloseStatusUpdateUpdateClosePending a)) -> Pending <$> (fromGrpc a)
      GRPC.CloseStatusUpdate Nothing -> Right NothingUpdate

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