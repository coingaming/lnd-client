{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.SendCoins
  ( SendCoinsRequest (..),
    SendCoinsResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data SendCoinsRequest = SendCoinsRequest
  { addr :: Text,
    amount :: MSat
  }
  deriving (Eq, Show, Generic)

instance Out SendCoinsRequest

newtype SendCoinsResponse = SendCoinsResponse
  {
    txid :: Text
  }
  deriving (Eq, Show, Generic)

instance Out SendCoinsResponse

instance ToGrpc SendCoinsRequest LnGRPC.SendCoinsRequest where
  toGrpc x =
    msg
      <$> toGrpcSat (amount x)
      <*> toGrpc (addr x)
    where
      msg gAmt gAddr =
        defMessage
          & LnGRPC.amount .~ gAmt
          & LnGRPC.addr .~ gAddr

instance FromGrpc SendCoinsResponse LnGRPC.SendCoinsResponse where
  fromGrpc x = SendCoinsResponse <$> fromGrpc (x ^. LnGRPC.txid)
