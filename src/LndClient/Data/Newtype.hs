{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Newtype
  ( AddIndex (..),
    SettleIndex (..),
    PaymentRequest (..),
    RHash (..),
    RPreimage (..),
    MoneyAmount (..),
    CipherSeedMnemonic (..),
    AezeedPassphrase (..),
    Seconds (..),
    NodePubKey (..),
    NodePubKeyHex (..),
    NodeLocation (..),
    GrpcTimeoutSeconds,
    newRHash,
    newRPreimage,
    newGrpcTimeout,
    unGrpcTimeout,
    defaultSyncGrpcTimeout,
    defaultAsyncGrpcTimeout,
    unHexPubKey,
  )
where

import Codec.QRCode as QR (ToText)
import qualified Crypto.Hash.SHA256 as SHA256 (hash)
import Crypto.Random (getRandomBytes)
import Data.Aeson (FromJSON (..))
import Data.ByteString.Base16 as B16 (decode)
import Data.ByteString.Char8 as C8
import Data.Text.Lazy as TL
import Data.Vector (fromList)
import qualified InvoiceGrpc as GRPC
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util
import qualified LndGrpc as GRPC
import Prelude (Show (..))

newtype NodePubKey = NodePubKey ByteString
  deriving (Eq, Show)

newtype NodePubKeyHex = NodePubKeyHex Text
  deriving (Eq, Show)

newtype NodeLocation = NodeLocation Text
  deriving (Eq, Show)

newtype AddIndex = AddIndex Word64
  deriving (PersistField, PersistFieldSql, Eq, Ord)

newtype SettleIndex = SettleIndex Word64
  deriving (PersistField, PersistFieldSql, Eq, Ord)

newtype PaymentRequest = PaymentRequest Text
  deriving (PersistField, PersistFieldSql, Eq, QR.ToText)

newtype RHash = RHash ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype RPreimage = RPreimage ByteString
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
  deriving (Eq, Ord, Show, FromJSON)

instance ToGrpc NodePubKey ByteString where
  toGrpc = Right . coerce

instance ToGrpc NodePubKeyHex Text where
  toGrpc = Right . coerce

instance ToGrpc NodeLocation Text where
  toGrpc = Right . coerce

--
-- TODO : smart constructors for NodePubKey, NodePubKeyHex and NodeLocation ???
--

instance FromGrpc NodePubKey ByteString where
  fromGrpc = Right . NodePubKey

instance FromGrpc NodePubKeyHex Text where
  fromGrpc = Right . NodePubKeyHex

instance FromGrpc NodeLocation Text where
  fromGrpc = Right . NodeLocation

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

instance FromGrpc RPreimage ByteString where
  fromGrpc = Right . RPreimage

instance FromGrpc AddIndex Word64 where
  fromGrpc = Right . AddIndex

instance FromGrpc SettleIndex Word64 where
  fromGrpc = Right . SettleIndex

instance FromGrpc PaymentRequest Text where
  fromGrpc = Right . PaymentRequest

instance FromGrpc PaymentRequest GRPC.AddHoldInvoiceResp where
  fromGrpc = fromGrpc . GRPC.addHoldInvoiceRespPaymentRequest

instance FromGrpc Seconds Int64 where
  fromGrpc =
    (Seconds <$>)
      . maybeToRight (FromGrpcError "Seconds overflow")
      . safeFromIntegral

instance FromGrpc RHash Text where
  fromGrpc x0 =
    case B16.decode $ encodeUtf8 x0 of
      (x1, "") -> Right $ RHash x1
      _ -> Left $ FromGrpcError "NON_HEX_RHASH"

instance FromGrpc RPreimage Text where
  fromGrpc x0 =
    case B16.decode $ encodeUtf8 x0 of
      (x1, "") -> Right $ RPreimage x1
      _ -> Left $ FromGrpcError "NON_HEX_RPREIMAGE"

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

instance ToGrpc RHash ByteString where
  toGrpc = Right . coerce

instance ToGrpc RHash GRPC.CancelInvoiceMsg where
  toGrpc x = GRPC.CancelInvoiceMsg <$> toGrpc x

instance ToGrpc RPreimage GRPC.SettleInvoiceMsg where
  toGrpc x = GRPC.SettleInvoiceMsg <$> toGrpc x

instance ToGrpc RPreimage ByteString where
  toGrpc = Right . coerce

instance ToGrpc PaymentRequest GRPC.PayReqString where
  toGrpc = Right . GRPC.PayReqString . coerce

instance ToGrpc RHash GRPC.PaymentHash where
  toGrpc = Right . GRPC.PaymentHash mempty . coerce

newRHash :: RPreimage -> RHash
newRHash = RHash . SHA256.hash . coerce

newRPreimage :: MonadIO m => m RPreimage
newRPreimage = RPreimage <$> liftIO (getRandomBytes 32)

newGrpcTimeout :: Int -> Maybe GrpcTimeoutSeconds
newGrpcTimeout x =
  if x > 0
    then Just $ GrpcTimeoutSeconds x
    else Nothing

unGrpcTimeout :: GrpcTimeoutSeconds -> Int
unGrpcTimeout = coerce

defaultSyncGrpcTimeout :: GrpcTimeoutSeconds
defaultSyncGrpcTimeout = GrpcTimeoutSeconds 60

defaultAsyncGrpcTimeout :: GrpcTimeoutSeconds
defaultAsyncGrpcTimeout = GrpcTimeoutSeconds 3600

unHexPubKey :: NodePubKeyHex -> Maybe NodePubKey
unHexPubKey x =
  case B16.decode $ encodeUtf8 (coerce x :: Text) of
    (y, "") -> Just $ NodePubKey y
    _ -> Nothing
