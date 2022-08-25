{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data AddInvoiceRequest = AddInvoiceRequest
  { valueMsat :: Msat,
    memo :: Maybe Text,
    expiry :: Maybe Seconds
  }
  deriving stock (Eq, Show, Generic)

instance Out AddInvoiceRequest

data AddInvoiceResponse = AddInvoiceResponse
  { rHash :: RHash,
    paymentRequest :: PaymentRequest,
    addIndex :: AddIndex
  }
  deriving stock (Eq, Show, Generic)

instance Out AddInvoiceResponse

instance ToGrpc AddInvoiceRequest LnGRPC.Invoice where
  toGrpc x =
    msg
      <$> toGrpc (memo x)
      <*> toGrpcMSat (valueMsat x)
      <*> toGrpc (expiry x)
    where
      msg gMemo gValue gExp =
        defMessage
          & LnGRPC.memo .~ gMemo
          & LnGRPC.valueMsat .~ gValue
          & LnGRPC.expiry .~ gExp

instance FromGrpc AddInvoiceResponse LnGRPC.AddInvoiceResponse where
  fromGrpc x =
    AddInvoiceResponse
      <$> fromGrpc (x ^. LnGRPC.rHash)
      <*> fromGrpc (x ^. LnGRPC.paymentRequest)
      <*> fromGrpc (x ^. LnGRPC.addIndex)
