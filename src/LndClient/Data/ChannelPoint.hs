module LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
  )
where

import Data.Either.Extra (maybeToEither)
import LndClient.Import
import qualified LndGrpc as GRPC

data ChannelPoint
  = ChannelPoint
      { fundingTxidBytes :: ByteString,
        outputIndex :: Word32
      }
  deriving (Eq)

instance FromGrpc ChannelPoint GRPC.ChannelPoint where
  fromGrpc x =
    ChannelPoint
      <$> maybeToEither (FromGrpcError "Empty channelPoingFundingTxid") (getBytes =<< GRPC.channelPointFundingTxid x)
      <*> fromGrpc (GRPC.channelPointOutputIndex x)

instance ToGrpc ChannelPoint GRPC.ChannelPoint where
  toGrpc x =
    msg <$> (toGrpc $ fundingTxidBytes x)
      <*> (toGrpc $ outputIndex x)
    where
      msg gFundingTxidBytes gOutputIndex =
        def
          { GRPC.channelPointFundingTxid = GRPC.ChannelPointFundingTxidFundingTxidBytes <$> gFundingTxidBytes,
            GRPC.channelPointOutputIndex = gOutputIndex
          }

getBytes :: GRPC.ChannelPointFundingTxid -> Maybe ByteString
getBytes txid = case txid of
  GRPC.ChannelPointFundingTxidFundingTxidBytes bs -> Just bs
  _ -> Nothing
