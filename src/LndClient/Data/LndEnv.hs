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
    readLndEnv,
  )
where

import Data.Default as Import (def)
import Env hiding (def)
import LndClient.Import.External
import Network.Connection (TLSSettings (..))
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client
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

data RawConfig
  = RawConfig
      { rawConfigLndB64WalletPassword :: Text,
        rawConfigLndTlsCert :: ByteString,
        rawConfigLndTlsKey :: ByteString,
        rawConfigLndHexMacaroon :: ByteString,
        rawConfigLndUrl :: String,
        rawConfigLndHost :: ByteString,
        --
        -- TODO : use Word32
        --
        rawConfigLndPort :: Int
      }

data LndEnv
  = LndEnv
      { envLndB64WalletPassword :: LndB64WalletPassword,
        envLndTlsManagerBuilder :: LndTlsManagerBuilder,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndUrl :: LndUrl,
        envLndGrpcConfig :: ClientConfig
      }

rawConfig :: IO RawConfig
rawConfig =
  parse (header "LndClient config") $
    RawConfig
      <$> var
        (str <=< nonempty)
        "LND_CLIENT_LND_B64_WALLET_PASSWORD"
        (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_TLS_CERT" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_TLS_KEY" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HEX_MACAROON" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_URL" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HOST" (keep <> help "")
      <*> var (auto <=< nonempty) "LND_CLIENT_LND_PORT" (keep <> help "")

readLndEnv :: IO LndEnv
readLndEnv = do
  rc <- rawConfig
  case newLndEnv
    (LndB64WalletPassword $ rawConfigLndB64WalletPassword rc)
    (LndTlsCert $ rawConfigLndTlsCert rc)
    (LndTlsKey $ rawConfigLndTlsKey rc)
    (LndHexMacaroon $ rawConfigLndHexMacaroon rc)
    (LndUrl $ rawConfigLndUrl rc)
    (Host $ rawConfigLndHost rc)
    (Port $ rawConfigLndPort rc) of
    Left x -> fail x
    Right x -> return x

newLndEnv ::
  LndB64WalletPassword ->
  LndTlsCert ->
  LndTlsKey ->
  LndHexMacaroon ->
  LndUrl ->
  Host ->
  Port ->
  Either String LndEnv
newLndEnv pwd cert key mac url host port =
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
              envLndUrl = url,
              envLndGrpcConfig =
                ClientConfig
                  { clientServerHost = host,
                    clientServerPort = port,
                    clientArgs = [],
                    clientSSLConfig =
                      Just $
                        ClientSSLConfig
                          { serverRootCert = Just $ coerce cert,
                            clientSSLKeyCertPair = Nothing,
                            clientMetadataPlugin = Nothing
                          },
                    clientAuthority = Nothing
                  }
            }
  )
    <$> credentialLoadX509FromMemory (coerce cert) (coerce key)
