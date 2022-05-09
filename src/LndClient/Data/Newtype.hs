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
    toGrpcSat,
    toGrpcMSat,
    fromGrpcSat,
    fromGrpcMSat,
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
    ChanId (..),
  )
where

import Codec.QRCode as QR (ToText)
import qualified Crypto.Hash.SHA256 as SHA256 (hash)
import Crypto.Random (getRandomBytes)
import Data.ByteString.Base16 as B16 (decode, encode)
import Data.ByteString.Char8 as C8
import Data.ProtoLens.Message
import LndClient.Class
import LndClient.Data.Kind
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util
import qualified Proto.Invoicesrpc.Invoices as IGrpc
import qualified Proto.Invoicesrpc.Invoices_Fields as IGrpc
import qualified Proto.Lnrpc.Ln1 as LnGrpc
import qualified Proto.Lnrpc.Ln1_Fields as LnGrpc

newtype ChanId = ChanId Word64
  deriving newtype
    ( PersistField,
      PersistFieldSql,
      Eq,
      Ord,
      Show,
      Read
    )
  deriving stock (Generic)

instance Out ChanId

newtype Vout (a :: TxKind) = Vout Word32
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out (Vout a)

newtype TxId (a :: TxKind) = TxId ByteString
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out (TxId a)

newtype NodePubKey = NodePubKey ByteString
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out NodePubKey

newtype NodeLocation = NodeLocation Text
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out NodeLocation

newtype AddIndex = AddIndex Word64
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out AddIndex

newtype SettleIndex = SettleIndex Word64
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out SettleIndex

newtype PaymentRequest = PaymentRequest Text
  deriving newtype (PersistField, PersistFieldSql, Eq, QR.ToText, Show)
  deriving stock (Generic)

instance Out PaymentRequest

newtype RHash = RHash ByteString
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out RHash

newtype RPreimage = RPreimage ByteString
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out RPreimage

newtype MSat = MSat Word64
  deriving newtype
    ( PersistField,
      PersistFieldSql,
      Eq,
      Num,
      Ord,
      FromJSON,
      Show,
      Read
    )
  deriving stock
    ( Generic
    )

instance Out MSat

newtype CipherSeedMnemonic = CipherSeedMnemonic [Text]
  deriving newtype (PersistField, PersistFieldSql, Eq, FromJSON)

newtype AezeedPassphrase = AezeedPassphrase Text
  deriving newtype (PersistField, PersistFieldSql, Eq, FromJSON)

newtype Seconds = Seconds Word64
  deriving newtype
    ( PersistField,
      PersistFieldSql,
      Eq,
      Ord,
      FromJSON,
      Show,
      Num,
      Real,
      Enum,
      Integral
    )
  deriving stock (Generic)

instance Out Seconds

newtype GrpcTimeoutSeconds = GrpcTimeoutSeconds Int
  deriving newtype (Eq, Ord, FromJSON, Show)

instance ToGrpc NodePubKey ByteString where
  toGrpc = Right . coerce

instance ToGrpc NodePubKey Text where
  toGrpc =
    first (const $ ToGrpcError "UTF8_DECODE_ERROR")
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

instance FromGrpc NodePubKey ByteString where
  fromGrpc = Right . NodePubKey

instance FromGrpc NodePubKey Text where
  fromGrpc =
    bimap (const $ FromGrpcError "NodePubKey hex decoding error") NodePubKey . B16.decode . encodeUtf8

instance FromGrpc NodeLocation Text where
  fromGrpc = Right . NodeLocation

instance ToGrpc (TxId a) ByteString where
  toGrpc = Right . coerce

instance ToGrpc (Vout a) Word32 where
  toGrpc = Right . coerce

instance ToGrpc ChanId Word64 where
  toGrpc = Right . coerce

instance ToGrpc AddIndex Word64 where
  toGrpc = Right . coerce

instance ToGrpc SettleIndex Word64 where
  toGrpc = Right . coerce

instance FromGrpc ChanId Word64 where
  fromGrpc = Right . coerce

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

instance FromGrpc PaymentRequest IGrpc.AddHoldInvoiceResp where
  fromGrpc x = fromGrpc (x ^. IGrpc.paymentRequest)

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

instance ToGrpc CipherSeedMnemonic [Text] where
  toGrpc = Right . coerce

instance ToGrpc AezeedPassphrase ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

instance ToGrpc RHash ByteString where
  toGrpc = Right . coerce

instance ToGrpc RHash IGrpc.CancelInvoiceMsg where
  toGrpc x = do
    ph <- toGrpc x
    Right $ defMessage & IGrpc.paymentHash .~ ph

instance ToGrpc RPreimage ByteString where
  toGrpc = Right . coerce

instance ToGrpc RPreimage IGrpc.SettleInvoiceMsg where
  toGrpc x = do
    p <- toGrpc x
    Right $ defMessage & IGrpc.preimage .~ p

instance ToGrpc PaymentRequest LnGrpc.PayReqString where
  toGrpc x = Right $ defMessage & LnGrpc.payReq .~ coerce x

instance ToGrpc RHash LnGrpc.PaymentHash where
  toGrpc x = Right $ defMessage & LnGrpc.rHash .~ coerce x

instance ToGrpc RHash IGrpc.SubscribeSingleInvoiceRequest where
  toGrpc x = do
    rh <- toGrpc x
    Right $ defMessage & IGrpc.rHash .~ rh

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

toGrpcSat :: (Integral a, Bounded a) => MSat -> Either LndError a
toGrpcSat mSat = do
  let mVal :: Word64 = coerce mSat
  case divMod mVal 1000 of
    (val, 0) -> maybeToRight (ToGrpcError "MSat overflow") $ safeFromIntegral val
    _ -> Left $ ToGrpcError ("Cannot convert " <> inspect mVal <> " to Sat")

fromGrpcSat :: (Integral a) => a -> Either LndError MSat
fromGrpcSat sat =
  maybeToRight
    (FromGrpcError ("Cannot convert " <> (inspect . toInteger) sat <> " to MSat"))
    $ MSat . (1000 *) <$> safeFromIntegral sat

toGrpcMSat :: (Integral a, Bounded a) => MSat -> Either LndError a
toGrpcMSat x =
  maybeToRight
    (ToGrpcError "MSat overflow")
    $ safeFromIntegral (coerce x :: Word64)

fromGrpcMSat :: (Integral a) => a -> Either LndError MSat
fromGrpcMSat x =
  maybeToRight
    (FromGrpcError "MSat overflow")
    $ MSat <$> safeFromIntegral x
