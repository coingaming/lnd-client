{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Newtype
  ( AddIndex (..),
    SettleIndex (..),
    PaymentRequest (..),
    RHash (..),
    RPreimage (..),
    MSat (..),
    Sat (..),
    toSat,
    toMSat,
    CipherSeedMnemonic (..),
    AezeedPassphrase (..),
    Seconds (..),
    NodePubKey (..),
    NodeLocation (..),
    GrpcTimeoutSeconds,
    newRHash,
    newRPreimage,
    newGrpcTimeout,
    unGrpcTimeout,
    defaultSyncGrpcTimeout,
    defaultAsyncGrpcTimeout,
    TxId (..),
    Vout (..),
  )
where

import Codec.QRCode as QR (ToText)
import qualified Crypto.Hash.SHA256 as SHA256 (hash)
import Crypto.Random (getRandomBytes)
import Data.Aeson (FromJSON (..))
import Data.ByteString.Base16 as B16 (decode, encode)
import Data.ByteString.Char8 as C8
import qualified Data.Text.Internal as T
import Data.Text.Lazy as TL
import Data.Vector (fromList)
import qualified InvoiceGrpc as GRPC
import LndClient.Class
import qualified LndClient.Class2 as C2
import LndClient.Data.Kind
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util
import qualified LndGrpc as GRPC
import qualified Proto.InvoiceGrpc as LnGRPC
import qualified Proto.InvoiceGrpc_Fields as LnGRPC
import Prelude (Show)

newtype Vout (a :: TxKind) = Vout Word32
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)

newtype TxId (a :: TxKind) = TxId ByteString
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show)

newtype NodePubKey = NodePubKey ByteString
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show, Read)

newtype NodeLocation = NodeLocation Text
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show, Read)

newtype AddIndex = AddIndex Word64
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show)

newtype SettleIndex = SettleIndex Word64
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show)

newtype PaymentRequest = PaymentRequest Text
  deriving (PersistField, PersistFieldSql, Eq, QR.ToText, Show)

newtype RHash = RHash ByteString
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show)

newtype RPreimage = RPreimage ByteString
  deriving (PersistField, PersistFieldSql, Eq, Ord, Show)

newtype MSat = MSat Word64
  deriving
    ( PersistField,
      PersistFieldSql,
      Eq,
      Num,
      Ord,
      FromJSON,
      Show
    )

newtype Sat = Sat Word64
  deriving
    (Eq, Num, Ord, FromJSON, Show)

newtype CipherSeedMnemonic = CipherSeedMnemonic [Text]
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, Show)

newtype AezeedPassphrase = AezeedPassphrase Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, Show)

newtype Seconds = Seconds Word64
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, Show)

newtype GrpcTimeoutSeconds = GrpcTimeoutSeconds Int
  deriving (Eq, Ord, FromJSON, Show)

instance ToGrpc NodePubKey ByteString where
  toGrpc = Right . coerce

instance ToGrpc NodePubKey Text where
  toGrpc =
    bimap (const $ ToGrpcError "UTF8_DECODE_ERROR") TL.fromStrict
      . decodeUtf8'
      . B16.encode
      . coerce

instance ToGrpc NodeLocation Text where
  toGrpc = Right . coerce

--
-- TODO : smart constructors for NodePubKey and NodeLocation ???
--

instance FromGrpc (TxId a) ByteString where
  fromGrpc = Right . TxId

instance FromGrpc (TxId a) Text where
  fromGrpc = (TxId <$>) . txIdParser

instance FromGrpc (Vout a) Word32 where
  fromGrpc = Right . Vout

instance FromGrpc (TxId a) GRPC.ChannelPointFundingTxid where
  fromGrpc = \case
    GRPC.ChannelPointFundingTxidFundingTxidBytes x ->
      fromGrpc x
    GRPC.ChannelPointFundingTxidFundingTxidStr _ ->
      Left $ FromGrpcError "UNSUPPORTED_TXID_STR"

instance FromGrpc NodePubKey ByteString where
  fromGrpc = Right . NodePubKey

instance FromGrpc NodePubKey Text where
  fromGrpc x =
    case B16.decode $ encodeUtf8 x of
      Right y -> Right $ NodePubKey y
      Left {} -> Left $ FromGrpcError "NodePubKey hex decoding error"

instance FromGrpc NodeLocation Text where
  fromGrpc = Right . NodeLocation

instance ToGrpc (TxId a) ByteString where
  toGrpc = Right . coerce

instance ToGrpc (Vout a) Word32 where
  toGrpc = Right . coerce

instance ToGrpc AddIndex Word64 where
  toGrpc = Right . coerce

instance ToGrpc SettleIndex Word64 where
  toGrpc = Right . coerce

instance ToGrpc MSat Int64 where
  toGrpc x =
    maybeToRight
      (ToGrpcError "MSat overflow")
      $ safeFromIntegral (coerce x :: Word64)

instance FromGrpc MSat Int64 where
  fromGrpc x =
    maybeToRight
      (ToGrpcError "MSat overflow")
      $ MSat <$> safeFromIntegral x

instance FromGrpc MSat Word64 where
  fromGrpc x =
    maybeToRight
      (ToGrpcError "MSat overflow")
      $ MSat <$> safeFromIntegral x

instance ToGrpc Sat Int64 where
  toGrpc x =
    maybeToRight
      (ToGrpcError "Sat overflow")
      $ safeFromIntegral (coerce x :: Word64)

instance FromGrpc Sat Int64 where
  fromGrpc x =
    maybeToRight
      (ToGrpcError "Sat overflow")
      $ Sat <$> safeFromIntegral x

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

instance FromGrpc PaymentRequest T.Text where
  fromGrpc = Right . PaymentRequest . fromStrict

instance FromGrpc PaymentRequest GRPC.AddHoldInvoiceResp where
  fromGrpc = fromGrpc . GRPC.addHoldInvoiceRespPaymentRequest

instance C2.FromGrpc PaymentRequest LnGRPC.AddHoldInvoiceResp where
  fromGrpc x = fromGrpc (x ^. LnGRPC.paymentRequest)

instance FromGrpc Seconds Int64 where
  fromGrpc =
    (Seconds <$>)
      . maybeToRight (FromGrpcError "Seconds overflow")
      . safeFromIntegral

instance FromGrpc RHash Text where
  fromGrpc x0 =
    case B16.decode $ encodeUtf8 x0 of
      Right x1 -> Right $ RHash x1
      Left {} -> Left $ FromGrpcError "NON_HEX_RHASH"

instance FromGrpc RPreimage Text where
  fromGrpc x0 =
    case B16.decode $ encodeUtf8 x0 of
      Right x1 -> Right $ RPreimage x1
      Left {} -> Left $ FromGrpcError "NON_HEX_RPREIMAGE"

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

instance ToGrpc RHash GRPC.SubscribeSingleInvoiceRequest where
  toGrpc = Right . GRPC.SubscribeSingleInvoiceRequest . coerce

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

toSat :: MSat -> Either LndError Sat
toSat mSat = do
  let mVal :: Word64 = coerce mSat
  case divMod mVal 1000 of
    (val, 0) -> Right $ Sat val
    _ -> Left $ ToGrpcError ("Cannot convert " <> show mVal <> " to Sat")

toMSat :: Sat -> MSat
toMSat sat = MSat $ 1000 * coerce sat
