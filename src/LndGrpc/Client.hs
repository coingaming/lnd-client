{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module LndGrpc.Client
  ( runUnary,
    runStreamServer,
  )
where

import Data.ProtoLens.Message
import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import Data.Text.Lazy (pack)
import GHC.TypeLits (Symbol)
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client.Helpers
import Network.GRPC.HTTP2.Encoding (gzip, uncompressed)
import qualified Network.GRPC.HTTP2.ProtoLens as ProtoLens
import Network.HPACK (HeaderList)
import Network.HTTP2.Client

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
    grpc <- makeClient env True False
    rawUnary rpc grpc req
  return $ case res of
    Right (Right (Right (_, _, (Right x)))) -> Right x
    Left e -> Left $ LndGrpcError e
    Right (Right (Right (_, _, (Left e)))) -> Left $ LndError $ pack e
    _ -> Left $ LndError "LndGrpc request error"

runStreamServer ::
  ( MonadIO p,
    HasMethod s m,
    req ~ MethodInput s m,
    res ~ MethodOutput s m
  ) =>
  ProtoLens.RPC s (m :: Symbol) ->
  LndEnv ->
  req ->
  (HeaderList -> res -> ClientIO ()) ->
  p (Either LndError res)
runStreamServer rpc env req handler = do
  r <- liftIO $ runClientIO $ do
    grpc <- makeClient env True False
    rawStreamServer rpc grpc () req $ const handler
  return $ case r of
    Right (Right ((), _, _)) -> Right defMessage
    Left e -> Left $ LndGrpcError e
    _ -> Left $ LndError "LndGrpc request error"

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
