{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.VerifyMessage
  ( VerifyMessageRequest (..),
    VerifyMessageResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data VerifyMessageRequest = VerifyMessageRequest
  { message :: ByteString,
    signature :: Text
  }
  deriving (Eq, Show, Generic)

instance Out VerifyMessageRequest

data VerifyMessageResponse = VerifyMessageResponse
  { valid :: Bool,
    pubkey :: Text
  }
  deriving (Eq, Show, Generic)

instance Out VerifyMessageResponse

instance ToGrpc VerifyMessageRequest LnGRPC.VerifyMessageRequest where
  toGrpc x =
    msg
      <$> toGrpc (message x)
      <*> toGrpc (signature x)
    where
      msg gMsg gSignature =
        defMessage
          & LnGRPC.msg .~ gMsg
          & LnGRPC.signature .~ gSignature

instance FromGrpc VerifyMessageResponse LnGRPC.VerifyMessageResponse where
  fromGrpc x =
    VerifyMessageResponse
      <$> fromGrpc (x ^. LnGRPC.valid)
      <*> fromGrpc (x ^. LnGRPC.pubkey)
