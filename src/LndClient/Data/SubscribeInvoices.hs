{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data SubscribeInvoicesRequest = SubscribeInvoicesRequest
  { addIndex :: Maybe AddIndex,
    settleIndex :: Maybe SettleIndex
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out SubscribeInvoicesRequest

instance ToGrpc SubscribeInvoicesRequest LnGRPC.InvoiceSubscription where
  toGrpc x =
    msg
      <$> toGrpc (addIndex x)
      <*> toGrpc (settleIndex x)
    where
      msg gAddIndex gSettleIndex =
        defMessage
          & LnGRPC.addIndex .~ gAddIndex
          & LnGRPC.settleIndex .~ gSettleIndex
