{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    RawConfig,
    LndWalletPassword (..),
    LndTlsCert,
    LndHexMacaroon (..),
    LndHost (..),
    LndPort,
    newLndEnv,
    readLndEnv,
    createLndTlsCert,
    unLndTlsCert,
    createLndPort,
    katipAddLndContext,
    newSeverity,
  )
where

import Data.Aeson as A
  ( (.:?),
    Result (..),
    Value (..),
    camelTo2,
    defaultOptions,
    eitherDecodeStrict,
    fieldLabelModifier,
    genericParseJSON,
    withObject,
  )
import Data.ByteString.Char8 as C8
import qualified Data.PEM as Pem
import Data.Scientific
import Data.Text.Lazy as LT
import Data.X509
import Env
import LndClient.Class
import LndClient.Data.Newtype
import LndClient.Data.Type
import LndClient.Import.External as Ex
import LndClient.Util as U
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client

newtype LndWalletPassword = LndWalletPassword Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndTlsCert = LndTlsCert ByteString
  deriving (PersistField, PersistFieldSql, Eq)

newtype LndHexMacaroon = LndHexMacaroon Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndHost = LndHost Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndPort = LndPort Int
  deriving (PersistField, PersistFieldSql, Eq)

data RawConfig
  = RawConfig
      { rawConfigLndWalletPassword :: LndWalletPassword,
        rawConfigLndTlsCert :: LndTlsCert,
        rawConfigLndHexMacaroon :: LndHexMacaroon,
        rawConfigLndHost :: LndHost,
        rawConfigLndPort :: LndPort,
        rawConfigLndCipherSeedMnemonic :: CipherSeedMnemonic,
        rawConfigLndAezeedPassphrase :: Maybe AezeedPassphrase
      }
  deriving (Eq, Generic)

data LndEnv
  = LndEnv
      { envLndWalletPassword :: LndWalletPassword,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndGrpcConfig :: ClientConfig,
        envLndLogStrategy :: LoggingStrategy,
        envLndCipherSeedMnemonic :: CipherSeedMnemonic,
        envLndAezeedPassphrase :: Maybe AezeedPassphrase,
        envLndSyncGrpcTimeout :: Maybe GrpcTimeoutSeconds,
        envLndAsyncGrpcTimeout :: Maybe GrpcTimeoutSeconds
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
      failure err = fail $ "Json certificate parsing error: " <> " " <> show err

instance FromJSON LndPort where
  parseJSON x =
    case x of
      A.Number s -> do
        let ePort =
              maybeToRight
                (LndEnvError "Port should be Int")
                $ toBoundedInteger s
        case ePort >>= createLndPort of
          Right lndPort -> return lndPort
          Left err -> failure err
      err -> failure err
    where
      failure err = fail $ "Json port loading error: " <> " " <> show err

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
  pemsM <- first (LndEnvError . LT.pack) $ Pem.pemParseBS bs
  pem <-
    note (LndEnvError $ LT.pack "No pem found") $ safeHead pemsM
  bimap
    (LndEnvError . LT.pack . ("Certificate is not valid: " <>))
    (const $ LndTlsCert bs)
    (decodeSignedCertificate $ Pem.pemContent pem)

unLndTlsCert :: LndTlsCert -> ByteString
unLndTlsCert = coerce

createLndPort :: Word32 -> Either LndError LndPort
createLndPort p = do
  let maybePort :: Maybe Int = U.safeFromIntegral p
  maybeToRight (LndEnvError "Wrong port") $ LndPort <$> maybePort

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

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  LndHost ->
  LndPort ->
  CipherSeedMnemonic ->
  Maybe AezeedPassphrase ->
  LndEnv
newLndEnv pwd cert mac host port seed aezeed =
  LndEnv
    { envLndWalletPassword = pwd,
      envLndHexMacaroon = mac,
      envLndLogStrategy = logDefault,
      envLndCipherSeedMnemonic = seed,
      envLndAezeedPassphrase = aezeed,
      envLndSyncGrpcTimeout = Nothing,
      envLndAsyncGrpcTimeout = Nothing,
      envLndGrpcConfig =
        ClientConfig
          { clientServerHost =
              Host $
                encodeUtf8 (coerce host :: Text),
            clientServerPort = Port $ coerce port,
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

katipAddLndContext :: (KatipContext m) => LndEnv -> m a -> m a
katipAddLndContext env =
  katipAddContext (sl "LndHost" h)
    . katipAddContext (sl "LndPort" p)
  where
    c = envLndGrpcConfig env
    h = case decodeUtf8' $ coerce $ clientServerHost c of
      Left _ -> "NOT_UTF8"
      Right x -> x
    p = coerce $ clientServerPort c :: Int

newSeverity :: LndEnv -> Severity -> Maybe Timespan -> Maybe LndError -> Severity
newSeverity = coerce . envLndLogStrategy
