{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    LndWalletPassword (..),
    LndTlsCert (..),
    LndHexMacaroon (..),
    LndHost (..),
    LndPort (..),
    newLndEnv,
    readLndEnv,
  )
where

import Data.ByteString.Char8 as C8
import qualified Data.PEM as Pem
import Data.Text.Lazy as LT
import Data.X509
import Env
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External
import LndClient.Util as U
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client

newtype LndWalletPassword = LndWalletPassword ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndTlsCert = LndTlsCert ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndHexMacaroon = LndHexMacaroon ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndHost = LndHost ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndPort = LndPort Word32
  deriving (PersistField, PersistFieldSql, Eq)

instance ToGrpc LndWalletPassword ByteString where
  toGrpc = Right . coerce

data RawConfig
  = RawConfig
      { rawConfigLndWalletPassword :: ByteString,
        rawConfigLndTlsCert :: ByteString,
        rawConfigLndHexMacaroon :: ByteString,
        rawConfigLndHost :: ByteString,
        --
        -- TODO : use Word32
        --
        rawConfigLndPort :: Word32
      }

data LndEnv
  = LndEnv
      { envLndWalletPassword :: LndWalletPassword,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndGrpcConfig :: ClientConfig,
        envLndLogErrors :: Bool
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
    (LndHost $ rawConfigLndHost rc)
    (LndPort $ rawConfigLndPort rc) of
    Left x -> fail $ show x
    Right x -> return x

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  LndHost ->
  LndPort ->
  Either LndError LndEnv
newLndEnv pwd cert mac host port =
  createLndEnv <$> validatePort port <*> validateCert cert
  where
    validatePort :: LndPort -> Either LndError Int
    validatePort p = do
      let port32 :: Word32 = coerce p
      let maybePort :: Maybe Int = U.safeFromIntegral port32
      maybeToRight (LndEnvError "Wrong port") maybePort
    validateCert :: LndTlsCert -> Either LndError LndTlsCert
    validateCert c = do
      pemsM <- first (LndEnvError . LT.pack) $ Pem.pemParseBS $ coerce c
      pem <- note (LndEnvError $ LT.pack "No pem found") $ safeHead pemsM
      bimap
        (LndEnvError . LT.pack . ("Certificate is not valid: " <>))
        (const c)
        (decodeSignedCertificate $ Pem.pemContent pem)
    createLndEnv :: Int -> LndTlsCert -> LndEnv
    createLndEnv p c =
      LndEnv
        { envLndWalletPassword = pwd,
          envLndHexMacaroon = mac,
          envLndLogErrors = True,
          envLndGrpcConfig =
            ClientConfig
              { clientServerHost = Host $ coerce host,
                clientServerPort = Port p,
                clientArgs = [],
                clientSSLConfig =
                  Just $
                    ClientSSLConfig
                      { serverRootCert = Just $ coerce c,
                        clientSSLKeyCertPair = Nothing,
                        clientMetadataPlugin = Nothing
                      },
                clientAuthority = Nothing
              }
        }
