{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data GetInfoResponse
  = GetInfoResponse
      { identityPubkey :: NodePubKey,
        syncedToChain :: Bool,
        syncedToGraph :: Bool
      }
  deriving (Eq, Show)

instance FromGrpc GetInfoResponse GRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (GRPC.getInfoResponseIdentityPubkey x)
      <*> fromGrpc (GRPC.getInfoResponseSyncedToChain x)
      <*> fromGrpc (GRPC.getInfoResponseSyncedToGraph x)

instance C2.FromGrpc GetInfoResponse LnGRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> mPubKey
      <*> mSyncedToChain
      <*> mSyncedToGraph
    where
      mSyncedToChain = Right $ x ^. LnGRPC.syncedToChain
      mSyncedToGraph = Right $ x ^. LnGRPC.syncedToGraph
      mPubKey = fromGrpc . fromStrict $ x ^. LnGRPC.identityPubkey
