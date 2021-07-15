{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Channel
  ( Channel (..),
    PendingUpdate (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
    channelPointParser,
  )
import LndClient.Data.Newtype
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Channel
  = Channel
      { remotePubkey :: NodePubKey,
        channelPoint :: ChannelPoint,
        capacity :: MSat,
        localBalance :: MSat,
        remoteBalance :: MSat,
        commitFee :: MSat,
        active :: Bool
      }
  deriving (Eq, Ord, Show)

data PendingUpdate (a :: TxKind)
  = PendingUpdate
      { txid :: TxId a,
        outputIndex :: Vout a
      }
  deriving (Eq, Ord, Show)

instance FromGrpc Channel GRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (GRPC.channelRemotePubkey x)
      <*> channelPointParser (GRPC.channelChannelPoint x)
      <*> (toMSat <$> fromGrpc (GRPC.channelCapacity x))
      <*> (toMSat <$> fromGrpc (GRPC.channelLocalBalance x))
      <*> (toMSat <$> fromGrpc (GRPC.channelRemoteBalance x))
      <*> (toMSat <$> fromGrpc (GRPC.channelCommitFee x))
      <*> fromGrpc (GRPC.channelActive x)

instance C2.FromGrpc Channel LnGRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.remotePubkey)
      <*> channelPointParser (fromStrict $ x ^. LnGRPC.channelPoint)
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.capacity))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.localBalance))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.remoteBalance))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.commitFee))
      <*> fromGrpc (x ^. LnGRPC.active)

instance FromGrpc [Channel] GRPC.ListChannelsResponse where
  fromGrpc = fromGrpc . GRPC.listChannelsResponseChannels

instance FromGrpc (PendingUpdate a) GRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (GRPC.pendingUpdateTxid x)
      <*> fromGrpc (GRPC.pendingUpdateOutputIndex x)

instance C2.FromGrpc (PendingUpdate a) LnGRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (x ^. LnGRPC.txid)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)
