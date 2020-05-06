{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
    hashifyAddInvoiceRequest,
  )
where

import Crypto.Hash.SHA256 (hash)
import Data.Aeson (FromJSON (..), ToJSON (..))
import Data.ByteString.Base64 (encode)
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import GHC.Generics (Generic)
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.Newtypes (AddIndex (..), PaymentRequest (..), RHash (..))
import LndClient.Utils (stdParseJSON, stdToJSON)

newtype AddInvoiceRequest
  = AddInvoiceRequest
      { result :: Invoice
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
hashifyAddInvoiceRequest x = x {result = updInvoice}
  where
    invoice = result x
    mh = decodeUtf8 . encode . hash . encodeUtf8 <$> memo invoice
    updInvoice = invoice {descriptionHash = mh}
