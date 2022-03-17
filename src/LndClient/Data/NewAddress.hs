{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
    NewAddressRequest (..),
    AddressType (..),
  )
where

import Data.ProtoLens.Message
import Data.Text (pack)
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data NewAddressRequest = NewAddressRequest
  { addrType :: AddressType,
    account :: Maybe String
  }
  deriving (Show, Eq, Generic)

instance Out NewAddressRequest

data AddressType
  = WITNESS_PUBKEY_HASH
  | NESTED_PUBKEY_HASH
  | UNUSED_WITNESS_PUBKEY_HASH
  | UNUSED_NESTED_PUBKEY_HASH
  deriving (Show, Eq, Generic)

instance Out AddressType

newtype NewAddressResponse = NewAddressResponse
  { address :: Text
  }
  deriving (Show, Eq, Generic)

instance Out NewAddressResponse

instance ToGrpc NewAddressRequest LnGRPC.NewAddressRequest where
  toGrpc x =
    msg
      <$> toGrpc (addrType x)
      <*> toGrpc (pack <$> account x)
    where
      msg gAddrType gAccount =
        defMessage
          & LnGRPC.type' .~ gAddrType
          & LnGRPC.account .~ gAccount

instance ToGrpc AddressType LnGRPC.AddressType where
  toGrpc x =
    Right $ case x of
      WITNESS_PUBKEY_HASH -> LnGRPC.WITNESS_PUBKEY_HASH
      NESTED_PUBKEY_HASH -> LnGRPC.NESTED_PUBKEY_HASH
      UNUSED_WITNESS_PUBKEY_HASH -> LnGRPC.UNUSED_WITNESS_PUBKEY_HASH
      UNUSED_NESTED_PUBKEY_HASH -> LnGRPC.UNUSED_NESTED_PUBKEY_HASH

instance FromGrpc NewAddressResponse LnGRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse <$> Right (x ^. LnGRPC.address)
