{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Peer
  ( Peer (..),
    LightningAddress (..),
    ConnectPeerRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
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

instance C2.ToGrpc LightningAddress LnGRPC.LightningAddress where
  toGrpc x =
    msg
      <$> toGrpc (pubkey x)
      <*> toGrpc (host x)
    where
      msg gPubkey gHost =
        defMessage
          & LnGRPC.pubkey .~ toStrict gPubkey
          & LnGRPC.host .~ toStrict gHost

data ConnectPeerRequest
  = ConnectPeerRequest
      { addr :: LightningAddress,
        perm :: Bool
      }
  deriving (Eq, Show)

instance C2.ToGrpc ConnectPeerRequest LnGRPC.ConnectPeerRequest where
  toGrpc x =
    msg
      <$> C2.toGrpc (addr x)
      <*> toGrpc (perm x)
    where
      msg gAddr gPerm =
        defMessage
          & LnGRPC.addr .~ gAddr
          & LnGRPC.perm .~ gPerm

instance C2.FromGrpc [Peer] LnGRPC.ListPeersResponse where
  fromGrpc x = sequence $ C2.fromGrpc <$> (x ^. LnGRPC.peers)
