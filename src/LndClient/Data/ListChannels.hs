{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListChannels
  ( ListChannelsRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data ListChannelsRequest = ListChannelsRequest
  { activeOnly :: Bool,
    inactiveOnly :: Bool,
    publicOnly :: Bool,
    privateOnly :: Bool,
    peer :: Maybe NodePubKey
  }
  deriving stock (Generic, Show)

instance Out ListChannelsRequest

instance ToGrpc ListChannelsRequest LnGRPC.ListChannelsRequest where
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
