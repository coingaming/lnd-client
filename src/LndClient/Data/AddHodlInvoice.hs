{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.AddHodlInvoice
  ( AddHodlInvoiceRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.InvoiceGrpc as LnGRPC
import qualified Proto.InvoiceGrpc_Fields as LnGRPC

data AddHodlInvoiceRequest = AddHodlInvoiceRequest
  { memo :: Maybe Text,
    hash :: RHash,
    valueMsat :: MSat,
    expiry :: Maybe Seconds
  }
  deriving (Eq, Show, Generic)

instance Out AddHodlInvoiceRequest

instance ToGrpc AddHodlInvoiceRequest LnGRPC.AddHoldInvoiceRequest where
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
