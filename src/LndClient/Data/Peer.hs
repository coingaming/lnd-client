{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Peer
  ( Peer (..),
    LightningAddress (..),
    ConnectPeerRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data Peer = Peer
  { pubKey :: NodePubKey,
    address :: NodeLocation
  }
  deriving stock (Eq, Show, Generic)

instance Out Peer

instance FromGrpc Peer LnGRPC.Peer where
  fromGrpc x =
    Peer
      <$> fromGrpc (x ^. LnGRPC.pubKey)
      <*> fromGrpc (x ^. LnGRPC.address)

data LightningAddress = LightningAddress
  { pubkey :: NodePubKey,
    host :: NodeLocation
  }
  deriving stock (Eq, Show, Read, Generic)

instance Out LightningAddress

instance ToGrpc LightningAddress LnGRPC.LightningAddress where
  toGrpc x =
    msg
      <$> toGrpc (pubkey x)
      <*> toGrpc (host x)
    where
      msg gPubkey gHost =
        defMessage
          & LnGRPC.pubkey .~ gPubkey
          & LnGRPC.host .~ gHost

data ConnectPeerRequest = ConnectPeerRequest
  { addr :: LightningAddress,
    perm :: Bool
  }
  deriving stock (Eq, Show, Generic)

instance Out ConnectPeerRequest

instance ToGrpc ConnectPeerRequest LnGRPC.ConnectPeerRequest where
  toGrpc x =
    msg
      <$> toGrpc (addr x)
      <*> toGrpc (perm x)
    where
      msg gAddr gPerm =
        defMessage
          & LnGRPC.addr .~ gAddr
          & LnGRPC.perm .~ gPerm

instance FromGrpc [Peer] LnGRPC.ListPeersResponse where
  fromGrpc x = mapM fromGrpc (x ^. LnGRPC.peers)
