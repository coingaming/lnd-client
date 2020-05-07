{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Newtypes
  ( AddIndex (..),
    PaymentRequest (..),
    RHash (..),
    MoneyAmount (..),
    ResultWrapper (..),
  )
where

import Codec.QRCode (ToText)
import Data.Aeson (FromJSON (..), ToJSON (..), Value (..))
import Data.Scientific (toBoundedInteger)
import Data.Text (Text, unpack)
import Data.Word (Word64)
import Database.Persist.Class (PersistField)
import Database.Persist.Sql (PersistFieldSql)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON, stdToJSON)
import Text.Read (readMaybe)

newtype AddIndex = AddIndex Word64
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype PaymentRequest = PaymentRequest Text
  deriving (FromJSON, ToJSON, PersistField, PersistFieldSql, Show, Eq, ToText)

newtype RHash = RHash Text
  deriving (FromJSON, ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype MoneyAmount = MoneyAmount Word64
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

instance FromJSON AddIndex where
  parseJSON = intParser AddIndex "AddIndex"

instance FromJSON MoneyAmount where
  parseJSON = intParser MoneyAmount "MoneyAmount"

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
  (Integral t, Bounded t, Read t, Monad m) =>
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