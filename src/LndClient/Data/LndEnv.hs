{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    LndB64WalletPassword (..),
    LndTlsCert (..),
    LndTlsKey (..),
    LndHexMacaroon (..),
    LndTlsManagerBuilder (..),
    LndUrl (..),
    newLndEnv,
  )
where

import Data.ByteString (ByteString)
import Data.Coerce (coerce)
import Data.Default (def)
import Data.Text (Text)
import Network.Connection (TLSSettings (..))
import Network.HTTP.Client (Manager, newManager)
import Network.HTTP.Client.TLS (mkManagerSettings)
import Network.TLS
  ( clientHooks,
    clientSupported,
    credentialLoadX509FromMemory,
    defaultParamsClient,
    onCertificateRequest,
    onServerCertificate,
    supportedCiphers,
  )
import Network.TLS.Extra.Cipher (ciphersuite_default)

newtype LndB64WalletPassword = LndB64WalletPassword Text

newtype LndTlsCert = LndTlsCert ByteString

newtype LndTlsKey = LndTlsKey ByteString

newtype LndTlsManagerBuilder = LndTlsManagerBuilder (IO Manager)

newtype LndHexMacaroon = LndHexMacaroon ByteString

newtype LndUrl = LndUrl String

data LndEnv
  = LndEnv
      { envLndB64WalletPassword :: LndB64WalletPassword,
        envLndTlsManagerBuilder :: LndTlsManagerBuilder,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndUrl :: LndUrl
      }

newLndEnv ::
  LndB64WalletPassword ->
  LndTlsCert ->
  LndTlsKey ->
  LndHexMacaroon ->
  LndUrl ->
  Either String LndEnv
newLndEnv pwd cert key mac url =
  ( \x509 ->
      --
      --  TODO : proper certificate handlers
      --
      let hooks =
            def
              { onCertificateRequest = \_ -> return $ Just x509,
                onServerCertificate = \_ _ _ _ -> return []
              }
          settings =
            TLSSettings $
              (defaultParamsClient "" "")
                { clientHooks = hooks,
                  clientSupported = def {supportedCiphers = ciphersuite_default}
                }
       in LndEnv
            { envLndB64WalletPassword = pwd,
              envLndTlsManagerBuilder =
                LndTlsManagerBuilder . newManager $
                  mkManagerSettings settings Nothing,
              envLndHexMacaroon = mac,
              envLndUrl = url
            }
  )
    <$> credentialLoadX509FromMemory (coerce cert) (coerce key)
