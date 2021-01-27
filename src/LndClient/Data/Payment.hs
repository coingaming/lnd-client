module LndClient.Data.Payment
  ( Payment (..),
  )
where

import LndClient.Import
import qualified LndGrpc as GRPC

data Payment
  = Payment
      { paymentHash :: RHash,
        paymentPreimage :: RPreimage,
        valueSat :: MoneyAmount,
        state :: GRPC.Payment_PaymentStatus
      }
  deriving (Eq, Show)

instance FromGrpc Payment GRPC.Payment where
  fromGrpc x =
    Payment
      <$> fromGrpc (GRPC.paymentPaymentHash x)
      <*> fromGrpc (GRPC.paymentPaymentPreimage x)
      <*> fromGrpc (GRPC.paymentValueSat x)
      <*> first
        (\e -> FromGrpcError $ "Invalid Payment State" <> show e)
        (enumerated $ GRPC.paymentStatus x)
