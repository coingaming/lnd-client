{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundingShim (FundingShim (..)) where

import Data.ProtoLens.Message
import Lens.Micro
import LndClient.Data.ChannelPoint
import qualified LndClient.Data.PsbtShim as PS
import qualified LndClient.Data.SignMessage as KL
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

data KeyDescriptor = KeyDescriptor
  { rawKeyBytes :: ByteString,
    keyLoc :: KL.KeyLocator
  }
  deriving stock (Eq, Show, Ord, Generic)

instance ToGrpc KeyDescriptor L.KeyDescriptor where
  toGrpc x = msg <$> toGrpc (rawKeyBytes x) <*> toGrpc (keyLoc x)
    where
      msg r k = defMessage & L.rawKeyBytes .~ r & L.keyLoc .~ k

instance Out KeyDescriptor

data ChanPointShim = ChanPointShim
  { amt :: Msat,
    chanPoint :: Maybe ChannelPoint,
    localKey :: Maybe KeyDescriptor,
    remoteKey :: NodePubKey,
    pendingChanId :: PendingChannelId,
    thawHeight :: Word32
  }
  deriving stock (Eq, Show, Ord, Generic)

instance ToGrpc ChanPointShim L.ChanPointShim where
  toGrpc x =
    msg
      <$> toGrpcSat (amt x)
      <*> toGrpcMaybe (chanPoint x)
      <*> toGrpcMaybe (localKey x)
      <*> toGrpc (remoteKey x)
      <*> toGrpc (pendingChanId x)
      <*> toGrpc (thawHeight x)
    where
      msg a c l r p t =
        defMessage
          & L.amt .~ a
          & L.maybe'chanPoint .~ c
          & L.maybe'localKey .~ l
          & L.remoteKey .~ r
          & L.pendingChanId .~ p
          & L.thawHeight .~ t

instance Out ChanPointShim

data FundingShim
  = FundingShim'ChanPointShim ChanPointShim
  | FundingShim'PsbtShim PS.PsbtShim
  deriving stock (Eq, Show, Ord, Generic)

instance Out FundingShim

instance ToGrpc FundingShim L.FundingShim where
  toGrpc x = msg <$> mapShim x
    where
      mapShim (FundingShim'ChanPointShim f) = L.FundingShim'ChanPointShim <$> toGrpc f
      mapShim (FundingShim'PsbtShim f) = L.FundingShim'PsbtShim <$> toGrpc f
      msg s = defMessage & L.maybe'shim ?~ s
