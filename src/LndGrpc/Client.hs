{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module LndGrpc.Client
  ( runUnary,
  )
where

import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import Data.Text.Lazy (pack)
import GHC.TypeLits (Symbol)
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client
import Network.GRPC.Client.Helpers
import Network.GRPC.HTTP2.Encoding (gzip)
import qualified Network.GRPC.HTTP2.ProtoLens as ProtoLens
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
  case res of
    Right (Right (Right (_, _, (Right x)))) -> return $ Right x
    Left e -> return $ Left $ LndGrpcError e
    Right (Right (Right (_, _, (Left e)))) -> return $ Left $ LndError $ pack e
    _ -> return $ Left $ LndError "LndGrpc request error"

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
