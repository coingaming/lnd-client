module LndClient.Data.AddHodlInvoice
  ( AddHodlInvoiceRequest (..),
  )
where

import qualified InvoiceGrpc as GRPC
import LndClient.Import

data AddHodlInvoiceRequest
  = AddHodlInvoiceRequest
      { memo :: Maybe Text,
        hash :: RHash,
        valueMsat :: MSat,
        expiry :: Maybe Seconds
      }
  deriving (Eq, Show)

instance ToGrpc AddHodlInvoiceRequest GRPC.AddHoldInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (hash x)
      <*> toGrpc (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gHash gValue gExp =
        def
          { GRPC.addHoldInvoiceRequestMemo = gMemo,
            GRPC.addHoldInvoiceRequestHash = gHash,
            GRPC.addHoldInvoiceRequestValueMsat = gValue,
            GRPC.addHoldInvoiceRequestExpiry = gExp
          }
