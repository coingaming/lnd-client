{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListInvoices
  ( ListInvoiceRequest (..),
    ListInvoiceResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Data.Invoice (Invoice)
import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data ListInvoiceRequest = ListInvoiceRequest
  { pendingOnly :: Bool,
    indexOffset :: AddIndex,
    numMaxInvoices :: Word64,
    reversed :: Bool
  }
  deriving stock (Generic, Show)

instance Out ListInvoiceRequest

data ListInvoiceResponse = ListInvoiceResponse
  { invoices :: [Invoice],
    lastIndexOffset :: AddIndex,
    firstIndexOffset :: AddIndex
  }
  deriving stock (Generic, Show)

instance Out ListInvoiceResponse

instance ToGrpc ListInvoiceRequest LnGRPC.ListInvoiceRequest where
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

instance FromGrpc ListInvoiceResponse LnGRPC.ListInvoiceResponse where
  fromGrpc x =
    ListInvoiceResponse
      <$> fromGrpc (x ^. LnGRPC.invoices)
      <*> fromGrpc (x ^. LnGRPC.lastIndexOffset)
      <*> fromGrpc (x ^. LnGRPC.firstIndexOffset)
