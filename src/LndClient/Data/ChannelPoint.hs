{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.ChannelPoint
  ( ChannelPoint (..),
    channelPointParser,
  )
where

import qualified Data.ByteString as BS (reverse)
import qualified Data.ByteString.Base16 as B16 (decode)
import qualified Data.ByteString.Char8 as C8 (split)
import Data.ProtoLens.Message
import qualified Data.Text as TS (unpack)
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC
import qualified Proto.Lnrpc.Ln1 as Ln1
import qualified Proto.Lnrpc.Ln1_Fields as Ln1

data ChannelPoint = ChannelPoint
  { fundingTxId :: TxId 'Funding,
    outputIndex :: Vout 'Funding
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ChannelPoint

instance FromGrpc ChannelPoint LnGRPC.ChannelPoint where
  fromGrpc x =
    ChannelPoint
      <$> fromGrpc (x ^. LnGRPC.fundingTxidBytes)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)

instance ToGrpc ChannelPoint LnGRPC.ChannelPoint where
  toGrpc x =
    msg
      <$> toGrpc (fundingTxId x)
      <*> toGrpc (outputIndex x)
    where
      msg gFundingTxIdBytes gOutputIndex =
        defMessage
          & LnGRPC.fundingTxidBytes .~ gFundingTxIdBytes
          & LnGRPC.outputIndex .~ gOutputIndex

instance ToGrpc ChannelPoint Ln1.ExportChannelBackupRequest where
  toGrpc x =
    msg <$> toGrpc x
    where
      msg cp =
        defMessage
          & Ln1.chanPoint .~ cp

channelPointParser :: Text -> Either LndError ChannelPoint
channelPointParser x =
  case C8.split ':' str of
    [txid, idxBS] ->
      case B16.decode txid of
        Right txidHex -> do
          idxTS <-
            first
              ( const $
                  FromGrpcError "Invalid ChannelPoint outputIndex"
              )
              $ decodeUtf8' idxBS
          ChannelPoint (TxId $ BS.reverse txidHex)
            <$> maybeToRight
              (FromGrpcError "Invalid ChannelPoint outputIndex")
              (readMaybe $ TS.unpack idxTS)
        Left {} ->
          Left $ FromGrpcError "Invalid ChannelPoint fundingTxidBytes"
    _ ->
      Left $ FromGrpcError "Invalid ChannelPoint text"
  where
    str :: ByteString
    str = encodeUtf8 x
