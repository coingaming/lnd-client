{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.SignMessage
  ( SignMessageRequest (..),
    SignMessageResponse (..),
    KeyLocator (..)
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Signrpc.Signer as LnGRPC
import qualified Proto.Signrpc.Signer_Fields as LnGRPC

data SignMessageRequest = SignMessageRequest
  { message :: ByteString,
    keyLoc :: KeyLocator,
    doubleHash :: Bool,
    compactSig :: Bool
  }
  deriving (Eq, Show, Generic)

instance Out SignMessageRequest

newtype SignMessageResponse = SignMessageResponse ByteString
  deriving (Eq, Show, Generic)

instance Out SignMessageResponse

instance ToGrpc SignMessageRequest LnGRPC.SignMessageReq where
  toGrpc x =
    msg
      <$> toGrpc (message x)
      <*> toGrpc (keyLoc x)
      <*> toGrpc (doubleHash x)
      <*> toGrpc (compactSig x)
    where
      msg gMsg gKeyLoc gDoubleHash gCompactSig =
        defMessage
          & LnGRPC.msg .~ gMsg
          & LnGRPC.keyLoc .~ gKeyLoc
          & LnGRPC.doubleHash .~ gDoubleHash
          & LnGRPC.compactSig .~ gCompactSig

instance FromGrpc SignMessageResponse LnGRPC.SignMessageResp where
  fromGrpc x = SignMessageResponse <$> fromGrpc (x ^. LnGRPC.signature)

data KeyLocator = KeyLocator
  { keyFamily :: Int32,
    keyIndex :: Int32
  }
  deriving (Eq, Show, Generic)

instance Out KeyLocator

instance ToGrpc KeyLocator LnGRPC.KeyLocator where
  toGrpc x =
    msg
      <$> toGrpc (keyFamily x)
      <*> toGrpc (keyIndex x)
    where
      msg gKeyFamily gKeyIndex =
        defMessage
          & LnGRPC.keyFamily .~ gKeyFamily
          & LnGRPC.keyIndex .~ gKeyIndex
