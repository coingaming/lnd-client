{-# LANGUAGE FlexibleInstances #-}

module LndClient.Class2
  ( FromGrpc (..),
    ToGrpc (..),
  )
where

--import Data.ProtoLens.FieldDefault
import Data.ProtoLens.Message
import LndClient.Data.Type
import LndClient.Import.External
import LndGrpc.Orphan ()

class ToGrpc a b where
  toGrpc :: a -> Either LndError b

class Eq b => FromGrpc a b where
  fromGrpc :: b -> Either LndError a

--
-- ToGrpc instances
--

instance ToGrpc a a where
  toGrpc = Right

instance (FieldDefault b, ToGrpc a b) => ToGrpc (Maybe a) b where
  toGrpc = \case
    Nothing -> Right fieldDefault
    Just x -> toGrpc x

--
-- FromGrpc instances
--

instance Eq a => FromGrpc a a where
  fromGrpc = Right

instance Eq b => FromGrpc () b where
  fromGrpc = const $ Right ()

instance (FieldDefault b, FromGrpc a b) => FromGrpc (Maybe a) b where
  fromGrpc x =
    if x == fieldDefault
      then Right Nothing
      else Just <$> fromGrpc x

instance FromGrpc a b => FromGrpc [a] [b] where
  fromGrpc x = sequence $ fromGrpc <$> x
--instance (FromGrpc a b) => FromGrpc (Maybe a) (Maybe b) where
--  fromGrpc x =
--    case x of
--      Just x' -> Just <$> fromGrpc x'
--      Nothing -> Right Nothing
