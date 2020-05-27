{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}

module LndClient.Data.LndEnv
  ( LndEnv (..),
    RawConfig (..),
    LndWalletPassword (..),
    LndTlsCert,
    LndHexMacaroon (..),
    LndHost (..),
    LndPort (..),
    newLndEnv,
    readLndEnv,
    createLndTlsCert,
  )
where

import Data.Aeson as A ((.:), FromJSON (..), Value (..))
import Data.ByteString.Char8 as C8
import qualified Data.PEM as Pem
import Data.Text.Lazy as LT
import Data.X509
import Env
import LndClient.Class
import LndClient.Data.Type
import LndClient.Import.External as Ex
import LndClient.Util as U
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel.Client
import Text.Read

newtype LndWalletPassword = LndWalletPassword Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndTlsCert = LndTlsCert ByteString
  deriving (PersistField, PersistFieldSql, Eq)

createLndTlsCert :: ByteString -> Either LndError LndTlsCert
createLndTlsCert bs = do
  pemsM <- first (LndEnvError . LT.pack) $ Pem.pemParseBS bs
  pem <-
    note (LndEnvError $ LT.pack "No pem found") $ safeHead pemsM
  bimap
    (LndEnvError . LT.pack . ("Certificate is not valid: " <>))
    (const $ LndTlsCert bs)
    (decodeSignedCertificate $ Pem.pemContent pem)

instance Read LndTlsCert where
  readsPrec _ x =
    case createLndTlsCert $ C8.pack x of
      Right r -> [(r, "")]
      Left _ -> case reads x of
        [(r, "")] -> [(r, "")]
        _ -> []

instance FromJSON LndTlsCert where
  parseJSON x =
    case x of
      A.String s ->
        case createLndTlsCert $ encodeUtf8 s of
          Right cert -> return cert
          Left _ -> failure
      _ -> failure
    where
      failure = fail $ "Json certificate parsing error: " <> " " <> show x

instance ToGrpc LndTlsCert ByteString where
  toGrpc = Right . coerce

newtype LndHexMacaroon = LndHexMacaroon Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndHost = LndHost Text
  deriving (PersistField, PersistFieldSql, Eq, FromJSON, IsString)

newtype LndPort = LndPort Int
  deriving (PersistField, PersistFieldSql, Eq)

createLndPort :: Word32 -> Either LndError LndPort
createLndPort p = do
  let maybePort :: Maybe Int = U.safeFromIntegral p
  maybeToRight (LndEnvError "Wrong port") $ LndPort <$> maybePort

instance Read LndPort where
  readsPrec _ x = do
    let mX :: Maybe Word32 = readMaybe x
    let eX :: Either LndError Word32 = maybeToRight (LndEnvError "Port parsing error") mX
    case createLndPort =<< eX of
      Right r -> [(r, "")]
      Left _ -> case reads x of
        [(r, "")] -> [(r, "")]
        _ -> []

instance FromJSON LndPort where
  parseJSON x =
    case x of
      A.String s ->
        case createLndPort ((read $ toString s) :: Word32) of
          Right cert -> return cert
          Left _ -> failure
      _ -> failure
    where
      failure = fail $ "Json certificate parsing error: " <> " " <> show x

instance ToGrpc LndWalletPassword Text where
  toGrpc = Right . coerce

instance ToGrpc LndHexMacaroon ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

instance ToGrpc LndHost ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

instance ToGrpc LndWalletPassword ByteString where
  toGrpc x = Right $ encodeUtf8 (coerce x :: Text)

data RawConfig
  = RawConfig
      { rawConfigLndWalletPassword :: LndWalletPassword,
        rawConfigLndTlsCert :: LndTlsCert,
        rawConfigLndHexMacaroon :: LndHexMacaroon,
        rawConfigLndHost :: LndHost,
        rawConfigLndPort :: LndPort
      }

data LndEnv
  = LndEnv
      { envLndWalletPassword :: LndWalletPassword,
        envLndHexMacaroon :: LndHexMacaroon,
        envLndGrpcConfig :: ClientConfig,
        envLndLogErrors :: Bool
      }

instance FromJSON RawConfig where
  parseJSON (Object v) =
    RawConfig <$> v .: "lnd_wallet_password"
      <*> v .: "lnd_tls_cert"
      <*> v .: "lnd_hex_macaroon"
      <*> v .: "lnd_host"
      <*> v .: "lnd_port"
  parseJSON _ = mzero

rawConfig :: IO RawConfig
rawConfig =
  parse (header "LndClient config") $
    RawConfig
      <$> var (str <=< nonempty) "LND_CLIENT_LND_WALLET_PASSWORD" (keep <> help "")
      <*> var (auto <=< nonempty) "LND_CLIENT_LND_TLS_CERT" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HEX_MACAROON" (keep <> help "")
      <*> var (str <=< nonempty) "LND_CLIENT_LND_HOST" (keep <> help "")
      <*> var (auto <=< nonempty) "LND_CLIENT_LND_PORT" (keep <> help "")

readLndEnv :: IO LndEnv
readLndEnv = do
  rc <- rawConfig
  return $
    newLndEnv
      (rawConfigLndWalletPassword rc)
      (rawConfigLndTlsCert rc)
      (rawConfigLndHexMacaroon rc)
      (rawConfigLndHost rc)
      (rawConfigLndPort rc)

newLndEnv ::
  LndWalletPassword ->
  LndTlsCert ->
  LndHexMacaroon ->
  LndHost ->
  LndPort ->
  LndEnv
newLndEnv pwd cert mac host port =
  LndEnv
    { envLndWalletPassword = pwd,
      envLndHexMacaroon = mac,
      envLndLogErrors = True,
      envLndGrpcConfig =
        ClientConfig
          { clientServerHost = Host $ encodeUtf8 $ (coerce host :: Text),
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
