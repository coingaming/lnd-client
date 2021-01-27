{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.Channel
  ( Channel (..),
  )
where

import LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
    channelPointParser,
  )
import LndClient.Import
import qualified LndGrpc as GRPC

data Channel
  = Channel
      { remotePubkey :: NodePubKey,
        channelPoint :: ChannelPoint,
        capacity :: MoneyAmount,
        localBalance :: MoneyAmount,
        remoteBalance :: MoneyAmount,
        commitFee :: MoneyAmount,
        active :: Bool
      }
  deriving (Eq, Show)

instance FromGrpc Channel GRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (GRPC.channelRemotePubkey x)
      <*> channelPointParser (GRPC.channelChannelPoint x)
      <*> fromGrpc (GRPC.channelCapacity x)
      <*> fromGrpc (GRPC.channelLocalBalance x)
      <*> fromGrpc (GRPC.channelRemoteBalance x)
      <*> fromGrpc (GRPC.channelCommitFee x)
      <*> fromGrpc (GRPC.channelActive x)

instance FromGrpc [Channel] GRPC.ListChannelsResponse where
  fromGrpc = fromGrpc . GRPC.listChannelsResponseChannels
