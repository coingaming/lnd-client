module LndClient.Data.UnlockWallet
  ( UnlockWalletRequest (..),
  )
where

import LndClient.Import
import qualified WalletUnlockerGrpc as GRPC
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

instance ToGrpc UnlockWalletRequest GRPC.UnlockWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (recoveryWindow x)
    where
      msg gWalletPassword gRecoveryWindow =
        def
          { GRPC.unlockWalletRequestWalletPassword = gWalletPassword,
            GRPC.unlockWalletRequestRecoveryWindow = gRecoveryWindow
          }
