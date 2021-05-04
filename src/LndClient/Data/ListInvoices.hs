{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}

module LndClient.Data.ListInvoices
  ( ListInvoiceRequest (..),
    ListInvoiceResponse (..),
  )
where

import LndClient.Data.Invoice (Invoice)
import LndClient.Import
import qualified LndGrpc as Grpc

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

instance ToGrpc ListInvoiceRequest Grpc.ListInvoiceRequest where
  toGrpc x =
    msg
      <$> toGrpc (pendingOnly x)
      <*> toGrpc (indexOffset x)
      <*> toGrpc (numMaxInvoices x)
      <*> toGrpc (reversed x)
    where
      msg x0 x1 x2 x3 =
        def
          { Grpc.listInvoiceRequestPendingOnly = x0,
            Grpc.listInvoiceRequestIndexOffset = x1,
            Grpc.listInvoiceRequestNumMaxInvoices = x2,
            Grpc.listInvoiceRequestReversed = x3
          }

instance FromGrpc ListInvoiceResponse Grpc.ListInvoiceResponse where
  fromGrpc x =
    ListInvoiceResponse
      <$> fromGrpc (Grpc.listInvoiceResponseInvoices x)
      <*> fromGrpc (Grpc.listInvoiceResponseLastIndexOffset x)
      <*> fromGrpc (Grpc.listInvoiceResponseFirstIndexOffset x)
