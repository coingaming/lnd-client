module LndClient.Data.OutPoint
  (OutPoint(..))
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data OutPoint = OutPoint {
  txid :: ByteString,
  outputIndex :: Word32
} deriving (Eq, Ord, Show, Generic)

instance Out OutPoint

instance ToGrpc OutPoint LnGRPC.OutPoint where
  toGrpc x = Right $ defMessage
    & LnGRPC.txidBytes .~ txid x
    & LnGRPC.txidStr .~ txIdHex (txid x)
    & LnGRPC.outputIndex .~ outputIndex x

instance FromGrpc OutPoint LnGRPC.OutPoint where
  fromGrpc x = OutPoint
    <$> fromGrpc (x ^. LnGRPC.txidBytes)
    <*> fromGrpc (x ^. LnGRPC.outputIndex)
