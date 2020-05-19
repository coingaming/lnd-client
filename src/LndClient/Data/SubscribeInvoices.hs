module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import LndClient.Import

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
