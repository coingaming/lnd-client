module LndClient.Data.Invoice
  ( Invoice (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data Invoice
  = Invoice
      { rHash :: RHash,
        amtPaidSat :: MoneyAmount,
        -- creationDate :: Maybe Text,
        -- settleDate :: Maybe Text,
        value :: MoneyAmount,
        -- expiry :: Maybe Text,
        settled :: Bool,
        settleIndex :: Maybe SettleIndex,
        descriptionHash :: ByteString,
        memo :: Text,
        paymentRequest :: PaymentRequest,
        -- fallbackAddr :: Maybe Text,
        -- cltvExpiry :: Maybe Text,
        private :: Bool,
        addIndex :: AddIndex,
        state :: GRPC.Invoice_InvoiceState
      }
  deriving (Eq)

instance FromGrpc Invoice GRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> fromGrpc (GRPC.invoiceRHash x)
      <*> fromGrpc (GRPC.invoiceAmtPaidSat x)
      -- <*> fromGrpc (GRPC.invoiceCreationDate x)
      -- <*> fromGrpc (GRPC.invoiceSettleDate x)
      <*> fromGrpc (GRPC.invoiceValue x)
      -- <*> fromGrpc (GRPC.invoiceExpiry x)
      <*> fromGrpc (GRPC.invoiceSettled x)
      <*> fromGrpc (GRPC.invoiceSettleIndex x)
      <*> fromGrpc (GRPC.invoiceDescriptionHash x)
      <*> fromGrpc (GRPC.invoiceMemo x)
      <*> fromGrpc (GRPC.invoicePaymentRequest x)
      -- <*> fromGrpc (GRPC.invoiceFallbackAddr x)
      -- <*> fromGrpc (GRPC.invoiceCltvExpiry x)
      <*> fromGrpc (GRPC.invoicePrivate x)
      <*> fromGrpc (GRPC.invoiceAddIndex x)
      <*> first
        (\e -> FromGrpcError $ "Invalid Invoice State" <> show e)
        (enumerated $ GRPC.invoiceState x)
