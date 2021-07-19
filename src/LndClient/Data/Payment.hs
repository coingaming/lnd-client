module LndClient.Data.Payment
  ( Payment (..),
  )
where

import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

data Payment
  = Payment
      { paymentHash :: RHash,
        paymentPreimage :: RPreimage,
        valueMsat :: MSat,
        state :: PaymentStatus
      }
  deriving (Eq, Show)

data PaymentStatus
  = UNKNOWN
  | IN_FLIGHT
  | SUCCEEDED
  | FAILED
  deriving (Eq, Show)

instance C2.FromGrpc Payment LnGRPC.Payment where
  fromGrpc x =
    Payment
      <$> fromGrpc (fromStrict $ x ^. LnGRPC.paymentHash)
      <*> fromGrpc (fromStrict $ x ^. LnGRPC.paymentPreimage)
      <*> fromGrpc (x ^. LnGRPC.valueMsat)
      <*> C2.fromGrpc (x ^. LnGRPC.status)

instance C2.FromGrpc PaymentStatus LnGRPC.Payment'PaymentStatus where
  fromGrpc x =
    case x of
      LnGRPC.Payment'UNKNOWN -> Right UNKNOWN
      LnGRPC.Payment'IN_FLIGHT -> Right IN_FLIGHT
      LnGRPC.Payment'SUCCEEDED -> Right SUCCEEDED
      LnGRPC.Payment'FAILED -> Right FAILED
      _ -> Left $ FromGrpcError "Can't parse PaymentStatus"
