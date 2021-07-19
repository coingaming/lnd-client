{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data GetInfoResponse
  = GetInfoResponse
      { identityPubkey :: NodePubKey,
        syncedToChain :: Bool,
        syncedToGraph :: Bool
      }
  deriving (Eq, Show)

instance C2.FromGrpc GetInfoResponse LnGRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.identityPubkey)
      <*> fromGrpc (x ^. LnGRPC.syncedToChain)
      <*> fromGrpc (x ^. LnGRPC.syncedToGraph)
