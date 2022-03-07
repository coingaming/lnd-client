module LndClient.Data.Payment
  ( Payment (..),
    PaymentStatus (..),
  )
where

import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Payment = Payment
  { paymentHash :: RHash,
    paymentPreimage :: RPreimage,
    valueMsat :: MSat,
    state :: PaymentStatus
  }
  deriving (Eq, Show, Generic)

instance Out Payment

data PaymentStatus
  = UNKNOWN
  | IN_FLIGHT
  | SUCCEEDED
  | FAILED
  deriving (Eq, Show, Generic)

instance Out PaymentStatus

instance FromGrpc Payment LnGRPC.Payment where
  fromGrpc x =
    Payment
      <$> fromGrpc (x ^. LnGRPC.paymentHash)
      <*> fromGrpc (x ^. LnGRPC.paymentPreimage)
      <*> fromGrpcMSat (x ^. LnGRPC.valueMsat)
      <*> fromGrpc (x ^. LnGRPC.status)

instance FromGrpc PaymentStatus LnGRPC.Payment'PaymentStatus where
  fromGrpc x =
    case x of
      LnGRPC.Payment'UNKNOWN -> Right UNKNOWN
      LnGRPC.Payment'IN_FLIGHT -> Right IN_FLIGHT
      LnGRPC.Payment'SUCCEEDED -> Right SUCCEEDED
      LnGRPC.Payment'FAILED -> Right FAILED
      LnGRPC.Payment'PaymentStatus'Unrecognized v ->
        Left
          . FromGrpcError
          $ "Cannot parse PaymentStatus, value:" <> inspect v
