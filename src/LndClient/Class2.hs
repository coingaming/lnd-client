{-# LANGUAGE FlexibleInstances #-}

module LndClient.Class2
  ( FromGrpc (..),
    ToGrpc (..),
  )
where

import Data.ProtoLens.Message
--import Data.Vector (fromList)
import LndClient.Data.Type
import LndClient.Import.External
import LndGrpc.Orphan ()

class Message b => ToGrpc a b where
  toGrpc :: a -> Either LndError b

class (Message b, Eq b) => FromGrpc a b where
  fromGrpc :: b -> Either LndError a

--
-- ToGrpc instances
--

instance Message a => ToGrpc a a where
  toGrpc = Right

instance ToGrpc a b => ToGrpc (Maybe a) b where
  toGrpc = \case
    Nothing -> Right defMessage
    Just x -> toGrpc x

instance ToGrpc a b => ToGrpc [a] [b] where
  toGrpc x = mapM toGrpc x

--instance ToGrpc a b => ToGrpc a (Maybe b) where
--  toGrpc x = Just <$> toGrpc x

--
--instance ToGrpc a b => ToGrpc [a] (Vector b) where
--  toGrpc = mapM toGrpc . fromList

--
-- FromGrpc instances
--

instance (Message a, Eq a) => FromGrpc a a where
  fromGrpc = Right

instance (Message b, Eq b) => FromGrpc () b where
  fromGrpc = const $ Right ()

instance FromGrpc a b => FromGrpc (Maybe a) b where
  fromGrpc x =
    if x == defMessage
      then Right Nothing
      else Just <$> fromGrpc x
--instance FromGrpc a b => FromGrpc a (Maybe b) where
--  fromGrpc = \case
--    Nothing -> Left $ FromGrpcError "required message is missing"
--    Just x -> fromGrpc x
--
--instance FromGrpc a b => FromGrpc [a] (Vector b) where
--  fromGrpc = mapM fromGrpc . toList
