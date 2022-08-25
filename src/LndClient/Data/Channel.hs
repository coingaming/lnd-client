{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Channel
  ( Channel (..),
    PendingUpdate (..),
  )
where

import LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
    channelPointParser,
  )
import LndClient.Data.Newtype
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data Channel = Channel
  { remotePubkey :: NodePubKey,
    channelPoint :: ChannelPoint,
    chanId :: ChanId,
    capacity :: Msat,
    localBalance :: Msat,
    remoteBalance :: Msat,
    commitFee :: Msat,
    active :: Bool,
    initiator :: LnInitiator,
    totalSatoshisSent :: Msat,
    totalSatoshisReceived :: Msat,
    numUpdates :: Word64,
    prv :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out Channel

data PendingUpdate (a :: TxKind) = PendingUpdate
  { txid :: TxId a,
    outputIndex :: Vout a
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out (PendingUpdate a)

instance FromGrpc Channel LnGRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (x ^. LnGRPC.remotePubkey)
      <*> channelPointParser (x ^. LnGRPC.channelPoint)
      <*> fromGrpc (x ^. LnGRPC.chanId)
      <*> fromGrpcSat (x ^. LnGRPC.capacity)
      <*> fromGrpcSat (x ^. LnGRPC.localBalance)
      <*> fromGrpcSat (x ^. LnGRPC.remoteBalance)
      <*> fromGrpcSat (x ^. LnGRPC.commitFee)
      <*> fromGrpc (x ^. LnGRPC.active)
      <*> fromGrpc (x ^. LnGRPC.initiator)
      <*> fromGrpcSat (x ^. LnGRPC.totalSatoshisSent)
      <*> fromGrpcSat (x ^. LnGRPC.totalSatoshisReceived)
      <*> fromGrpc (x ^. LnGRPC.numUpdates)
      <*> fromGrpc (x ^. LnGRPC.private)

instance FromGrpc [Channel] LnGRPC.ListChannelsResponse where
  fromGrpc x = fromGrpc (x ^. LnGRPC.channels)

instance FromGrpc (PendingUpdate a) LnGRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (x ^. LnGRPC.txid)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)
