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

instance FromGrpc Channel LnGRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.remotePubkey)
      <*> channelPointParser (fromStrict $ x ^. LnGRPC.channelPoint)
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.capacity))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.localBalance))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.remoteBalance))
      <*> (toMSat <$> fromGrpc (x ^. LnGRPC.commitFee))
      <*> fromGrpc (x ^. LnGRPC.active)

instance FromGrpc [Channel] LnGRPC.ListChannelsResponse where
  fromGrpc x = fromGrpc (x ^. LnGRPC.channels)

instance FromGrpc (PendingUpdate a) LnGRPC.PendingUpdate where
  fromGrpc x =
    PendingUpdate
      <$> fromGrpc (x ^. LnGRPC.txid)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)
