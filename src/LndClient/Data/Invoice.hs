module LndClient.Data.Invoice
  ( Invoice (..),
    InvoiceState (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
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
        state :: InvoiceState
      }
  deriving (Eq, Show)

data InvoiceState
  = OPEN
  | SETTLED
  | CANCELED
  | ACCEPTED
  deriving (Eq, Show)

instance C2.FromGrpc Invoice LnGRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> fromGrpc (x ^. LnGRPC.rHash)
      <*> fromGrpc (x ^. LnGRPC.amtPaidMsat)
      <*> fromGrpc (x ^. LnGRPC.valueMsat)
      <*> fromGrpc (x ^. LnGRPC.settled)
      <*> fromGrpc (x ^. LnGRPC.settleIndex)
      <*> fromGrpc (x ^. LnGRPC.memo)
      <*> fromGrpc (fromStrict $ x ^. LnGRPC.paymentRequest)
      <*> fromGrpc (x ^. LnGRPC.private)
      <*> fromGrpc (x ^. LnGRPC.addIndex)
      <*> C2.fromGrpc (x ^. LnGRPC.state)

instance C2.FromGrpc InvoiceState LnGRPC.Invoice'InvoiceState where
  fromGrpc x =
    case x of
      LnGRPC.Invoice'OPEN -> Right OPEN
      LnGRPC.Invoice'SETTLED -> Right SETTLED
      LnGRPC.Invoice'CANCELED -> Right CANCELED
      LnGRPC.Invoice'ACCEPTED -> Right ACCEPTED
      _ -> Left $ FromGrpcError "InvoiceState value cannot be recognized"
