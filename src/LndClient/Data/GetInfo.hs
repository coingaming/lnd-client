module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data GetInfoResponse
  = GetInfoResponse
      { identityPubkey :: NodePubKeyHex,
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
