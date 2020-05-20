{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.Newtype
  ( AddIndex (..),
    SettleIndex (..),
    PaymentRequest (..),
    RHash (..),
    MoneyAmount (..),
    ResultWrapper (..),
  )
where

import Codec.QRCode as QR (ToText)
import Data.Text.Lazy as TL (Text)
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util (safeFromIntegral, stdParseJSON, stdToJSON)

newtype AddIndex = AddIndex Word64
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype SettleIndex = SettleIndex Word64
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype PaymentRequest = PaymentRequest TL.Text
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq, QR.ToText)

newtype RHash = RHash ByteString
  deriving (PersistField, PersistFieldSql, Show, Eq)

newtype MoneyAmount = MoneyAmount Word64
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

instance FromJSON AddIndex where
  parseJSON = intParser AddIndex "AddIndex"

instance FromJSON SettleIndex where
  parseJSON = intParser SettleIndex "SettleIndex"

instance FromJSON MoneyAmount where
  parseJSON = intParser MoneyAmount "MoneyAmount"

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

instance FromGrpc PaymentRequest TL.Text where
  fromGrpc = Right . PaymentRequest

instance ToGrpc PaymentRequest TL.Text where
  toGrpc x = Right (coerce x :: TL.Text)

newtype ResultWrapper a
  = ResultWrapper
      { result :: a
      }
  deriving (Generic, Show)

instance (FromJSON a) => FromJSON (ResultWrapper a) where
  parseJSON = stdParseJSON

instance ToJSON a => ToJSON (ResultWrapper a) where
  toJSON = stdToJSON

intParser ::
  (Integral t, Bounded t, Read t, MonadFail m) =>
  (t -> a) ->
  String ->
  Value ->
  m a
intParser cons label x =
  case x of
    Number n ->
      case toBoundedInteger n of
        Just i -> return $ cons i
        Nothing -> failure
    String s ->
      case readMaybe $ unpack s of
        Just i -> return $ cons i
        Nothing -> failure
    _ -> failure
  where
    failure = fail $ "invalid " <> label <> " " <> show x
