{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundingPsbtVerify (FundingPsbtVerify (..)) where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

data FundingPsbtVerify = FundingPsbtVerify
  { fundedPsbt :: Psbt,
    pendingChanId :: PendingChannelId,
    skipFinalize :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundingPsbtVerify

instance ToGrpc FundingPsbtVerify L.FundingPsbtVerify where
  toGrpc x = msg <$> toGrpc (fundedPsbt x) <*> toGrpc (pendingChanId x) <*> pure (skipFinalize x)
    where
      msg fp pci sf =
        defMessage & L.fundedPsbt .~ fp & L.pendingChanId .~ pci & L.skipFinalize .~ sf
