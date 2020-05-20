module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
  )
where

import Data.Text.Lazy as TL
import LndClient.Import
import qualified LndGrpc as GRPC

newtype NewAddressResponse
  = NewAddressResponse
      { address :: TL.Text
      }
  deriving (Show, Eq)

instance FromGrpc NewAddressResponse GRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse
      <$> fromGrpc (GRPC.newAddressResponseAddress x)
