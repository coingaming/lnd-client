{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.NewAddress
  ( NewAddressResponse (..),
    NewAddressRequest (..),
    AddressType (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data NewAddressRequest = NewAddressRequest
  { addrType :: AddressType,
    account :: Maybe String
  }
  deriving stock (Show, Eq, Generic)

instance Out NewAddressRequest

data AddressType
  = WITNESS_PUBKEY_HASH
  | NESTED_PUBKEY_HASH
  | UNUSED_WITNESS_PUBKEY_HASH
  | UNUSED_NESTED_PUBKEY_HASH
  | UNKNOWN
  deriving stock (Show, Eq, Ord, Generic)

instance Out AddressType

newtype NewAddressResponse = NewAddressResponse
  { address :: Text
  }
  deriving newtype (Show, Eq)
  deriving stock (Generic)

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
    case x of
      WITNESS_PUBKEY_HASH -> Right LnGRPC.WITNESS_PUBKEY_HASH
      NESTED_PUBKEY_HASH -> Right LnGRPC.NESTED_PUBKEY_HASH
      UNUSED_WITNESS_PUBKEY_HASH -> Right LnGRPC.UNUSED_WITNESS_PUBKEY_HASH
      UNUSED_NESTED_PUBKEY_HASH -> Right LnGRPC.UNUSED_NESTED_PUBKEY_HASH
      UNKNOWN -> Left $ LndError "Unknown address type"

instance FromGrpc NewAddressResponse LnGRPC.NewAddressResponse where
  fromGrpc x =
    NewAddressResponse <$> Right (x ^. LnGRPC.address)

instance FromGrpc AddressType LnGRPC.AddressType where
  fromGrpc x = Right $ case x of
    LnGRPC.WITNESS_PUBKEY_HASH -> WITNESS_PUBKEY_HASH
    LnGRPC.NESTED_PUBKEY_HASH -> NESTED_PUBKEY_HASH
    LnGRPC.UNUSED_WITNESS_PUBKEY_HASH -> UNUSED_WITNESS_PUBKEY_HASH
    LnGRPC.UNUSED_NESTED_PUBKEY_HASH -> UNUSED_NESTED_PUBKEY_HASH
    _ -> UNKNOWN
