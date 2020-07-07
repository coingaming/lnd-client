module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data AddInvoiceRequest
  = AddInvoiceRequest
      { value :: MoneyAmount,
        memo :: Maybe Text,
        expiry :: Maybe Seconds
      }
  deriving (Eq)

data AddInvoiceResponse
  = AddInvoiceResponse
      { rHash :: RHash,
        paymentRequest :: PaymentRequest,
        addIndex :: AddIndex
      }
  deriving (Eq)

instance ToGrpc AddInvoiceRequest GRPC.Invoice where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (value x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gValue gExp =
        def
          { GRPC.invoiceMemo = gMemo,
            GRPC.invoiceValue = gValue,
            GRPC.invoiceExpiry = gExp
          }

instance FromGrpc AddInvoiceResponse GRPC.AddInvoiceResponse where
  fromGrpc x =
    AddInvoiceResponse
      <$> fromGrpc (GRPC.addInvoiceResponseRHash x)
      <*> fromGrpc (GRPC.addInvoiceResponsePaymentRequest x)
      <*> fromGrpc (GRPC.addInvoiceResponseAddIndex x)
