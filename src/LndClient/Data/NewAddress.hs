module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

newtype NewAddressResponse
  = NewAddressResponse
      { address :: Text
      }
  deriving (Show, Eq)

instance FromGrpc NewAddressResponse GRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse
      <$> fromGrpc (GRPC.newAddressResponseAddress x)
