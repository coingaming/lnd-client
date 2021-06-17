{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module LndGrpc.Client
  ( runUnary,
    getInfo,
  )
where

import Data.ByteString.Base16 as B16 (decode)
import Data.ProtoLens.Message
import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import GHC.TypeLits (Symbol)
import Lens.Micro
import LndClient.Data.GetInfo as Lnd
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client
import Network.GRPC.Client.Helpers
import Network.GRPC.HTTP2.Encoding (gzip)
import qualified Network.GRPC.HTTP2.ProtoLens as ProtoLens
import Network.GRPC.HTTP2.ProtoLens (RPC (..))
import Network.HTTP2.Client
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.LndGrpc_Fields as LnGRPC

runUnary ::
  ( MonadIO p,
    HasMethod s m,
    req ~ MethodInput s m,
    res ~ MethodOutput s m
  ) =>
  ProtoLens.RPC s (m :: Symbol) ->
  LndEnv ->
  req ->
  p (Either LndError res)
runUnary rpc env req = do
  res <- liftIO $ runClientIO $ do
    grpc <- makeClient env True True
    rawUnary rpc grpc req
  case res of
    Right (Right (Right (_, _, (Right x)))) -> return $ Right x
    Left e -> return $ Left $ LndGrpcError e
    Right (Right (Right (_, _, (Left x)))) -> return $ Left $ LndError ("error" <> show x)
    _ -> return $ Left $ LndError "error"

getInfo :: (MonadIO m) => LndEnv -> m (Either LndError Lnd.GetInfoResponse)
getInfo env =
  join . second fromLnGrpc <$> runUnary (RPC :: RPC LnGRPC.Lightning "getInfo") env defMessage

makeClient ::
  LndEnv ->
  UseTlsOrNot ->
  Bool ->
  ClientIO GrpcClient
makeClient env tlsEnabled doCompress =
  setupGrpcClient $
    (grpcClientConfigSimple (lndConfigHost $ envLndConfig env) (lndConfigPort $ envLndConfig env) tlsEnabled)
      { _grpcClientConfigCompression = compression,
        _grpcClientConfigHeaders = [("macaroon", encodeUtf8 (coerce (envLndHexMacaroon env) :: Text))]
      }
  where
    compression = if doCompress then gzip else uncompressed

fromLnGrpc :: LnGRPC.GetInfoResponse -> Either LndError Lnd.GetInfoResponse
fromLnGrpc x = do
  pubKey <- decodeNodePubKey $ x ^. LnGRPC.identityPubkey
  return $
    GetInfoResponse
      pubKey
      (x ^. LnGRPC.syncedToChain)
      (x ^. LnGRPC.syncedToGraph)
  where
    decodeNodePubKey key =
      case B16.decode $ encodeUtf8 key of
        Right y -> Right $ NodePubKey y
        Left {} -> Left $ FromGrpcError "NodePubKey hex decoding error"
