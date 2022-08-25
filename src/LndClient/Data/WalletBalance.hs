module LndClient.Data.WalletBalance
  ( WalletBalance (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as Proto
import qualified Proto.Lnrpc.Ln0_Fields as Proto

data WalletBalance = WalletBalance
  { totalBalance :: Msat,
    confirmedBalance :: Msat
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out WalletBalance

instance FromGrpc WalletBalance Proto.WalletBalanceResponse where
  fromGrpc x =
    WalletBalance
      <$> tryFromGrpcMSat (x ^. Proto.totalBalance)
      <*> tryFromGrpcMSat (x ^. Proto.confirmedBalance)
