module LndClient.Data.GetInfo
  ( GetInfoResponse (..),
  )
where

import qualified Data.Text.Lazy as TL
import LndClient.Import
import qualified LndGrpc as GRPC

newtype GetInfoResponse
  = GetInfoResponse
      { identity_pubkey :: TL.Text
      }
  deriving (Eq, Show)

instance FromGrpc GetInfoResponse GRPC.GetInfoResponse where
  fromGrpc x =
    GetInfoResponse
      <$> fromGrpc (GRPC.getInfoResponseIdentityPubkey x)
