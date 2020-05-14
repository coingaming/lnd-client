{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
where

import Data.ByteString.Base64 as B64 (encode)
import LndClient.Data.Newtypes
import LndClient.Import.External
import LndClient.Utils (stdParseJSON, stdToJSON)

data AddInvoiceRequest
  = AddInvoiceRequest
      { value :: MoneyAmount,
        descriptionHash :: Maybe Text,
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

instance ToJSON AddInvoiceRequest where
  toJSON = stdToJSON

instance FromJSON AddInvoiceResponse where
  parseJSON = stdParseJSON

hashifyAddInvoiceRequest :: AddInvoiceRequest -> AddInvoiceRequest
hashifyAddInvoiceRequest x = x {descriptionHash = mh}
  where
    mh = decodeUtf8 . B64.encode . hash . encodeUtf8 <$> memo x
