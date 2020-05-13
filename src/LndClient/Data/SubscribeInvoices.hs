module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import LndClient.Data.Newtypes
import Universum

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
