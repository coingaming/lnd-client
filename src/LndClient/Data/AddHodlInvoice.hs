{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.AddHodlInvoice
  ( AddHodlInvoiceRequest (..),
    AddHodlInvoiceResponse (..),
  )
where

import Data.ProtoLens.Message
import qualified InvoiceGrpc as GRPC
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.InvoiceGrpc as LnGRPC
import qualified Proto.InvoiceGrpc_Fields as LnGRPC

data AddHodlInvoiceRequest
  = AddHodlInvoiceRequest
      { memo :: Maybe Text,
        hash :: RHash,
        valueMsat :: MSat,
        expiry :: Maybe Seconds
      }
  deriving (Eq, Show)

newtype AddHodlInvoiceResponse
  = AddHodlInvoiceResponse
      { paymentRequest :: PaymentRequest
      }
  deriving (Eq, Show)

instance ToGrpc AddHodlInvoiceRequest GRPC.AddHoldInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (hash x)
      <*> toGrpc (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gHash gValue gExp =
        def
          { GRPC.addHoldInvoiceRequestMemo = gMemo,
            GRPC.addHoldInvoiceRequestHash = gHash,
            GRPC.addHoldInvoiceRequestValueMsat = gValue,
            GRPC.addHoldInvoiceRequestExpiry = gExp
          }

instance C2.ToGrpc AddHodlInvoiceRequest LnGRPC.AddHoldInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (hash x)
      <*> toGrpc (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gHash gValue gExp =
        defMessage
          & LnGRPC.memo .~ gMemo
          & LnGRPC.hash .~ gHash
          & LnGRPC.valueMsat .~ gValue
          & LnGRPC.expiry .~ gExp

instance C2.FromGrpc AddHodlInvoiceResponse LnGRPC.AddHoldInvoiceResp where
  fromGrpc x =
    AddHodlInvoiceResponse
      <$> fromGrpc (x ^. LnGRPC.paymentRequest)
