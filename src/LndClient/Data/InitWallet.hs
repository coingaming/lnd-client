{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import Data.ProtoLens.Message
import LndClient.Import
import qualified Proto.WalletUnlockerGrpc as LnGRPC
import qualified Proto.WalletUnlockerGrpc_Fields as LnGRPC
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

instance ToGrpc InitWalletRequest LnGRPC.InitWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (cipherSeedMnemonic x)
      <*> toGrpc (aezeedPassphrase x)
    where
      msg :: ByteString -> [Text] -> ByteString -> LnGRPC.InitWalletRequest
      msg gWalletPassword gCipherSeedMnemonic gAezeedPassphrase =
        defMessage
          & LnGRPC.walletPassword .~ gWalletPassword
          & LnGRPC.cipherSeedMnemonic .~ gCipherSeedMnemonic
          & LnGRPC.aezeedPassphrase .~ gAezeedPassphrase
