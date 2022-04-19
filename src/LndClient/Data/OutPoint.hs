module LndClient.Data.OutPoint (OutPoint (..)) where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Lnrpc.Ln0_Fields as LnGRPC

data OutPoint = OutPoint
  { txid :: ByteString,
    outputIndex :: Word32
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out OutPoint

instance ToGrpc OutPoint LnGRPC.OutPoint where
  toGrpc x =
    Right $
      defMessage
        & LnGRPC.txidBytes .~ txid x
        & LnGRPC.outputIndex .~ outputIndex x

instance FromGrpc OutPoint LnGRPC.OutPoint where
  fromGrpc x =
    OutPoint
      <$> fromGrpc (x ^. LnGRPC.txidBytes)
      <*> fromGrpc (x ^. LnGRPC.outputIndex)
