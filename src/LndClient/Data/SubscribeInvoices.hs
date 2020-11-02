module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
  deriving (Eq, Ord)

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
