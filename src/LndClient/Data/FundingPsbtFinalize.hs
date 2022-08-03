{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundingPsbtFinalize (FundingPsbtFinalize (..)) where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

data FundingPsbtFinalize = FundingPsbtFinalize
  { signedPsbt :: Psbt,
    pendingChanId :: PendingChannelId,
    finalRawTx :: RawTx
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundingPsbtFinalize

instance ToGrpc FundingPsbtFinalize L.FundingPsbtFinalize where
  toGrpc x = msg <$> toGrpc (signedPsbt x) <*> toGrpc (pendingChanId x) <*> toGrpc (finalRawTx x)
    where
      msg sp pci frt =
        defMessage & L.signedPsbt .~ sp & L.pendingChanId .~ pci & L.finalRawTx .~ frt
