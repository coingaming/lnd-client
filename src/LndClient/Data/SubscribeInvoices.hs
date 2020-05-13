module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import LndClient.Data.Newtypes

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
