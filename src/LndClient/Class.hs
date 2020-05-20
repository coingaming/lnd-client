{-# LANGUAGE FlexibleInstances #-}

module LndClient.Class
  ( FromGrpc (..),
    ToGrpc (..),
  )
where

import LndClient.Data.Type
import LndClient.Import.External

class HasDefault b => ToGrpc a b where
  toGrpc :: a -> Either LndError b

class (HasDefault b, Eq b) => FromGrpc a b where
  fromGrpc :: b -> Either LndError a

--
-- ToGrpc instances
--

instance HasDefault a => ToGrpc a a where
  toGrpc = Right

instance ToGrpc a b => ToGrpc (Maybe a) b where
  toGrpc = \case
    Nothing -> Right def
    Just x -> toGrpc x

instance ToGrpc a b => ToGrpc a (Maybe b) where
  toGrpc x = Just <$> toGrpc x

--
-- FromGrpc instances
--

instance (HasDefault a, Eq a) => FromGrpc a a where
  fromGrpc = Right

instance (HasDefault b, Eq b) => FromGrpc () b where
  fromGrpc = const $ Right ()

instance FromGrpc a b => FromGrpc (Maybe a) b where
  fromGrpc x =
    if x == def
      then Right Nothing
      else Just <$> fromGrpc x

instance FromGrpc a b => FromGrpc [a] (Vector b) where
  fromGrpc = (mapM fromGrpc) . toList
