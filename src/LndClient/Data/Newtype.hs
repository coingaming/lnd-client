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
    Seconds (..),
    GrpcTimeoutSeconds,
    newGrpcTimeout,
    unGrpcTimeout,
    defaultSyncGrpcTimeout,
    defaultAsyncGrpcTimeout,
  )
where

import Codec.QRCode as QR (ToText)
import Data.Aeson (FromJSON (..))
import Data.ByteString.Char8 as C8
import Data.Vector (fromList)
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util
import Prelude (Show (..))

newtype AddIndex = AddIndex Word64
  deriving (PersistField, PersistFieldSql, Eq)

newtype SettleIndex = SettleIndex Word64
  deriving (PersistField, PersistFieldSql, Eq)

newtype PaymentRequest = PaymentRequest Text
  deriving (PersistField, PersistFieldSql, Eq, QR.ToText)

newtype RHash = RHash ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype MoneyAmount = MoneyAmount Word64
  deriving (PersistField, PersistFieldSql, Eq, Num, Ord, FromJSON)

newtype CipherSeedMnemonic = CipherSeedMnemonic [Text]
  deriving (PersistField, PersistFieldSql, Eq, FromJSON)

newtype AezeedPassphrase = AezeedPassphrase Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON)

newtype Seconds = Seconds Word64
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, Show)

newtype GrpcTimeoutSeconds = GrpcTimeoutSeconds Int
  deriving (Eq, Ord, Show)

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

instance Show RHash where
  show = ("RHash " <>) . showB64BS . coerce

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

instance ToGrpc Seconds Int64 where
  toGrpc x =
    maybeToRight
      (ToGrpcError "Seconds overflow")
      $ safeFromIntegral (coerce x :: Word64)

instance ToGrpc CipherSeedMnemonic (Vector Text) where
  toGrpc = Right . fromList . coerce

instance ToGrpc AezeedPassphrase ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

newGrpcTimeout :: Int -> Maybe GrpcTimeoutSeconds
newGrpcTimeout x =
  if x > 0
    then Just $ GrpcTimeoutSeconds x
    else Nothing

unGrpcTimeout :: GrpcTimeoutSeconds -> Int
unGrpcTimeout = coerce

defaultSyncGrpcTimeout :: GrpcTimeoutSeconds
defaultSyncGrpcTimeout = GrpcTimeoutSeconds 5

defaultAsyncGrpcTimeout :: GrpcTimeoutSeconds
defaultAsyncGrpcTimeout = GrpcTimeoutSeconds 3600
