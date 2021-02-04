module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import LndClient.Import
import qualified WalletUnlockerGrpc as GRPC
import Prelude (Show (..))

data InitWalletRequest
  = InitWalletRequest
      { walletPassword :: LndWalletPassword,
        cipherSeedMnemonic :: CipherSeedMnemonic,
        aezeedPassphrase :: Maybe AezeedPassphrase
      }
  deriving (Eq)

instance Show InitWalletRequest where
  show = const "SECRET"

instance ToGrpc InitWalletRequest GRPC.InitWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (cipherSeedMnemonic x)
      <*> toGrpc (aezeedPassphrase x)
    where
      msg gWalletPassword gCipherSeedMnemonic gAezeedPassphrase =
        def
          { GRPC.initWalletRequestWalletPassword =
              gWalletPassword,
            GRPC.initWalletRequestCipherSeedMnemonic =
              gCipherSeedMnemonic,
            GRPC.initWalletRequestAezeedPassphrase =
              gAezeedPassphrase
          }
