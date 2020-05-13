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
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Data.Newtypes
import LndClient.Utils (stdParseJSON, stdToJSON)
import Universum

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
    mh = decodeUtf8 . encode . hash . encodeUtf8 <$> memo x
