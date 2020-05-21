module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import LndClient.Import
import qualified WalletUnlockerGrpc as GRPC

data InitWalletRequest
  = InitWalletRequest
      { walletPassword :: ByteString,
        cipherSeedMnemonic :: [Text],
        aezeedPassphrase :: Maybe ByteString
        --
        --  TODO : channel_backups
        --
      }
  deriving (Eq)

instance ToGrpc InitWalletRequest GRPC.InitWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (cipherSeedMnemonic x)
      <*> toGrpc (aezeedPassphrase x)
    where
      msg gWalletPassword gCipherSeedMnemonic gAezeedPassphrase =
        def
          { GRPC.initWalletRequestWalletPassword = gWalletPassword,
            GRPC.initWalletRequestCipherSeedMnemonic = gCipherSeedMnemonic,
            GRPC.initWalletRequestAezeedPassphrase = gAezeedPassphrase
          }
