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
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Channel = Channel
  { remotePubkey :: NodePubKey,
    channelPoint :: ChannelPoint,
    capacity :: MSat,
    localBalance :: MSat,
    remoteBalance :: MSat,
    commitFee :: MSat,
    active :: Bool,
    initiator :: LnInitiator
  }
  deriving (Eq, Ord, Show, Generic)

instance Out Channel

data PendingUpdate (a :: TxKind) = PendingUpdate
  { txid :: TxId a,
    outputIndex :: Vout a
  }
  deriving (Eq, Ord, Show)

instance FromGrpc Channel LnGRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (x ^. LnGRPC.remotePubkey)
      <*> channelPointParser (x ^. LnGRPC.channelPoint)
      <*> fromGrpcSat (x ^. LnGRPC.capacity)
      <*> fromGrpcSat (x ^. LnGRPC.localBalance)
      <*> fromGrpcSat (x ^. LnGRPC.remoteBalance)
      <*> fromGrpcSat (x ^. LnGRPC.commitFee)
      <*> fromGrpc (x ^. LnGRPC.active)
      <*> fromGrpc (x ^. LnGRPC.initiator)

instance FromGrpc [Channel] LnGRPC.ListChannelsResponse where
  fromGrpc x = fromGrpc (x ^. LnGRPC.channels)

instance FromGrpc (PendingUpdate a) LnGRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (x ^. LnGRPC.txid)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)
