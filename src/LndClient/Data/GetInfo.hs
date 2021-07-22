{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

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

instance FromGrpc GetInfoResponse LnGRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (x ^. LnGRPC.identityPubkey)
      <*> fromGrpc (x ^. LnGRPC.syncedToChain)
      <*> fromGrpc (x ^. LnGRPC.syncedToGraph)
