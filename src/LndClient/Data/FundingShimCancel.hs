{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundingShimCancel (FundingShimCancel (..)) where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

newtype FundingShimCancel = FundingShimCancel
  { pendingChanId :: PendingChannelId
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundingShimCancel

instance ToGrpc FundingShimCancel L.FundingShimCancel where
  toGrpc x = msg <$> toGrpc (pendingChanId x)
    where
      msg pci =
        defMessage & L.pendingChanId .~ pci
