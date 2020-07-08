{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListChannels
  ( ListChannelsRequest (..),
    Channel (..),
  )
where

import qualified Data.ByteString as BS (reverse)
import qualified Data.ByteString.Base16 as B16 (decode)
import qualified Data.ByteString.Char8 as C8 (split)
import qualified Data.Text as TS (unpack)
import LndClient.Data.ChannelPoint (ChannelPoint (..))
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

data Channel
  = Channel
      { remotePubkey :: Text,
        channelPoint :: ChannelPoint,
        localBalance :: MoneyAmount,
        remoteBalance :: MoneyAmount
      }
  deriving (Generic)

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

instance FromGrpc Channel GRPC.Channel where
  fromGrpc x =
    Channel
      <$> fromGrpc (GRPC.channelRemotePubkey x)
      <*> channelPointParser (GRPC.channelChannelPoint x)
      <*> fromGrpc (GRPC.channelLocalBalance x)
      <*> fromGrpc (GRPC.channelRemoteBalance x)

instance FromGrpc [Channel] GRPC.ListChannelsResponse where
  fromGrpc = fromGrpc . GRPC.listChannelsResponseChannels

channelPointParser :: Text -> Either LndError ChannelPoint
channelPointParser x =
  case C8.split ':' str of
    [txid, idxBS] ->
      case B16.decode txid of
        (txidHex, "") -> do
          idxTS <-
            first (const $ FromGrpcError "Invalid ChannelPoint outputIndex") $
              decodeUtf8' idxBS
          ChannelPoint
            <$> pure (BS.reverse txidHex)
            <*> maybeToRight
              (FromGrpcError "Invalid ChannelPoint outputIndex")
              (readMaybe $ TS.unpack idxTS)
        _ ->
          Left $ FromGrpcError "Invalid ChannelPoint fundingTxidBytes"
    _ ->
      Left $ FromGrpcError "Invalid ChannelPoint text"
  where
    str = encodeUtf8 x
