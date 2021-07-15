{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListChannels
  ( ListChannelsRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data ListChannelsRequest
  = ListChannelsRequest
      { activeOnly :: Bool,
        inactiveOnly :: Bool,
        publicOnly :: Bool,
        privateOnly :: Bool,
        peer :: Maybe NodePubKey
      }
  deriving (Generic, Show)

instance ToGrpc ListChannelsRequest GRPC.ListChannelsRequest where
  toGrpc x =
    msg
      <$> toGrpc (activeOnly x)
      <*> toGrpc (inactiveOnly x)
      <*> toGrpc (privateOnly x)
      <*> toGrpc (publicOnly x)
      <*> toGrpc (peer x)
    where
      msg gActiveOnly gInactiveOnly gPrivateOnly gPublicOnly gPeer =
        def
          { GRPC.listChannelsRequestActiveOnly = gActiveOnly,
            GRPC.listChannelsRequestInactiveOnly = gInactiveOnly,
            GRPC.listChannelsRequestPrivateOnly = gPrivateOnly,
            GRPC.listChannelsRequestPublicOnly = gPublicOnly,
            GRPC.listChannelsRequestPeer = gPeer
          }

instance C2.ToGrpc ListChannelsRequest LnGRPC.ListChannelsRequest where
  toGrpc x =
    msg
      <$> toGrpc (activeOnly x)
      <*> toGrpc (inactiveOnly x)
      <*> toGrpc (privateOnly x)
      <*> toGrpc (publicOnly x)
      <*> toGrpc (peer x)
    where
      msg gActiveOnly gInactiveOnly gPrivateOnly gPublicOnly gPeer =
        defMessage
          & LnGRPC.activeOnly .~ gActiveOnly
          & LnGRPC.inactiveOnly .~ gInactiveOnly
          & LnGRPC.privateOnly .~ gPrivateOnly
          & LnGRPC.publicOnly .~ gPublicOnly
          & LnGRPC.peer .~ gPeer
