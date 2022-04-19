{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.FinalizePsbt
  ( FinalizePsbtRequest (..),
    FinalizePsbtResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Walletrpc.Walletkit as W
import qualified Proto.Walletrpc.Walletkit_Fields as W

data FinalizePsbtRequest = FinalizePsbtRequest
  { fundedPsbt :: ByteString,
    account :: Text
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FinalizePsbtRequest

instance ToGrpc FinalizePsbtRequest W.FinalizePsbtRequest where
  toGrpc x = pure $ msg (fundedPsbt x) (account x)
    where
      msg f a =
        defMessage
          & W.fundedPsbt .~ f
          & W.account .~ a

data FinalizePsbtResponse = FinalizePsbtResponse
  { signedPsbt :: ByteString,
    rawFinalTx :: ByteString
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out FinalizePsbtResponse

instance FromGrpc FinalizePsbtResponse W.FinalizePsbtResponse where
  fromGrpc x = Right $ FinalizePsbtResponse (x ^. W.signedPsbt) (x ^. W.rawFinalTx)
