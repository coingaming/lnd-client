{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
    NewAddressRequest (..),
    AddressType (..),
  )
where

import Data.ProtoLens.Message
import Data.Text (pack)
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data NewAddressRequest
  = NewAddressRequest
      { addrType :: AddressType,
        account :: Maybe String
      }
  deriving (Show, Eq)

data AddressType
  = WITNESS_PUBKEY_HASH
  | NESTED_PUBKEY_HASH
  | UNUSED_WITNESS_PUBKEY_HASH
  | UNUSED_NESTED_PUBKEY_HASH
  deriving (Show, Eq)

newtype NewAddressResponse
  = NewAddressResponse
      { address :: Text
      }
  deriving (Show, Eq)

instance FromGrpc NewAddressResponse GRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse
      <$> fromGrpc (GRPC.newAddressResponseAddress x)

instance C2.ToGrpc NewAddressRequest LnGRPC.NewAddressRequest where
  toGrpc x =
    msg
      <$> C2.toGrpc (addrType x)
      <*> toGrpc (pack <$> account x)
    where
      msg gAddrType gAccount =
        defMessage
          & LnGRPC.type' .~ gAddrType
          & LnGRPC.account .~ gAccount

instance C2.ToGrpc AddressType LnGRPC.AddressType where
  toGrpc x =
    case x of
      WITNESS_PUBKEY_HASH -> Right LnGRPC.WITNESS_PUBKEY_HASH
      NESTED_PUBKEY_HASH -> Right LnGRPC.NESTED_PUBKEY_HASH
      UNUSED_WITNESS_PUBKEY_HASH -> Right LnGRPC.UNUSED_WITNESS_PUBKEY_HASH
      UNUSED_NESTED_PUBKEY_HASH -> Right LnGRPC.UNUSED_NESTED_PUBKEY_HASH

instance C2.FromGrpc NewAddressResponse LnGRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse <$> Right (fromStrict $ x ^. LnGRPC.address)
