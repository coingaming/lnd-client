{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module LndClient.Class
  ( FromGrpc (..),
    ToGrpc (..),
  )
where

import LndClient.Data.Types
import LndClient.Import.External
import Proto3.Suite.Class

class HasDefault b => ToGrpc a b where
  toGrpc :: a -> Either GrpcParserError b

class HasDefault b => FromGrpc a b where
  fromGrpc :: b -> Either GrpcParserError a

instance HasDefault a => ToGrpc a a where
  toGrpc = Right

instance HasDefault a => FromGrpc a a where
  fromGrpc = Right

instance ToGrpc a b => ToGrpc (Maybe a) b where
  toGrpc = \case
    Nothing -> Right def
    Just x -> toGrpc x
