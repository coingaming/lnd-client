{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FundingStateStep
  ( FundingStateStepRequest (..),
  )
where

import Data.ProtoLens.Message
import Lens.Micro
import LndClient.Data.FundingPsbtFinalize
import LndClient.Data.FundingPsbtVerify
import LndClient.Data.FundingShim
import LndClient.Data.FundingShimCancel
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

data FundingStateStepRequest
  = FundingStateStepShimCancelRequest FundingShimCancel
  | FundingStateStepPsbtFinalizeRequest FundingPsbtFinalize
  | FundingStateStepPsbtVerifyRequest FundingPsbtVerify
  | FundingStateStepShimRegister FundingShim
  deriving stock (Eq, Ord, Show, Generic)

instance Out FundingStateStepRequest

instance ToGrpc FundingStateStepRequest L.FundingTransitionMsg where
  toGrpc x = msg <$> mapTrigger x
    where
      mapTrigger :: FundingStateStepRequest -> Either LndError L.FundingTransitionMsg'Trigger
      mapTrigger (FundingStateStepShimCancelRequest t) = L.FundingTransitionMsg'ShimCancel <$> toGrpc t
      mapTrigger (FundingStateStepPsbtFinalizeRequest t) = L.FundingTransitionMsg'PsbtFinalize <$> toGrpc t
      mapTrigger (FundingStateStepPsbtVerifyRequest t) = L.FundingTransitionMsg'PsbtVerify <$> toGrpc t
      mapTrigger (FundingStateStepShimRegister t) = L.FundingTransitionMsg'ShimRegister <$> toGrpc t
      msg t = defMessage & L.maybe'trigger ?~ t
