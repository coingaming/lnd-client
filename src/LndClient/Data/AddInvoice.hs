module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data AddInvoiceRequest
  = AddInvoiceRequest
      { value :: MoneyAmount,
        descriptionHash :: Maybe ByteString,
        memo :: Maybe Text
      }
  deriving (Eq)

data AddInvoiceResponse
  = AddInvoiceResponse
      { rHash :: RHash,
        paymentRequest :: PaymentRequest,
        addIndex :: AddIndex
      }
  deriving (Eq)

--
-- TODO : move this to smart constructor
-- of AddInvoiceRequest and hide (don't export)
-- default unsafe constructor
--
hashifyAddInvoiceRequest :: AddInvoiceRequest -> AddInvoiceRequest
hashifyAddInvoiceRequest x = x {descriptionHash = mh}
  where
    mh = hash . encodeUtf8 <$> memo x

instance ToGrpc AddInvoiceRequest GRPC.Invoice where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (value x)
      <*> toGrpc (descriptionHash x)
    where
      msg gMemo gValue gDescH =
        def
          { GRPC.invoiceMemo = gMemo,
            GRPC.invoiceValue = gValue,
            GRPC.invoiceDescriptionHash = gDescH
          }

instance FromGrpc AddInvoiceResponse GRPC.AddInvoiceResponse where
  fromGrpc x =
    AddInvoiceResponse
      <$> fromGrpc (GRPC.addInvoiceResponseRHash x)
      <*> fromGrpc (GRPC.addInvoiceResponsePaymentRequest x)
      <*> fromGrpc (GRPC.addInvoiceResponseAddIndex x)
