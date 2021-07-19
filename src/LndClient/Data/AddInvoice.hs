{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data AddInvoiceRequest
  = AddInvoiceRequest
      { valueMsat :: MSat,
        memo :: Maybe Text,
        expiry :: Maybe Seconds
      }
  deriving (Eq, Show)

data AddInvoiceResponse
  = AddInvoiceResponse
      { rHash :: RHash,
        paymentRequest :: PaymentRequest,
        addIndex :: AddIndex
      }
  deriving (Eq, Show)

instance C2.ToGrpc AddInvoiceRequest LnGRPC.Invoice where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gValue gExp =
        defMessage
          & LnGRPC.memo .~ gMemo
          & LnGRPC.valueMsat .~ gValue
          & LnGRPC.expiry .~ gExp

instance C2.FromGrpc AddInvoiceResponse LnGRPC.AddInvoiceResponse where
  fromGrpc x =
    AddInvoiceResponse
      <$> fromGrpc (x ^. LnGRPC.rHash)
      <*> fromGrpc (x ^. LnGRPC.paymentRequest)
      <*> fromGrpc (x ^. LnGRPC.addIndex)
