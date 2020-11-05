{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Channel
  ( Channel (..),
  )
where

import LndClient.Data.ChannelPoint (ChannelPoint (..), channelPointParser)
import LndClient.Import
import qualified LndGrpc as GRPC

data Channel
  = Channel
      { remotePubkey :: NodePubKey,
        channelPoint :: ChannelPoint,
        localBalance :: MoneyAmount,
        remoteBalance :: MoneyAmount
      }
  deriving (Eq)

instance FromGrpc Channel GRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (GRPC.channelRemotePubkey x)
      <*> channelPointParser (GRPC.channelChannelPoint x)
      <*> fromGrpc (GRPC.channelLocalBalance x)
      <*> fromGrpc (GRPC.channelRemoteBalance x)

instance FromGrpc [Channel] GRPC.ListChannelsResponse where
  fromGrpc = fromGrpc . GRPC.listChannelsResponseChannels