{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data GetInfoResponse = GetInfoResponse
  { identityPubkey :: NodePubKey,
    syncedToChain :: Bool,
    syncedToGraph :: Bool
  }
  deriving stock (Eq, Show, Generic)

instance Out GetInfoResponse

instance FromGrpc GetInfoResponse LnGRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (x ^. LnGRPC.identityPubkey)
      <*> fromGrpc (x ^. LnGRPC.syncedToChain)
      <*> fromGrpc (x ^. LnGRPC.syncedToGraph)
