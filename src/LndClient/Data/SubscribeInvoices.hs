{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
  deriving (Eq, Ord, Show)

instance ToGrpc SubscribeInvoicesRequest GRPC.InvoiceSubscription where
  toGrpc x =
    msg
      <$> toGrpc (addIndex x)
      <*> toGrpc (settleIndex x)
    where
      msg gAddIndex gSettleIndex =
        def
          { GRPC.invoiceSubscriptionAddIndex = gAddIndex,
            GRPC.invoiceSubscriptionSettleIndex = gSettleIndex
          }

instance C2.ToGrpc SubscribeInvoicesRequest LnGRPC.InvoiceSubscription where
  toGrpc x =
    msg
      <$> toGrpc (addIndex x)
      <*> toGrpc (settleIndex x)
    where
      msg gAddIndex gSettleIndex =
        defMessage
          & LnGRPC.addIndex .~ gAddIndex
          & LnGRPC.settleIndex .~ gSettleIndex
