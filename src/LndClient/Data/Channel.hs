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
import LndClient.Import
import qualified LndGrpc as GRPC

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
      <*> fromGrpc (1000 * GRPC.channelCapacity x)
      <*> fromGrpc (1000 * GRPC.channelLocalBalance x)
      <*> fromGrpc (1000 * GRPC.channelRemoteBalance x)
      <*> fromGrpc (1000 * GRPC.channelCommitFee x)
      <*> fromGrpc (GRPC.channelActive x)

instance FromGrpc [Channel] GRPC.ListChannelsResponse where
  fromGrpc = fromGrpc . GRPC.listChannelsResponseChannels

instance FromGrpc (PendingUpdate a) GRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (GRPC.pendingUpdateTxid x)
      <*> fromGrpc (GRPC.pendingUpdateOutputIndex x)
