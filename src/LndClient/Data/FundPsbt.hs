{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundPsbt
  ( FundPsbtRequest (..),
    FundPsbtResponse (..),
    TxTemplate (..),
    Fee (..),
    UtxoLease (..),
  )
where

import Data.ProtoLens.Message
import Lens.Micro
import LndClient.Data.OutPoint
import LndClient.Import
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W

data TxTemplate = TxTemplate
  { inputs :: [OutPoint],
    outputs :: Map Text Msat
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out TxTemplate

instance ToGrpc TxTemplate W.FundPsbtRequest'Template where
  toGrpc x = W.FundPsbtRequest'Raw <$> (msg <$> mapM toGrpc (inputs x) <*> mapM toGrpcSat (outputs x))
    where
      msg i o = defMessage & W.inputs .~ i & W.outputs .~ o

data Fee = TargetConf Word32 | SatPerVbyte Word64
  deriving stock (Eq, Ord, Show, Generic)

instance Out Fee

data FundPsbtRequest = FundPsbtRequest
  { account :: Text,
    template :: TxTemplate,
    minConfs :: Int32,
    spendUnconfirmed :: Bool,
    fee :: Fee
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundPsbtRequest

instance ToGrpc FundPsbtRequest W.FundPsbtRequest where
  toGrpc x =
    msg
      (account x)
      (spendUnconfirmed x)
      (feeMap $ fee x)
      <$> toGrpc (template x)
    where
      feeMap (TargetConf n) = W.FundPsbtRequest'TargetConf n
      feeMap (SatPerVbyte n) = W.FundPsbtRequest'SatPerVbyte n
      msg a s f t =
        defMessage
          & W.account .~ a
          & W.maybe'template ?~ t
          & W.maybe'fees ?~ f
          & W.spendUnconfirmed .~ s

data UtxoLease = UtxoLease
  { id :: ByteString,
    outpoint :: OutPoint,
    expiration :: Word64
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out UtxoLease

instance FromGrpc UtxoLease W.UtxoLease where
  fromGrpc x =
    UtxoLease
      <$> fromGrpc (x ^. W.id)
      <*> fromGrpc (x ^. W.outpoint)
      <*> fromGrpc (x ^. W.expiration)

data FundPsbtResponse = FundPsbtResponse
  { fundedPsbt :: ByteString,
    changeOutputIndex :: Int32,
    lockedUtxos :: [UtxoLease]
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundPsbtResponse

instance FromGrpc FundPsbtResponse W.FundPsbtResponse where
  fromGrpc x =
    FundPsbtResponse
      <$> fromGrpc (x ^. W.fundedPsbt)
      <*> fromGrpc (x ^. W.changeOutputIndex)
      <*> mapM fromGrpc (x ^. W.lockedUtxos)
