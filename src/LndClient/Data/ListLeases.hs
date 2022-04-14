{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.ListLeases
  ( ListLeasesRequest (..),
    ListLeasesResponse (..),
    UtxoLease (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.OutPoint
import LndClient.Import
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W

data ListLeasesRequest = ListLeasesRequest deriving stock (Eq, Ord, Show, Generic)

instance Out ListLeasesRequest

instance ToGrpc ListLeasesRequest W.ListLeasesRequest where
  toGrpc = const (pure defMessage)

data UtxoLease = UtxoLease
  { id :: ByteString,
    outpoint :: Maybe OutPoint,
    expiration :: Word64
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out UtxoLease

newtype ListLeasesResponse = ListLeasesResponse
  { lockedUtxos :: [UtxoLease]
  }
  deriving newtype (Eq, Ord, Show)
  deriving stock (Generic)

instance FromGrpc UtxoLease W.UtxoLease where
  fromGrpc x = lease (x ^. W.id) (x ^. W.expiration) <$> out'
    where
      out' :: Either LndError (Maybe OutPoint)
      out' = case x ^. W.maybe'outpoint of
        Just op -> Just <$> fromGrpc op
        Nothing -> Right Nothing
      lease id' expr op = UtxoLease id' op expr

instance Out ListLeasesResponse

instance FromGrpc ListLeasesResponse W.ListLeasesResponse where
  fromGrpc x = ListLeasesResponse <$> mapM fromGrpc (x ^. W.lockedUtxos)
