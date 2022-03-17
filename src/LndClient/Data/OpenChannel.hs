{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.OpenChannel
  ( OpenChannelRequest (..),
    OpenStatusUpdate (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.Channel
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data OpenChannelRequest = OpenChannelRequest
  { nodePubkey :: NodePubKey,
    localFundingAmount :: MSat,
    pushMSat :: Maybe MSat,
    targetConf :: Maybe Int32,
    mSatPerByte :: Maybe MSat,
    private :: Maybe Bool,
    minHtlcMsat :: Maybe MSat,
    remoteCsvDelay :: Maybe Word32,
    minConfs :: Maybe Int32,
    spendUnconfirmed :: Maybe Bool,
    closeAddress :: Maybe Text
  }
  deriving (Eq, Show, Generic)

instance Out OpenChannelRequest

data OpenStatusUpdate = OpenStatusUpdate
  { pendingChanId :: ByteString,
    update :: Maybe OpenStatusUpdate'
  }
  deriving (Eq, Show, Generic)

instance Out OpenStatusUpdate

data OpenStatusUpdate'
  = OpenStatusUpdateChanPending (PendingUpdate 'Funding)
  | OpenStatusUpdateChanOpen ChannelOpenUpdate
  | OpenStatusUpdatePsbtFund ReadyForPsbtFunding
  deriving (Eq, Show, Generic)

instance Out OpenStatusUpdate'

newtype ChannelOpenUpdate = ChannelOpenUpdate ChannelPoint
  deriving (Eq, Show, Generic)

instance Out ChannelOpenUpdate

data ReadyForPsbtFunding = ReadyForPsbtFunding
  { fundingAddress :: Text,
    fundingAmount :: MSat,
    psbt :: ByteString
  }
  deriving (Eq, Show, Generic)

instance Out ReadyForPsbtFunding

instance FromGrpc OpenStatusUpdate LnGRPC.OpenStatusUpdate where
  fromGrpc x =
    OpenStatusUpdate
      <$> fromGrpc (x ^. LnGRPC.pendingChanId)
      <*> case x ^. LnGRPC.maybe'update of
        Just upd -> Just <$> fromGrpc upd
        Nothing -> Right Nothing

instance FromGrpc OpenStatusUpdate' LnGRPC.OpenStatusUpdate'Update where
  fromGrpc x =
    case x of
      LnGRPC.OpenStatusUpdate'ChanPending pu -> OpenStatusUpdateChanPending <$> fromGrpc pu
      LnGRPC.OpenStatusUpdate'ChanOpen cou -> OpenStatusUpdateChanOpen <$> fromGrpc cou
      LnGRPC.OpenStatusUpdate'PsbtFund pf -> OpenStatusUpdatePsbtFund <$> fromGrpc pf

instance FromGrpc ChannelOpenUpdate LnGRPC.ChannelOpenUpdate where
  fromGrpc x = ChannelOpenUpdate <$> fromGrpc (x ^. LnGRPC.channelPoint)

instance FromGrpc ReadyForPsbtFunding LnGRPC.ReadyForPsbtFunding where
  fromGrpc x =
    ReadyForPsbtFunding
      <$> fromGrpc (x ^. LnGRPC.fundingAddress)
      <*> fromGrpcSat (x ^. LnGRPC.fundingAmount)
      <*> fromGrpc (x ^. LnGRPC.psbt)

instance ToGrpc OpenChannelRequest LnGRPC.OpenChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (nodePubkey x)
      <*> toGrpcSat (localFundingAmount x)
      <*> maybe (Right fieldDefault) toGrpcSat (pushMSat x)
      <*> toGrpc (targetConf x)
      <*> maybe (Right fieldDefault) toGrpcSat (mSatPerByte x)
      <*> toGrpc (private x)
      <*> maybe (Right fieldDefault) toGrpcMSat (minHtlcMsat x)
      <*> toGrpc (remoteCsvDelay x)
      <*> toGrpc (minConfs x)
      <*> toGrpc (spendUnconfirmed x)
      <*> toGrpc (closeAddress x)
    where
      msg gNodePubKey gLocalFindingAmount gPushSat gTargetConf gSatPerByte gPrivate gMinHtlcMsat gRemoteCsvDelay gMinConfs gSpendUnconfirmed gCloseAddress =
        defMessage
          & LnGRPC.nodePubkey .~ gNodePubKey
          & LnGRPC.localFundingAmount .~ gLocalFindingAmount
          & LnGRPC.pushSat .~ gPushSat
          & LnGRPC.targetConf .~ gTargetConf
          & LnGRPC.satPerByte .~ gSatPerByte
          & LnGRPC.private .~ gPrivate
          & LnGRPC.minHtlcMsat .~ gMinHtlcMsat
          & LnGRPC.remoteCsvDelay .~ gRemoteCsvDelay
          & LnGRPC.minConfs .~ gMinConfs
          & LnGRPC.spendUnconfirmed .~ gSpendUnconfirmed
          & LnGRPC.closeAddress .~ gCloseAddress
