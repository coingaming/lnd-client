{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListChannels
  ( ListChannelsRequest (..),
    ListChannelsResponse (..),
    Channel (..),
  )
where

import qualified Data.Text.Lazy as TL (Text)
import LndClient.Import
import qualified LndGrpc as GRPC

data ListChannelsRequest
  = ListChannelsRequest
      { activeOnly :: Bool,
        inactiveOnly :: Bool,
        publicOnly :: Bool,
        privateOnly :: Bool,
        peer :: Maybe ByteString
      }
  deriving (Generic, Show)

data ListChannelsResponse
  = ListChannelsResponse
      { channels :: [Channel]
      }
  deriving (Generic, Show)

--
--TODO use ChannelPoint type here, parse string and do sufficient decodings
--
data Channel
  = Channel
      { remotePubkey :: TL.Text,
        channelPoint :: TL.Text
      }
  deriving (Generic, Show)

instance ToGrpc ListChannelsRequest GRPC.ListChannelsRequest where
  toGrpc x =
    msg
      <$> (toGrpc $ activeOnly x)
      <*> (toGrpc $ inactiveOnly x)
      <*> (toGrpc $ privateOnly x)
      <*> (toGrpc $ publicOnly x)
      <*> (toGrpc $ peer x)
    where
      msg gActiveOnly gInactiveOnly gPrivateOnly gPublicOnly gPeer =
        def
          { GRPC.listChannelsRequestActiveOnly = gActiveOnly,
            GRPC.listChannelsRequestInactiveOnly = gInactiveOnly,
            GRPC.listChannelsRequestPrivateOnly = gPrivateOnly,
            GRPC.listChannelsRequestPublicOnly = gPublicOnly,
            GRPC.listChannelsRequestPeer = gPeer
          }

instance FromGrpc ListChannelsResponse GRPC.ListChannelsResponse where
  fromGrpc x =
    ListChannelsResponse
      <$> (fromGrpc $ GRPC.listChannelsResponseChannels x)

instance FromGrpc Channel GRPC.Channel where
  fromGrpc x =
    Channel
      <$> (fromGrpc $ GRPC.channelRemotePubkey x)
      <*> (fromGrpc $ GRPC.channelChannelPoint x)
