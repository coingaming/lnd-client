{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.AddHodlInvoice
  ( AddHodlInvoiceRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Invoicesrpc.Invoices as LnGRPC
import qualified Proto.Invoicesrpc.Invoices_Fields as LnGRPC

data AddHodlInvoiceRequest = AddHodlInvoiceRequest
  { memo :: Maybe Text,
    hash :: RHash,
    valueMsat :: Msat,
    expiry :: Maybe Seconds
  }
  deriving stock (Eq, Show, Generic)

instance Out AddHodlInvoiceRequest

instance ToGrpc AddHodlInvoiceRequest LnGRPC.AddHoldInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpc (hash x)
      <*> toGrpcMSat (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gHash gValue gExp =
        defMessage
          & LnGRPC.memo .~ gMemo
          & LnGRPC.hash .~ gHash
          & LnGRPC.valueMsat .~ gValue
          & LnGRPC.expiry .~ gExp
