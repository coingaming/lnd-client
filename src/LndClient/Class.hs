{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.Class
  ( FromGrpc (..),
    ToGrpc (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.Type
import LndClient.Import.External
import qualified Proto.Lnrpc.Ln0 as LnGrpc

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
  fromGrpc = mapM fromGrpc

instance FromGrpc LnInitiator Bool where
  fromGrpc =
    pure . \case
      True -> LnInitiatorLocal
      False -> LnInitiatorRemote

instance FromGrpc LnInitiator LnGrpc.Initiator where
  fromGrpc =
    pure . \case
      LnGrpc.INITIATOR_UNKNOWN -> LnInitiatorUnknown
      LnGrpc.INITIATOR_LOCAL -> LnInitiatorLocal
      LnGrpc.INITIATOR_REMOTE -> LnInitiatorRemote
      LnGrpc.INITIATOR_BOTH -> LnInitiatorBoth
      LnGrpc.Initiator'Unrecognized {} -> LnInitiatorUnknown
