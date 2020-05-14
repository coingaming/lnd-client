module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import LndClient.Data.Newtypes
import LndClient.Import.External

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe AddIndex,
        settleIndex :: Maybe SettleIndex
      }
