{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Peer
  ( Peer (..),
    LightningAddress (..),
    ConnectPeerRequest (..),
  )
where

--import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Peer
  = Peer
      { pubKey :: NodePubKey,
        address :: NodeLocation
      }
  deriving (Eq, Show)

instance C2.FromGrpc Peer LnGRPC.Peer where
  fromGrpc x =
    Peer
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.pubKey)
      <*> fromGrpc (fromStrict $ x ^. LnGRPC.address)

data LightningAddress
  = LightningAddress
      { pubkey :: NodePubKey,
        host :: NodeLocation
      }
  deriving (Eq, Show, Read)

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
  deriving (Eq, Show)

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

instance C2.FromGrpc [Peer] LnGRPC.ListPeersResponse where
  fromGrpc x = sequence $ C2.fromGrpc <$> (x ^. LnGRPC.peers)
