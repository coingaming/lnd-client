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
import Data.Text.Encoding (decodeUtf8, encodeUtf8)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON, stdToJSON)

data AddInvoiceRequest
  = AddInvoiceRequest
      { memo :: Maybe Text,
        value :: Integer,
        descriptionHash :: Maybe Text
      }
  deriving (Generic, Show)

data AddInvoiceResponse
  = AddInvoiceResponse
      { rHash :: Text,
        paymentRequest :: Text,
        addIndex :: Text
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
