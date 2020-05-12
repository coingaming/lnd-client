module LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
where

--import Data.Text (Text)
import Data.Word (Word64)

--import LndClient.Data.Newtypes (AddIndex (..))

data SubscribeInvoicesRequest
  = SubscribeInvoicesRequest
      { addIndex :: Maybe Word64,
        settleIndex :: Maybe Word64
      }
