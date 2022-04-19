{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.ReleaseOutput
  ( ReleaseOutputRequest (..),
    ReleaseOutputResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.OutPoint
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W

data ReleaseOutputRequest = ReleaseOutputRequest
  { id' :: ByteString,
    outpoint :: Maybe OutPoint
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out ReleaseOutputRequest

instance ToGrpc ReleaseOutputRequest W.ReleaseOutputRequest where
  toGrpc x = msg (id' x) <$> out'
    where
      out' :: Either LndError (Maybe LnGRPC.OutPoint)
      out' = case outpoint x of
        Just op -> Just <$> toGrpc op
        Nothing -> Right Nothing
      msg i o =
        defMessage
          & (W.id .~ i)
          & (W.maybe'outpoint .~ o)

data ReleaseOutputResponse = ReleaseOutputResponse deriving stock (Eq, Ord, Show, Generic)

instance Out ReleaseOutputResponse

instance FromGrpc ReleaseOutputResponse W.ReleaseOutputResponse where
  fromGrpc = const $ Right ReleaseOutputResponse
