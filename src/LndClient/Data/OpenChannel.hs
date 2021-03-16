module LndClient.Data.OpenChannel
  ( OpenChannelRequest (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data OpenChannelRequest
  = OpenChannelRequest
      { nodePubkey :: NodePubKey,
        localFundingAmount :: MSat,
        pushSat :: Maybe MSat,
        targetConf :: Maybe Int32,
        satPerByte :: Maybe MSat,
        private :: Maybe Bool,
        minHtlcMsat :: Maybe MSat,
        remoteCsvDelay :: Maybe Word32,
        minConfs :: Maybe Int32,
        spendUnconfirmed :: Maybe Bool,
        closeAddress :: Maybe Text
      }
  deriving (Eq, Show)

instance ToGrpc OpenChannelRequest GRPC.OpenChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (nodePubkey x)
      <*> (toGrpc =<< toSat (localFundingAmount x))
      <*> maybe (Right def) (toGrpc <=< toSat) (pushSat x)
      <*> toGrpc (targetConf x)
      <*> maybe (Right def) (toGrpc <=< toSat) (satPerByte x)
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
