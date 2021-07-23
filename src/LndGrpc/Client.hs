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
import GHC.TypeLits (Symbol)
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client.Helpers
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
    grpc <- setupGrpcClient $ envLndConfig env
    rawUnary rpc grpc req
  return $ case res of
    Right (Right (Right (_, _, (Right x)))) -> Right x
    Right (Right (Right (_, _, (Left e)))) -> Left $ LndError $ pack e
    Right (Right (Left e)) -> Left $ LndError ("LndGrpc response error, code: " <> show e)
    Right (Left e) -> Left $ LndError ("LndGrpc, TooMuchConcurrency error: " <> show e)
    Left e -> Left $ LndGrpcError e

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
    grpc <- setupGrpcClient $ envLndConfig env
    rawStreamServer rpc grpc () req $ const handler
  return $ case r of
    Right (Right ((), _, _)) -> Right defMessage
    Right (Left e) -> Left $ LndError ("LndGrpc response error: " <> show e)
    Left e -> Left $ LndGrpcError e
