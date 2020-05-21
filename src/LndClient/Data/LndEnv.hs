module LndClient.Data.LndEnv
  ( LndEnv (..),
    LndWalletPassword (..),
    LndTlsCert (..),
    LndHexMacaroon (..),
    newLndEnv,
    readLndEnv,
  )
where

import Env
import LndClient.Import.External
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client

newtype LndWalletPassword = LndWalletPassword ByteString

newtype LndTlsCert = LndTlsCert ByteString

newtype LndHexMacaroon = LndHexMacaroon ByteString

data RawConfig
  = RawConfig
      { rawConfigLndWalletPassword :: ByteString,
        rawConfigLndTlsCert :: ByteString,
        rawConfigLndHexMacaroon :: ByteString,
        rawConfigLndHost :: ByteString,
        --
        -- TODO : use Word32
        --
        rawConfigLndPort :: Int
      }

data LndEnv
  = LndEnv
      { envLndWalletPassword :: LndWalletPassword,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndGrpcConfig :: ClientConfig
      }

rawConfig :: IO RawConfig
rawConfig =
  parse (header "LndClient config") $
    RawConfig
      <$> var (str <=< nonempty) "LND_CLIENT_LND_WALLET_PASSWORD" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_TLS_CERT" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HEX_MACAROON" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HOST" (keep <> help "")
      <*> var (auto <=< nonempty) "LND_CLIENT_LND_PORT" (keep <> help "")

readLndEnv :: IO LndEnv
readLndEnv = do
  rc <- rawConfig
  case newLndEnv
    (LndWalletPassword $ rawConfigLndWalletPassword rc)
    (LndTlsCert $ rawConfigLndTlsCert rc)
    (LndHexMacaroon $ rawConfigLndHexMacaroon rc)
    (Host $ rawConfigLndHost rc)
    (Port $ rawConfigLndPort rc) of
    Left x -> fail x
    Right x -> return x

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  Host ->
  Port ->
  Either String LndEnv
newLndEnv pwd cert mac host port =
  --
  -- TODO : implement smart constructor
  -- verify certificate and all other data
  --
  Right $
    LndEnv
      { envLndWalletPassword = pwd,
        envLndHexMacaroon = mac,
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
