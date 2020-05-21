module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

newtype GetInfoResponse
  = GetInfoResponse
      { identity_pubkey :: Text
      }
  deriving (Eq, Show)

instance FromGrpc GetInfoResponse GRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (GRPC.getInfoResponseIdentityPubkey x)
