module LndClient.Data.Invoice
  ( Invoice (..),
    InvoiceState (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as LnGRPC
import qualified Proto.Lnrpc.Ln1_Fields as LnGRPC

data Invoice = Invoice
  { rHash :: RHash,
    amtPaidMsat :: Msat,
    valueMsat :: Msat,
    settled :: Bool,
    settleIndex :: Maybe SettleIndex,
    memo :: Text,
    paymentRequest :: PaymentRequest,
    private :: Bool,
    addIndex :: AddIndex,
    state :: InvoiceState
  }
  deriving stock (Eq, Show, Generic)

instance Out Invoice

data InvoiceState
  = OPEN
  | SETTLED
  | CANCELED
  | ACCEPTED
  deriving stock (Eq, Show, Generic)

instance Out InvoiceState

instance FromGrpc Invoice LnGRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> fromGrpc (x ^. LnGRPC.rHash)
      <*> tryFromGrpcMSat (x ^. LnGRPC.amtPaidMsat)
      <*> tryFromGrpcMSat (x ^. LnGRPC.valueMsat)
      <*> fromGrpc (x ^. LnGRPC.settled)
      <*> fromGrpc (x ^. LnGRPC.settleIndex)
      <*> fromGrpc (x ^. LnGRPC.memo)
      <*> fromGrpc (x ^. LnGRPC.paymentRequest)
      <*> fromGrpc (x ^. LnGRPC.private)
      <*> fromGrpc (x ^. LnGRPC.addIndex)
      <*> fromGrpc (x ^. LnGRPC.state)

instance FromGrpc InvoiceState LnGRPC.Invoice'InvoiceState where
  fromGrpc x =
    case x of
      LnGRPC.Invoice'OPEN -> Right OPEN
      LnGRPC.Invoice'SETTLED -> Right SETTLED
      LnGRPC.Invoice'CANCELED -> Right CANCELED
      LnGRPC.Invoice'ACCEPTED -> Right ACCEPTED
      LnGRPC.Invoice'InvoiceState'Unrecognized v ->
        Left
          . FromGrpcError
          $ "Cannot parse InvoiceState, value:" <> inspectPlain v
