module LndClient.Data.WalletBalance
  ( WalletBalance (..),
  )
where

import LndClient.Import
import qualified Proto.Lnrpc.Ln0 as Proto
import qualified Proto.Lnrpc.Ln0_Fields as Proto

data WalletBalance = WalletBalance
  { totalBalance :: MSat,
    confirmedBalance :: MSat,
    unconfirmedBalance :: MSat
  }
  deriving stock (Eq, Ord, Show, Generic)

instance Out WalletBalance

instance FromGrpc WalletBalance Proto.WalletBalanceResponse where
  fromGrpc x =
    WalletBalance
      <$> fromGrpcMSat (x ^. Proto.totalBalance)
      <*> fromGrpcMSat (x ^. Proto.confirmedBalance)
      <*> fromGrpcMSat (x ^. Proto.unconfirmedBalance)
