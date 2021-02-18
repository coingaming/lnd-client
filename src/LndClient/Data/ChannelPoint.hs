module LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
    channelPointParser,
  )
where

import qualified Data.ByteString as BS (reverse)
import qualified Data.ByteString.Base16 as B16 (decode)
import qualified Data.ByteString.Char8 as C8 (split)
import qualified Data.Text as TS (unpack)
import LndClient.Import
import qualified LndGrpc as GRPC

data ChannelPoint
  = ChannelPoint
      { fundingTxId :: TxId 'Funding,
        outputIndex :: Vout 'Funding
      }
  deriving (Eq, Show)

instance FromGrpc ChannelPoint GRPC.ChannelPoint where
  fromGrpc x =
    ChannelPoint
      <$> fromGrpc (GRPC.channelPointFundingTxid x)
      <*> fromGrpc (GRPC.channelPointOutputIndex x)

instance ToGrpc ChannelPoint GRPC.ChannelPoint where
  toGrpc x =
    msg
      <$> toGrpc (fundingTxId x)
      <*> toGrpc (outputIndex x)
    where
      msg gFundingTxidBytes gOutputIndex =
        def
          { GRPC.channelPointFundingTxid =
              GRPC.ChannelPointFundingTxidFundingTxidBytes
                <$> gFundingTxidBytes,
            GRPC.channelPointOutputIndex =
              gOutputIndex
          }

channelPointParser :: Text -> Either LndError ChannelPoint
channelPointParser x =
  case C8.split ':' str of
    [txid, idxBS] ->
      case B16.decode txid of
        (txidHex, "") -> do
          idxTS <-
            first
              ( const $
                  FromGrpcError "Invalid ChannelPoint outputIndex"
              )
              $ decodeUtf8' idxBS
          ChannelPoint
            <$> (pure . TxId $ BS.reverse txidHex)
            <*> maybeToRight
              (FromGrpcError "Invalid ChannelPoint outputIndex")
              (readMaybe $ TS.unpack idxTS)
        _ ->
          Left $ FromGrpcError "Invalid ChannelPoint fundingTxidBytes"
    _ ->
      Left $ FromGrpcError "Invalid ChannelPoint text"
  where
    str = encodeUtf8 x
