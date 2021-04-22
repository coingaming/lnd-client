{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListChannels
  ( ListChannelsRequest (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

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
