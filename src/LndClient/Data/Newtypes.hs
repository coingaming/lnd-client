{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Newtypes
  ( AddIndex (..),
    PaymentRequest (..),
    RHash (..),
    MoneyAmount (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON, Value (..))
import Data.Scientific (toBoundedInteger)
import Data.Text (Text, unpack)
import Database.Persist.Class (PersistField)
import Database.Persist.Sql (PersistFieldSql)
import Text.Read (readMaybe)

newtype AddIndex = AddIndex Int
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype PaymentRequest = PaymentRequest Text
  deriving (FromJSON, ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype RHash = RHash Text
  deriving (FromJSON, ToJSON, PersistField, PersistFieldSql, Show, Eq)

newtype MoneyAmount = MoneyAmount Int
  deriving (ToJSON, PersistField, PersistFieldSql, Show, Eq)

instance FromJSON AddIndex where
  parseJSON = intParser AddIndex "AddIndex"

instance FromJSON MoneyAmount where
  parseJSON = intParser MoneyAmount "MoneyAmount"

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
