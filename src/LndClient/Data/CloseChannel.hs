{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.CloseChannel
  ( CloseChannelRequest (..),
  )
where

import qualified Data.Text.Lazy as TL (Text)
import LndClient.Import
import qualified LndGrpc as GRPC

data CloseChannelRequest
  = CloseChannelRequest
      { channelPoint :: ChannelPoint,
        force :: Bool,
        targetConf :: Word64,
        satPerByte :: Word64,
        deliveryAddress :: TL.Text
      }
  deriving (Generic, Show)

instance ToGrpc CloseChannelRequest GRPC.CloseChannelRequest where
  toGrpc x =
    msg
      <$> (toGrpc $ channelPoint x)
      <*> (toGrpc $ CloseChannel.force x)
      <*> (toGrpc $ targetConf x)
      <*> (toGrpc $ satPerByte x)
      <*> (toGrpc $ deliveryAddress x)
    where
      msg gChannelPoint gForce gTargetConf gSatPerByte gDeliveryAddress =
        def
          { GRPC.closeChannelRequestChannelPoint = gChannelPoint,
            GRPC.closeChannelRequestForce = gForce,
            GRPC.closeChannelRequestTargetConf = gTargetConf,
            GRPC.closeChannelRequestSatPerByte = gSatPerByte,
            GRPC.closeChannelRequestDeliveryAddress = gDeliveryAddress
          }
