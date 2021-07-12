module LndClient.Data.Invoice
  ( Invoice (..),
    InvoiceState (..),
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
      <*> ( fromGrpc
              =<< first
                (\e -> FromGrpcError $ "Invalid Invoice State" <> show e)
                (enumerated $ GRPC.invoiceState x)
          )

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
      invoiceRHash = Right . RHash $ x ^. LnGRPC.rHash
      invoiceAmtPaidMsat = fromGrpc $ x ^. LnGRPC.amtPaidMsat
      invoiceValueMsat = fromGrpc $ x ^. LnGRPC.valueMsat
      invoiceSettled = Right $ x ^. LnGRPC.settled
      invoiceSettleIndex = Right . Just . SettleIndex $ x ^. LnGRPC.settleIndex
      invoiceMemo = Right . fromStrict $ x ^. LnGRPC.memo
      invoicePaymentRequest = Right . PaymentRequest . fromStrict $ x ^. LnGRPC.paymentRequest
      invoicePrivate = Right $ x ^. LnGRPC.private
      invoiceAddIndex = Right . AddIndex $ x ^. LnGRPC.addIndex
      invoiceState = C2.fromGrpc $ x ^. LnGRPC.state

instance C2.FromGrpc InvoiceState LnGRPC.Invoice'InvoiceState where
  fromGrpc x =
    case x of
      LnGRPC.Invoice'OPEN -> Right OPEN
      LnGRPC.Invoice'SETTLED -> Right SETTLED
      LnGRPC.Invoice'CANCELED -> Right CANCELED
      LnGRPC.Invoice'ACCEPTED -> Right ACCEPTED
      _ -> Left $ FromGrpcError "Invalid Invoice state"

instance FromGrpc InvoiceState GRPC.Invoice_InvoiceState where
  fromGrpc x =
    case x of
      GRPC.Invoice_InvoiceStateOPEN -> Right OPEN
      GRPC.Invoice_InvoiceStateSETTLED -> Right SETTLED
      GRPC.Invoice_InvoiceStateCANCELED -> Right CANCELED
      GRPC.Invoice_InvoiceStateACCEPTED -> Right ACCEPTED
