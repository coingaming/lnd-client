{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.SignMessage
  ( SignMessageRequest (..),
    SignMessageResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data SignMessageRequest = SignMessageRequest
  { message :: ByteString,
    singleHash :: Bool
  }
  deriving (Eq, Show, Generic)

instance Out SignMessageRequest

newtype SignMessageResponse = SignMessageResponse Text
  deriving (Eq, Show, Generic)

instance Out SignMessageResponse

instance ToGrpc SignMessageRequest LnGRPC.SignMessageRequest where
  toGrpc x =
    msg
      <$> toGrpc (message x)
      <*> toGrpc (singleHash x)
    where
      msg gMsg gSingleHash =
        defMessage
          & LnGRPC.msg .~ gMsg
          & LnGRPC.singleHash .~ gSingleHash

instance FromGrpc SignMessageResponse LnGRPC.SignMessageResponse where
  fromGrpc x = SignMessageResponse <$> fromGrpc (x ^. LnGRPC.signature)

