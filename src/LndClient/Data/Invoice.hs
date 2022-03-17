module LndClient.Data.Invoice
  ( Invoice (..),
    InvoiceState (..),
  )
where

import LndClient.Import
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lightning_Fields as LnGRPC

data Invoice = Invoice
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
  deriving (Eq, Show, Generic)

instance Out Invoice

data InvoiceState
  = OPEN
  | SETTLED
  | CANCELED
  | ACCEPTED
  deriving (Eq, Show, Generic)

instance Out InvoiceState

instance FromGrpc Invoice LnGRPC.Invoice where
  fromGrpc x =
    Invoice
      <$> fromGrpc (x ^. LnGRPC.rHash)
      <*> fromGrpcMSat (x ^. LnGRPC.amtPaidMsat)
      <*> fromGrpcMSat (x ^. LnGRPC.valueMsat)
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
          $ "Cannot parse InvoiceState, value:" <> inspect v
