{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.PsbtShim
  ( PsbtShim (..),
  )
where

import Data.ProtoLens.Message
import Lens.Micro
import LndClient.Data.Newtype
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as L
import qualified Proto.Lnrpc.Ln0_Fields as L

data PsbtShim = PsbtShim
  { pendingChanId :: PendingChannelId,
    basePsbt :: Maybe Psbt,
    noPublish :: Bool
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out PsbtShim

toBasePsbt :: Maybe Psbt -> Either LndError ByteString
toBasePsbt = maybe (Right "") toGrpc

instance ToGrpc PsbtShim L.PsbtShim where
  toGrpc x = msg <$> toGrpc (pendingChanId x) <*> toBasePsbt (basePsbt x) <*> pure (noPublish x)
    where
      msg pchid bp np = defMessage & L.pendingChanId .~ pchid & L.basePsbt .~ bp & L.noPublish .~ np

instance ToGrpc PsbtShim L.FundingShim where
  toGrpc x = msg <$> toGrpc (pendingChanId x) <*> toBasePsbt (basePsbt x) <*> pure (noPublish x)
    where
      msg pchid bp np =
        defMessage
          & L.maybe'psbtShim
            ?~ (defMessage & L.pendingChanId .~ pchid & L.basePsbt .~ bp & L.noPublish .~ np)
