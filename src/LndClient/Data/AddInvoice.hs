{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
where

import LndClient.Data.Newtypes
import LndClient.Import.External

data AddInvoiceRequest
  = AddInvoiceRequest
      { value :: MoneyAmount,
        descriptionHash :: Maybe ByteString,
        memo :: Maybe Text
      }
  deriving (Generic, Show)

data AddInvoiceResponse
  = AddInvoiceResponse
      { rHash :: RHash,
        paymentRequest :: PaymentRequest,
        addIndex :: AddIndex
      }
  deriving (Generic, Show, Eq)

hashifyAddInvoiceRequest :: AddInvoiceRequest -> AddInvoiceRequest
hashifyAddInvoiceRequest x = x {descriptionHash = mh}
  where
    mh = hash . encodeUtf8 <$> memo x
