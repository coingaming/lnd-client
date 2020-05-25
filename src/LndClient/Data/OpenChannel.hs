module LndClient.Data.OpenChannel
  ( OpenChannelRequest (..),
    ChannelPoint (..),
  )
where

import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified LndGrpc as GRPC

data OpenChannelRequest
  = OpenChannelRequest
      { nodePubkey :: ByteString,
        --
        --TODO move amounts to MoneyAmount type
        --
        localFundingAmount :: MoneyAmount,
        pushSat :: Maybe MoneyAmount,
        targetConf :: Maybe Int32,
        satPerByte :: Maybe Int64,
        private :: Maybe Bool,
        minHtlcMsat :: Maybe Int64,
        remoteCsvDelay :: Maybe Word32,
        minConfs :: Maybe Int32,
        spendUnconfirmed :: Maybe Bool,
        closeAddress :: Maybe Text
        --
        --TODO implement fundingShim field
        --
      }
  deriving (Eq)

instance ToGrpc OpenChannelRequest GRPC.OpenChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (nodePubkey x)
      <*> toGrpc (localFundingAmount x)
      <*> toGrpc (pushSat x)
      <*> toGrpc (targetConf x)
      <*> toGrpc (satPerByte x)
      <*> toGrpc (private x)
      <*> toGrpc (minHtlcMsat x)
      <*> toGrpc (remoteCsvDelay x)
      <*> toGrpc (minConfs x)
      <*> toGrpc (spendUnconfirmed x)
      <*> toGrpc (closeAddress x)
    where
      msg x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 =
        def
          { GRPC.openChannelRequestNodePubkey = x0,
            GRPC.openChannelRequestLocalFundingAmount = x1,
            GRPC.openChannelRequestPushSat = x2,
            GRPC.openChannelRequestTargetConf = x3,
            GRPC.openChannelRequestSatPerByte = x4,
            GRPC.openChannelRequestPrivate = x5,
            GRPC.openChannelRequestMinHtlcMsat = x6,
            GRPC.openChannelRequestRemoteCsvDelay = x7,
            GRPC.openChannelRequestMinConfs = x8,
            GRPC.openChannelRequestSpendUnconfirmed = x9,
            GRPC.openChannelRequestCloseAddress = x10
          }
