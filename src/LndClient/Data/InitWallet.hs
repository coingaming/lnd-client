{-# LANGUAGE FlexibleContexts #-}

module LndClient.Data.InitWallet
  ( InitWalletRequest (..),
  )
where

import Data.ProtoLens.Message
import qualified LndClient.Class as C
import qualified LndClient.Class2 as C2
import LndClient.Import
import qualified Proto.WalletUnlockerGrpc as LnGRPC
import qualified Proto.WalletUnlockerGrpc_Fields as LnGRPC
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

instance C2.ToGrpc InitWalletRequest LnGRPC.InitWalletRequest where
  toGrpc x =
    msg
      <$> toGrpc (walletPassword x)
      <*> toGrpc (cipherSeedMnemonic x)
      <*> toGrpc (aezeedPassphrase x)
    where
      msg :: ByteString -> Vector Text -> ByteString -> LnGRPC.InitWalletRequest
      msg gWalletPassword gCipherSeedMnemonic gAezeedPassphrase =
        defMessage
          & LnGRPC.walletPassword .~ gWalletPassword
          & LnGRPC.cipherSeedMnemonic .~ toList (toStrict <$> gCipherSeedMnemonic)
          & LnGRPC.aezeedPassphrase .~ gAezeedPassphrase
