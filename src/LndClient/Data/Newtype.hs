{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}

module LndClient.Data.Newtype
  ( AddIndex (..),
    SettleIndex (..),
    PaymentRequest (..),
    RHash (..),
    RPreimage (..),
    Msat (..),
    toGrpcSat,
    toGrpcMSat,
    toGrpcMaybe,
    fromGrpcSat,
    fromGrpcMSat,
    tryFromGrpcMSat,
    CipherSeedMnemonic (..),
    AezeedPassphrase (..),
    Seconds (..),
    NodePubKey (..),
    NodeLocation (..),
    GrpcTimeoutSeconds,
    newRHash,
    newRPreimage,
    newPendingChanId,
    newGrpcTimeout,
    unGrpcTimeout,
    defaultSyncGrpcTimeout,
    defaultAsyncGrpcTimeout,
    TxId (..),
    Vout (..),
    ChanId (..),
    PendingChannelId (..),
    Psbt (..),
    RawTx (..),
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
import qualified Proto.Lnrpc.Ln0 as LnGrpc
import qualified Proto.Lnrpc.Ln0_Fields as LnGrpc
import qualified Proto.Lnrpc.Ln1 as LnGrpc
import qualified Proto.Lnrpc.Ln1_Fields as LnGrpc
import qualified Universum (show)

newtype PendingChannelId = PendingChannelId {unPendingChannelId :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out PendingChannelId

newtype Psbt = Psbt {unPsbt :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out Psbt

newtype RawTx = RawTx {unRawTx :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out RawTx

newtype ChanId = ChanId {unChanId :: Natural}
  deriving newtype
    ( Eq,
      Ord,
      Show,
      Read
    )
  deriving stock (Generic)

instance PersistField ChanId where
  toPersistValue =
    unsafeToPersistValue @Natural @Word64 unChanId
  fromPersistValue =
    safeFromPersistValue @Word64 @Natural ChanId

deriving via Word64 instance PersistFieldSql ChanId

instance Out ChanId

newtype Vout (a :: TxKind) = Vout {unVout :: Natural}
  deriving newtype (Eq, Ord, Show, Read)
  deriving stock (Generic)

instance PersistField (Vout a) where
  toPersistValue =
    unsafeToPersistValue @Natural @Word32 unVout
  fromPersistValue =
    safeFromPersistValue @Word32 @Natural Vout

deriving via Word32 instance PersistFieldSql (Vout a)

instance Out (Vout a)

newtype TxId (a :: TxKind) = TxId {unTxId :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out (TxId a)

newtype NodePubKey = NodePubKey {unNodePubKey :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out NodePubKey

newtype NodeLocation = NodeLocation {unNodeLocation :: Text}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show, Read)
  deriving stock (Generic)

instance Out NodeLocation

newtype AddIndex = AddIndex {unAddIndex :: Natural}
  deriving newtype (Eq, Ord, Show)
  deriving stock (Generic)

instance PersistField AddIndex where
  toPersistValue =
    unsafeToPersistValue @Natural @Word64 unAddIndex
  fromPersistValue =
    safeFromPersistValue @Word64 @Natural AddIndex

deriving via Word64 instance PersistFieldSql AddIndex

instance Out AddIndex

newtype SettleIndex = SettleIndex {unSettleIndex :: Natural}
  deriving newtype (Eq, Ord, Show)
  deriving stock (Generic)

instance PersistField SettleIndex where
  toPersistValue =
    unsafeToPersistValue @Natural @Word64 unSettleIndex
  fromPersistValue =
    safeFromPersistValue @Word64 @Natural SettleIndex

deriving via Word32 instance PersistFieldSql SettleIndex

instance Out SettleIndex

newtype PaymentRequest = PaymentRequest {unPaymentRequest :: Text}
  deriving newtype (PersistField, PersistFieldSql, Eq, QR.ToText, Show)
  deriving stock (Generic)

instance Out PaymentRequest

newtype RHash = RHash {unRHash :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out RHash

newtype RPreimage = RPreimage {unRPreimage :: ByteString}
  deriving newtype (PersistField, PersistFieldSql, Eq, Ord, Show)
  deriving stock (Generic)

instance Out RPreimage

newtype Msat = Msat {unMsat :: Natural}
  deriving newtype
    ( Eq,
      Num,
      Ord,
      FromJSON,
      Show,
      Read
    )
  deriving stock
    ( Generic
    )

instance PersistField Msat where
  toPersistValue =
    unsafeToPersistValue @Natural @Word64 unMsat
  fromPersistValue =
    safeFromPersistValue @Word64 @Natural Msat

deriving via Word64 instance PersistFieldSql Msat

instance Out Msat

instance FromGrpc Msat LnGrpc.Amount where
  fromGrpc =
    fromGrpcMSat . (^. LnGrpc.msat)

newtype CipherSeedMnemonic = CipherSeedMnemonic {unCipherSeedMnemonic :: [Text]}
  deriving newtype (PersistField, PersistFieldSql, Eq, FromJSON)

newtype AezeedPassphrase = AezeedPassphrase {unAezeedPassphrase :: Text}
  deriving newtype (PersistField, PersistFieldSql, Eq, FromJSON)

newtype Seconds = Seconds {unSeconds :: Natural}
  deriving newtype
    ( Eq,
      Ord,
      FromJSON,
      Show,
      Num,
      Real,
      Enum,
      Integral
    )
  deriving stock (Generic)

instance PersistField Seconds where
  toPersistValue =
    unsafeToPersistValue @Natural @Word64 unSeconds
  fromPersistValue =
    safeFromPersistValue @Word64 @Natural Seconds

deriving via Word64 instance PersistFieldSql Seconds

instance Out Seconds

newtype GrpcTimeoutSeconds = GrpcTimeoutSeconds {unGrpcTimeoutSeconds :: Int}
  deriving newtype (Eq, Ord, FromJSON, Show)

instance ToGrpc NodePubKey ByteString where
  toGrpc = Right . unNodePubKey

instance ToGrpc NodePubKey Text where
  toGrpc =
    first (const $ ToGrpcError "UTF8_DECODE_ERROR")
      . decodeUtf8'
      . B16.encode
      . unNodePubKey

instance ToGrpc NodeLocation Text where
  toGrpc = Right . unNodeLocation

--
-- TODO : smart constructors for NodePubKey and NodeLocation ???
--

instance FromGrpc (TxId a) ByteString where
  fromGrpc = Right . TxId

instance FromGrpc (TxId a) Text where
  fromGrpc = (TxId <$>) . txIdParser

instance FromGrpc (Vout a) Word32 where
  fromGrpc = Right . Vout . from @Word32 @Natural

instance FromGrpc NodePubKey ByteString where
  fromGrpc = Right . NodePubKey

instance FromGrpc NodePubKey Text where
  fromGrpc =
    bimap (const $ FromGrpcError "NodePubKey hex decoding error") NodePubKey . B16.decode . encodeUtf8

instance FromGrpc NodeLocation Text where
  fromGrpc = Right . NodeLocation

instance ToGrpc (TxId a) ByteString where
  toGrpc = Right . unTxId

instance ToGrpc (Vout a) Word32 where
  toGrpc x = first (ToGrpcError . ("Vout overflow: " <>) . Universum.show) (tryFrom @Natural @Word32 $ unVout x)

instance ToGrpc ChanId Word64 where
  toGrpc x = first (ToGrpcError . ("ChanId overflow: " <>) . Universum.show) (tryFrom @Natural @Word64 $ unChanId x)

instance ToGrpc PendingChannelId ByteString where
  toGrpc = Right . unPendingChannelId

instance ToGrpc Psbt ByteString where
  toGrpc = Right . unPsbt

instance ToGrpc RawTx ByteString where
  toGrpc = Right . unRawTx

instance ToGrpc AddIndex Word64 where
  toGrpc x = first (ToGrpcError . ("AddIndex overflow: " <>) . Universum.show) (tryFrom @Natural @Word64 $ unAddIndex x)

instance ToGrpc SettleIndex Word64 where
  toGrpc x = first (ToGrpcError . ("SettleIndex overflow: " <>) . Universum.show) (tryFrom @Natural @Word64 $ unSettleIndex x)

instance FromGrpc ChanId Word64 where
  fromGrpc = Right . ChanId . from @Word64 @Natural

instance FromGrpc RHash ByteString where
  fromGrpc = Right . RHash

instance FromGrpc RPreimage ByteString where
  fromGrpc = Right . RPreimage

instance FromGrpc Psbt ByteString where
  fromGrpc = Right . Psbt

instance FromGrpc AddIndex Word64 where
  fromGrpc = Right . AddIndex . from @Word64 @Natural

instance FromGrpc SettleIndex Word64 where
  fromGrpc = Right . SettleIndex . from @Word64 @Natural

instance FromGrpc PaymentRequest Text where
  fromGrpc = Right . PaymentRequest

instance FromGrpc PaymentRequest IGrpc.AddHoldInvoiceResp where
  fromGrpc x = fromGrpc (x ^. IGrpc.paymentRequest)

instance FromGrpc Seconds Int64 where
  fromGrpc x =
    bimap (ToGrpcError . ("Seconds overflow: " <>) . Universum.show) Seconds (tryFrom @Int64 @Natural $ x)

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
  toGrpc x = Right (unPaymentRequest x :: Text)

instance ToGrpc Seconds Int64 where
  toGrpc x =
    first (ToGrpcError . ("Seconds overflow: " <>) . Universum.show) (tryFrom @Natural @Int64 $ unSeconds x)

instance ToGrpc CipherSeedMnemonic [Text] where
  toGrpc = Right . unCipherSeedMnemonic

instance ToGrpc AezeedPassphrase ByteString where
  toGrpc x = Right $ encodeUtf8 (unAezeedPassphrase x :: Text)

instance ToGrpc RHash ByteString where
  toGrpc = Right . unRHash

instance ToGrpc RHash IGrpc.CancelInvoiceMsg where
  toGrpc x = do
    ph <- toGrpc x
    Right $ defMessage & IGrpc.paymentHash .~ ph

instance ToGrpc RPreimage ByteString where
  toGrpc = Right . unRPreimage

instance ToGrpc RPreimage IGrpc.SettleInvoiceMsg where
  toGrpc x = do
    p <- toGrpc x
    Right $ defMessage & IGrpc.preimage .~ p

instance ToGrpc PaymentRequest LnGrpc.PayReqString where
  toGrpc x = Right $ defMessage & LnGrpc.payReq .~ unPaymentRequest x

instance ToGrpc RHash LnGrpc.PaymentHash where
  toGrpc x = Right $ defMessage & LnGrpc.rHash .~ unRHash x

instance ToGrpc RHash IGrpc.SubscribeSingleInvoiceRequest where
  toGrpc x = do
    rh <- toGrpc x
    Right $ defMessage & IGrpc.rHash .~ rh

unsafeToPersistValue :: forall a b c. (TryFrom a b, PersistField b, Show a, Typeable a, Typeable b) => (c -> a) -> c -> PersistValue
unsafeToPersistValue x = toPersistValue . unsafeFrom @a @b . x

safeFromPersistValue ::
  forall a b c.
  (From a b, PersistField a) =>
  (b -> c) ->
  PersistValue ->
  Either Text c
safeFromPersistValue x = (x . from @a @b <$>) . fromPersistValue

newRHash :: RPreimage -> RHash
newRHash = RHash . SHA256.hash . unRPreimage

newRPreimage :: MonadIO m => m RPreimage
newRPreimage = RPreimage <$> liftIO (getRandomBytes 32)

newPendingChanId :: MonadIO m => m PendingChannelId
newPendingChanId = PendingChannelId <$> liftIO (getRandomBytes 32)

newGrpcTimeout :: Int -> Maybe GrpcTimeoutSeconds
newGrpcTimeout x =
  if x > 0
    then Just $ GrpcTimeoutSeconds x
    else Nothing

unGrpcTimeout :: GrpcTimeoutSeconds -> Int
unGrpcTimeout = unGrpcTimeoutSeconds

defaultSyncGrpcTimeout :: GrpcTimeoutSeconds
defaultSyncGrpcTimeout = GrpcTimeoutSeconds 60

defaultAsyncGrpcTimeout :: GrpcTimeoutSeconds
defaultAsyncGrpcTimeout = GrpcTimeoutSeconds 3600

toGrpcSat :: forall a. (TryFrom Natural a, Typeable a) => Msat -> Either LndError a
toGrpcSat mSat = do
  let mVal = unMsat mSat
  case divMod mVal 1000 of
    (val, 0) -> first (ToGrpcError . ("Msat overflow " <>) . Universum.show) (tryFrom @Natural @a val)
    _ -> Left $ ToGrpcError ("Cannot convert " <> inspectPlain mVal <> " to Sat")

fromGrpcSat :: forall a. (TryFrom a Natural, Show a, Typeable a) => a -> Either LndError Msat
fromGrpcSat x =
  bimap (ToGrpcError . ("Sat overflow: " <>) . Universum.show) (Msat . (1000 *)) (tryFrom @a @Natural $ x)

toGrpcMSat :: forall a. (TryFrom Natural a, Typeable a) => Msat -> Either LndError a
toGrpcMSat x =
  first (ToGrpcError . ("Msat overflow: " <>) . Universum.show) (tryFrom @Natural @a $ unMsat x)

toGrpcMaybe :: (ToGrpc a b) => Maybe a -> Either LndError (Maybe b)
toGrpcMaybe (Just fs) = Just <$> toGrpc fs
toGrpcMaybe Nothing = Right Nothing

fromGrpcMSat :: forall a. (From a Natural) => a -> Either LndError Msat
fromGrpcMSat =
  Right . Msat . from @a @Natural

tryFromGrpcMSat :: forall a. (TryFrom a Natural, Show a, Typeable a) => a -> Either LndError Msat
tryFromGrpcMSat x =
  bimap (ToGrpcError . ("Msat overflow: " <>) . Universum.show) Msat (tryFrom @a @Natural $ x)
