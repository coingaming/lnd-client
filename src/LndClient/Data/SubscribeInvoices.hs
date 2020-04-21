module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

import Data.Text (Text)

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe Text,
        settleIndex :: Maybe Text
      }
