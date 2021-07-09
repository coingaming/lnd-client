module LndClient.Data.Invoice
  ( Invoice (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified LndGrpc as GRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Invoice
  = Invoice
      { rHash :: RHash,
        amtPaidMsat :: MSat,
        valueMsat :: MSat,
        settled :: Bool,
        settleIndex :: Maybe SettleIndex,
        memo :: Text,
        paymentRequest :: PaymentRequest,
        private :: Bool,
        addIndex :: AddIndex,
        state :: InvoiceState --GRPC.Invoice_InvoiceState
      }
  deriving (Eq, Show)

data InvoiceState
  = OPEN
  | SETTLED
  | CANCELED
  | ACCEPTED
  deriving (Eq, Show)

instance FromGrpc Invoice GRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> fromGrpc (GRPC.invoiceRHash x)
      <*> fromGrpc (GRPC.invoiceAmtPaidMsat x)
      <*> fromGrpc (GRPC.invoiceValueMsat x)
      <*> fromGrpc (GRPC.invoiceSettled x)
      <*> fromGrpc (GRPC.invoiceSettleIndex x)
      <*> fromGrpc (GRPC.invoiceMemo x)
      <*> fromGrpc (GRPC.invoicePaymentRequest x)
      <*> fromGrpc (GRPC.invoicePrivate x)
      <*> fromGrpc (GRPC.invoiceAddIndex x)
      <*> Right OPEN

-- <*> first
--   (\e -> FromGrpcError $ "Invalid Invoice State" <> show e)
--   (enumerated $ GRPC.invoiceState x)

instance C2.FromGrpc Invoice LnGRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> invoiceRHash
      <*> invoiceAmtPaidMsat
      <*> invoiceValueMsat
      <*> invoiceSettled
      <*> invoiceSettleIndex
      <*> invoiceMemo
      <*> invoicePaymentRequest
      <*> invoicePrivate
      <*> invoiceAddIndex
      <*> invoiceState
    where
      invoiceRHash = second RHash $ maybeToRight (FromGrpcError "RHash is not set") $ x ^? LnGRPC.rHash
      invoiceAmtPaidMsat = join $ second fromGrpc $ maybeToRight (FromGrpcError "AmtPaidMsat is not set") $ x ^? LnGRPC.amtPaidMsat
      invoiceValueMsat = join $ second fromGrpc $ maybeToRight (FromGrpcError "Value is not set") $ x ^? LnGRPC.valueMsat
      invoiceSettled = maybeToRight (FromGrpcError "Settled is not set") $ x ^? LnGRPC.settled
      invoiceSettleIndex = Right $ SettleIndex <$> x ^? LnGRPC.settleIndex
      invoiceMemo = second fromStrict $ maybeToRight (FromGrpcError "Memo is not set") $ x ^? LnGRPC.memo
      invoicePaymentRequest = second (PaymentRequest . fromStrict) $ maybeToRight (FromGrpcError "PaymentRequest is not set") $ x ^? LnGRPC.paymentRequest
      invoicePrivate = maybeToRight (FromGrpcError "Private is not set") $ x ^? LnGRPC.private
      invoiceAddIndex = second AddIndex $ maybeToRight (FromGrpcError "AddIndex is not set") $ x ^? LnGRPC.addIndex
      invoiceState = join $ second C2.fromGrpc $ maybeToRight (FromGrpcError "InvoiceState is not set") $ x ^? LnGRPC.state

instance C2.FromGrpc InvoiceState LnGRPC.Invoice'InvoiceState where
  fromGrpc x =
    case x of
      LnGRPC.Invoice'OPEN -> Right OPEN
      LnGRPC.Invoice'SETTLED -> Right SETTLED
      LnGRPC.Invoice'CANCELED -> Right CANCELED
      LnGRPC.Invoice'ACCEPTED -> Right ACCEPTED
      _ -> Left $ FromGrpcError "Invalid Invoice state"

instance FromGrpc InvoiceState GRPC.Invoice'InvoiceState where
  fromGrpc x =
    case x of
      LnGRPC.Invoice'OPEN -> Right OPEN
      LnGRPC.Invoice'SETTLED -> Right SETTLED
      LnGRPC.Invoice'CANCELED -> Right CANCELED
      LnGRPC.Invoice'ACCEPTED -> Right ACCEPTED
      _ -> Left $ FromGrpcError "Invalid Invoice state"
