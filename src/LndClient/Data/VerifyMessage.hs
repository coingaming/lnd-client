{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.VerifyMessage
  ( VerifyMessageRequest (..),
    VerifyMessageResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Signrpc.Signer as LnGRPC
import qualified Proto.Signrpc.Signer_Fields as LnGRPC

data VerifyMessageRequest = VerifyMessageRequest
  { message :: ByteString,
    signature :: ByteString,
    pubkey :: ByteString
  }
  deriving stock (Eq, Show, Generic)

instance Out VerifyMessageRequest

newtype VerifyMessageResponse = VerifyMessageResponse {unVerifyMessageResponse :: Bool}
  deriving newtype (Eq, Show)
  deriving stock (Generic)

instance Out VerifyMessageResponse

instance ToGrpc VerifyMessageRequest LnGRPC.VerifyMessageReq where
  toGrpc x =
    msg
      <$> toGrpc (message x)
      <*> toGrpc (signature x)
      <*> toGrpc (pubkey x)
    where
      msg gMsg gSignature gPubKey =
        defMessage
          & LnGRPC.msg .~ gMsg
          & LnGRPC.signature .~ gSignature
          & LnGRPC.pubkey .~ gPubKey

instance FromGrpc VerifyMessageResponse LnGRPC.VerifyMessageResp where
  fromGrpc x =
    VerifyMessageResponse
      <$> fromGrpc (x ^. LnGRPC.valid)
