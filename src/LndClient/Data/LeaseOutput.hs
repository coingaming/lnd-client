{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.LeaseOutput
  ( LeaseOutputRequest (..),
    LeaseOutputResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.OutPoint
import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W

data LeaseOutputRequest = LeaseOutputRequest
  { id' :: ByteString,
    outpoint :: Maybe OutPoint,
    expirationSeconds :: Word64
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out LeaseOutputRequest

instance ToGrpc LeaseOutputRequest W.LeaseOutputRequest where
  toGrpc x = msg (id' x) (expirationSeconds x) <$> out'
    where
      out' :: Either LndError (Maybe LnGRPC.OutPoint)
      out' = case outpoint x of
        Just op -> Just <$> toGrpc op
        Nothing -> Right Nothing
      msg i e o =
        defMessage
          & (W.id .~ i)
          & (W.maybe'outpoint .~ o)
          & (W.expirationSeconds .~ e)

newtype LeaseOutputResponse = LeaseOutputResponse
  {expiration :: Word64}
  deriving newtype (Eq, Ord, Show)
  deriving stock (Generic)

instance Out LeaseOutputResponse

instance FromGrpc LeaseOutputResponse W.LeaseOutputResponse where
  fromGrpc x = LeaseOutputResponse <$> fromGrpc (x ^. W.expiration)
