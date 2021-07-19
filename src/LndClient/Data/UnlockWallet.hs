module LndClient.Data.UnlockWallet
  ( UnlockWalletRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.WalletUnlockerGrpc as LnGRPC
import qualified Proto.WalletUnlockerGrpc_Fields as LnGRPC
import Prelude (Show (..))

data UnlockWalletRequest
  = UnlockWalletRequest
      { walletPassword :: LndWalletPassword,
        recoveryWindow :: Int32
        --
        --  TODO : channel_backups
        --
      }
  deriving (Eq)

instance Show UnlockWalletRequest where
  show = const "SECRET"

instance C2.ToGrpc UnlockWalletRequest LnGRPC.UnlockWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (recoveryWindow x)
    where
      msg :: ByteString -> Int32 -> LnGRPC.UnlockWalletRequest
      msg gWalletPassword gRecoveryWindow =
        defMessage
          & LnGRPC.walletPassword .~ gWalletPassword
          & LnGRPC.recoveryWindow .~ gRecoveryWindow
