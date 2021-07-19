{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListInvoices
  ( ListInvoiceRequest (..),
    ListInvoiceResponse (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Data.Invoice (Invoice)
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data ListInvoiceRequest
  = ListInvoiceRequest
      { pendingOnly :: Bool,
        indexOffset :: AddIndex,
        numMaxInvoices :: Word64,
        reversed :: Bool
      }
  deriving (Generic, Show)

data ListInvoiceResponse
  = ListInvoiceResponse
      { invoices :: [Invoice],
        lastIndexOffset :: AddIndex,
        firstIndexOffset :: AddIndex
      }
  deriving (Generic, Show)

instance C2.ToGrpc ListInvoiceRequest LnGRPC.ListInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (pendingOnly x)
      <*> toGrpc (indexOffset x)
      <*> toGrpc (numMaxInvoices x)
      <*> toGrpc (reversed x)
    where
      msg gPendingOnly gIndexOffset gNumMaxInvoices gReversed =
        defMessage
          & LnGRPC.pendingOnly .~ gPendingOnly
          & LnGRPC.indexOffset .~ gIndexOffset
          & LnGRPC.numMaxInvoices .~ gNumMaxInvoices
          & LnGRPC.reversed .~ gReversed

instance C2.FromGrpc ListInvoiceResponse LnGRPC.ListInvoiceResponse where
  fromGrpc x =
    ListInvoiceResponse
      <$> C2.fromGrpc (x ^. LnGRPC.invoices)
      <*> fromGrpc (x ^. LnGRPC.lastIndexOffset)
      <*> fromGrpc (x ^. LnGRPC.firstIndexOffset)
