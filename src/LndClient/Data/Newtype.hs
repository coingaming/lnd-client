{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Newtype
  ( AddIndex (..),
    SettleIndex (..),
    PaymentRequest (..),
    RHash (..),
    MoneyAmount (..),
    CipherSeedMnemonic (..),
    AezeedPassphrase (..),
  )
where

import Codec.QRCode as QR (ToText)
import Data.Vector (fromList)
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util (safeFromIntegral)

newtype AddIndex = AddIndex Word64
  deriving (PersistField, PersistFieldSql, Show, Eq)

newtype SettleIndex = SettleIndex Word64
  deriving (PersistField, PersistFieldSql, Show, Eq)

newtype PaymentRequest = PaymentRequest Text
  deriving (PersistField, PersistFieldSql, Show, Eq, QR.ToText)

newtype RHash = RHash ByteString
  deriving (PersistField, PersistFieldSql, Show, Eq)

newtype MoneyAmount = MoneyAmount Word64
  deriving (PersistField, PersistFieldSql, Show, Eq)

newtype CipherSeedMnemonic = CipherSeedMnemonic [Text]
  deriving (PersistField, PersistFieldSql, Eq)

newtype AezeedPassphrase = AezeedPassphrase ByteString
  deriving (PersistField, PersistFieldSql, Eq)

instance ToGrpc AddIndex Word64 where
  toGrpc = Right . coerce

instance ToGrpc SettleIndex Word64 where
  toGrpc = Right . coerce

instance ToGrpc MoneyAmount Int64 where
  toGrpc x =
    maybeToRight
      (ToGrpcError "MoneyAmount overflow")
      $ safeFromIntegral (coerce x :: Word64)

instance FromGrpc MoneyAmount Int64 where
  fromGrpc x =
    maybeToRight
      (ToGrpcError "MoneyAmount overflow")
      $ MoneyAmount <$> safeFromIntegral x

instance FromGrpc RHash ByteString where
  fromGrpc = Right . RHash

instance FromGrpc AddIndex Word64 where
  fromGrpc = Right . AddIndex

instance FromGrpc SettleIndex Word64 where
  fromGrpc = Right . SettleIndex

instance FromGrpc PaymentRequest Text where
  fromGrpc = Right . PaymentRequest

instance ToGrpc PaymentRequest Text where
  toGrpc x = Right (coerce x :: Text)

instance ToGrpc CipherSeedMnemonic (Vector Text) where
  toGrpc = Right . fromList . coerce

instance ToGrpc AezeedPassphrase ByteString where
  toGrpc = Right . coerce
