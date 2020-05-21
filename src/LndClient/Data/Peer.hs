{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Peer
  ( Peer (..),
    LightningAddress (..),
    ConnectPeerRequest (..),
  )
where

import Data.Text.Lazy as TL
import LndClient.Import
import qualified LndGrpc as GRPC

data Peer
  = Peer
      { pubKey :: TL.Text,
        address :: TL.Text
      }
  deriving (Eq, Show)

instance FromGrpc Peer GRPC.Peer where
  fromGrpc x =
    Peer
      <$> fromGrpc (GRPC.peerPubKey x)
      <*> fromGrpc (GRPC.peerAddress x)

data LightningAddress
  = LightningAddress
      { pubkey :: TL.Text,
        host :: TL.Text
      }
  deriving (Eq)

instance ToGrpc LightningAddress GRPC.LightningAddress where
  toGrpc x =
    msg
      <$> toGrpc (pubkey x)
      <*> toGrpc (host x)
    where
      msg gPubkey gHost =
        def
          { GRPC.lightningAddressPubkey = gPubkey,
            GRPC.lightningAddressHost = gHost
          }

data ConnectPeerRequest
  = ConnectPeerRequest
      { addr :: LightningAddress,
        perm :: Bool
      }
  deriving (Eq)

instance ToGrpc ConnectPeerRequest GRPC.ConnectPeerRequest where
  toGrpc x =
    msg
      <$> toGrpc (addr x)
      <*> toGrpc (perm x)
    where
      msg gAddr gPerm =
        def
          { GRPC.connectPeerRequestAddr = gAddr,
            GRPC.connectPeerRequestPerm = gPerm
          }

instance FromGrpc [Peer] GRPC.ListPeersResponse where
  fromGrpc = fromGrpc . GRPC.listPeersResponsePeers
