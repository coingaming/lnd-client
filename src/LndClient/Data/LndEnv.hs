{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    RawConfig,
    LndWalletPassword (..),
    LndTlsCert,
    LndHexMacaroon (..),
    LndHost' (..),
    LndPort',
    LndConfig (..),
    newLndEnv,
    readLndEnv,
    createLndTlsCert,
    unLndTlsCert,
    createLndPort,
    enforceDebugSev,
  )
where

import Data.Aeson as A
  ( Result (..),
    Value (..),
    camelTo2,
    defaultOptions,
    eitherDecodeStrict,
    fieldLabelModifier,
    genericParseJSON,
    withObject,
    (.:?),
  )
import qualified Data.ByteString.Char8 as C8
import qualified Data.PEM as Pem
import Data.Scientific
import Data.X509
import Data.X509.CertificateStore
import Env
import LndClient.Class
import LndClient.Data.Newtype
import LndClient.Data.Type
import LndClient.Import.External as Ex
import LndClient.Util as U
import Network.GRPC.Client.Helpers
  ( GrpcClientConfig (..),
    grpcClientConfigSimple,
  )
import Network.GRPC.HTTP2.Encoding (uncompressed)
import Network.HTTP2.Client
import qualified Network.TLS as TLS
import qualified Network.TLS.Extra.Cipher as TLS
import qualified Universum
import qualified Prelude

newtype LndWalletPassword = LndWalletPassword Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

data LndTlsCert = LndTlsCert ByteString SignedCertificate
  deriving (Eq, Show)

newtype LndHexMacaroon = LndHexMacaroon Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndHost' = LndHost' Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString, Generic)

instance Out LndHost'

newtype LndPort' = LndPort' Int
  deriving (PersistField, PersistFieldSql, Eq, Generic)

instance Out LndPort'

data LndConfig = LndConfig
  { lndConfigHost :: HostName,
    lndConfigPort :: PortNumber,
    lndConfigTlsEnabled :: Bool,
    lndConfigCompression :: Bool
  }
  deriving (Show)

data RawConfig = RawConfig
  { rawConfigLndWalletPassword :: LndWalletPassword,
    rawConfigLndTlsCert :: LndTlsCert,
    rawConfigLndHexMacaroon :: LndHexMacaroon,
    rawConfigLndHost :: LndHost',
    rawConfigLndPort :: LndPort',
    rawConfigLndCipherSeedMnemonic :: Maybe CipherSeedMnemonic,
    rawConfigLndAezeedPassphrase :: Maybe AezeedPassphrase
  }
  deriving (Eq, Generic)

data LndEnv = LndEnv
  { envLndWalletPassword :: LndWalletPassword,
    envLndHexMacaroon :: LndHexMacaroon,
    envLndLogStrategy :: LoggingStrategy,
    envLndCipherSeedMnemonic :: Maybe CipherSeedMnemonic,
    envLndAezeedPassphrase :: Maybe AezeedPassphrase,
    envLndSyncGrpcTimeout :: Maybe GrpcTimeoutSeconds,
    envLndAsyncGrpcTimeout :: Maybe GrpcTimeoutSeconds,
    envLndConfig :: GrpcClientConfig
  }

instance ToGrpc LndWalletPassword ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

instance FromJSON LndTlsCert where
  parseJSON x =
    case x of
      A.String s ->
        case createLndTlsCert $ encodeUtf8 s of
          Right cert -> return cert
          Left e -> failure e
      e -> failure e
    where
      failure err =
        fail $
          "Json certificate parsing error: " <> Prelude.show err

instance FromJSON LndPort' where
  parseJSON x =
    case x of
      A.Number s -> do
        let ePort :: Either LndError Word32 =
              maybeToRight
                (LndEnvError "Port should be Int")
                $ toBoundedInteger s
        case ePort >>= createLndPort of
          Right lndPort -> return lndPort
          Left err -> failure err
      err -> failure err
    where
      failure err =
        fail $
          "Json port loading error: " <> Prelude.show err

