{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.OpenChannel
  ( OpenChannelRequest (..),
    OpenStatusUpdate (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Data.Channel
import LndClient.Data.ChannelPoint
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

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

data OpenStatusUpdate
  = OpenStatusUpdate
      { pendingChanId :: ByteString,
        update :: Maybe OpenStatusUpdate'
      }
  deriving (Eq, Show)

data OpenStatusUpdate'
  = OpenStatusUpdateChanPending (PendingUpdate 'Funding)
  | OpenStatusUpdateChanOpen ChannelOpenUpdate
  | OpenStatusUpdatePsbtFund ReadyForPsbtFunding
  deriving (Eq, Show)

newtype ChannelOpenUpdate = ChannelOpenUpdate ChannelPoint
  deriving (Eq, Show)

data ReadyForPsbtFunding
  = ReadyForPsbtFunding
      { fundingAddress :: Text,
        fundingAmount :: MSat,
        psbt :: ByteString
      }
  deriving (Eq, Show)

instance C2.FromGrpc OpenStatusUpdate LnGRPC.OpenStatusUpdate where
  fromGrpc x =
    OpenStatusUpdate
      <$> fromGrpc (x ^. LnGRPC.pendingChanId)
      <*> case x ^. LnGRPC.maybe'update of
        Just upd -> Just <$> C2.fromGrpc upd
        Nothing -> Right Nothing

instance C2.FromGrpc OpenStatusUpdate' LnGRPC.OpenStatusUpdate'Update where
  fromGrpc x =
    case x of
      LnGRPC.OpenStatusUpdate'ChanPending pu -> OpenStatusUpdateChanPending <$> C2.fromGrpc pu
      LnGRPC.OpenStatusUpdate'ChanOpen cou -> OpenStatusUpdateChanOpen <$> C2.fromGrpc cou
      LnGRPC.OpenStatusUpdate'PsbtFund pf -> OpenStatusUpdatePsbtFund <$> C2.fromGrpc pf

instance C2.FromGrpc ChannelOpenUpdate LnGRPC.ChannelOpenUpdate where
  fromGrpc x = ChannelOpenUpdate <$> C2.fromGrpc (x ^. LnGRPC.channelPoint)

instance C2.FromGrpc ReadyForPsbtFunding LnGRPC.ReadyForPsbtFunding where
  fromGrpc x =
    ReadyForPsbtFunding
      <$> fromGrpc (x ^. LnGRPC.fundingAddress)
      <*> fromGrpc (x ^. LnGRPC.fundingAmount)
      <*> fromGrpc (x ^. LnGRPC.psbt)

instance C2.ToGrpc OpenChannelRequest LnGRPC.OpenChannelRequest where
  toGrpc x =
    msg
      <$> toGrpc (nodePubkey x)
      <*> (toGrpc =<< toSat (localFundingAmount x))
      <*> maybe (Right fieldDefault) (toGrpc <=< toSat) (pushSat x)
      <*> toGrpc (targetConf x)
      <*> maybe (Right fieldDefault) (toGrpc <=< toSat) (satPerByte x)
      <*> toGrpc (private x)
      <*> toGrpc (minHtlcMsat x)
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