instance FromJSON RawConfig where
  parseJSON =
    genericParseJSON
      defaultOptions
        { fieldLabelModifier = camelTo2 '_' . Ex.drop 9
        }

instance FromJSON LndEnv where
  parseJSON arg =
    case fromJSON arg :: Result RawConfig of
      Error e -> fail e
      Success rc -> do
        let res =
              newLndEnv
                (rawConfigLndWalletPassword rc)
                (rawConfigLndTlsCert rc)
                (rawConfigLndHexMacaroon rc)
                (rawConfigLndHost rc)
                (rawConfigLndPort rc)
                (rawConfigLndCipherSeedMnemonic rc)
                (rawConfigLndAezeedPassphrase rc)
        withObject
          "LndEnv"
          ( \obj ->
              (\x y -> res {envLndSyncGrpcTimeout = x, envLndAsyncGrpcTimeout = y})
                <$> obj .:? "lnd_sync_grpc_timeout_seconds"
                <*> obj .:? "lnd_async_grpc_timeout_seconds"
          )
          arg

createLndTlsCert :: ByteString -> Either LndError LndTlsCert
createLndTlsCert bs = do
  pemsM <- first (LndEnvError . pack) $ Pem.pemParseBS bs
  pem <-
    note (LndEnvError $ pack "No pem found") $ safeHead pemsM
  bimap
    (LndEnvError . pack . ("Certificate is not valid: " <>))
    (LndTlsCert bs)
    (decodeSignedCertificate $ Pem.pemContent pem)

unLndTlsCert :: LndTlsCert -> ByteString
unLndTlsCert (LndTlsCert bs _) = coerce bs

createLndPort :: Word32 -> Either LndError LndPort'
createLndPort p = do
  let maybePort :: Maybe Int = U.safeFromIntegral p
  maybeToRight (LndEnvError "Wrong port") $ LndPort' <$> maybePort

readLndEnv :: IO LndEnv
readLndEnv =
  parse
    (header "LndEnv")
    $ var
      (parser <=< nonempty)
      "LND_CLIENT_ENV_DATA"
      (keep <> help "")
  where
    parser :: String -> Either Error LndEnv
    parser x =
      first UnreadError $ eitherDecodeStrict $ C8.pack x

selfSignedCertificateValidation :: [SignedCertificate] -> TLS.ClientParams -> TLS.ClientParams
selfSignedCertificateValidation extraCerts cp =
  cp
    { TLS.clientShared =
        (TLS.clientShared cp) {TLS.sharedCAStore = makeCertificateStore extraCerts},
      TLS.clientSupported =
        (TLS.clientSupported cp) {TLS.supportedCiphers = TLS.ciphersuite_default}
    }

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  LndHost' ->
  LndPort' ->
  Maybe CipherSeedMnemonic ->
  Maybe AezeedPassphrase ->
  LndEnv
newLndEnv pwd (LndTlsCert _ cert) mac (LndHost' host) (LndPort' port) seed aezeed =
  LndEnv
    { envLndWalletPassword = pwd,
      envLndHexMacaroon = mac,
      envLndLogStrategy = logDefault,
      envLndCipherSeedMnemonic = seed,
      envLndAezeedPassphrase = aezeed,
      envLndSyncGrpcTimeout = Nothing,
      envLndAsyncGrpcTimeout = Nothing,
      envLndConfig =
        (grpcClientConfigSimple host_ port_ True)
          { _grpcClientConfigCompression = uncompressed,
            _grpcClientConfigHeaders =
              [ ("macaroon", encodeUtf8 (coerce mac :: Text))
              ],
            _grpcClientConfigTLS =
              Just . selfSignedCertificateValidation [cert] $
                TLS.defaultParamsClient host_ (Universum.show port_)
          }
    }
  where
    host_ = unpack host
    port_ :: PortNumber
    port_ = fromInteger (toInteger port)

enforceDebugSev :: LndEnv -> LndEnv
enforceDebugSev env =
  env
    { envLndLogStrategy =
        (envLndLogStrategy env)
          { loggingStrategySeverity =
              loggingStrategySeverity logDebug
          }
    }
