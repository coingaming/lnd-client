{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module LndGrpc.Client
  ( runUnary,
    runStreamServer,
  )
where

import Control.Exception (BlockedIndefinitelyOnMVar (..))
import Data.ProtoLens.Message
import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import Data.Text
import GHC.IO.Exception (IOException)
import GHC.TypeLits (Symbol)
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client.Helpers
import qualified Network.GRPC.HTTP2.ProtoLens as ProtoLens
import Network.HPACK (HeaderList)
import Network.HTTP2.Client2
import qualified Prelude

runUnary ::
  ( MonadUnliftIO p,
    HasMethod s m,
    req ~ MethodInput s m,
    res ~ MethodOutput s m
  ) =>
  ProtoLens.RPC s (m :: Symbol) ->
  LndEnv ->
  req ->
  p (Either LndError res)
runUnary rpc env req = do
  res <-
    catchExceptions $ liftIO (Right <$> this)
  pure $ case res of
    Right (Right (Right (Right (_, _, Right x)))) -> Right x
    Right (Right (Right (Right (a, _, Left e)))) -> do
      case Prelude.lookup "grpc-message" a of
        Just "wallet not created, create one to enable full RPC access" -> Left LndWalletNotExists
        Just "wallet locked, unlock it to enable full RPC access" -> Left LndWalletLocked
        _ -> Left $ LndError $ pack e
    Right (Right (Right (Left e))) ->
      Left $ LndError ("LndGrpc response error, code: " <> inspectPlain e)
    Right (Right (Left e)) ->
      Left . LndError $
        "LndGrpc TooMuchConcurrency error" <> fromString (Prelude.show e)
    Right (Left e) ->
      Left $ LndGrpcError e
    Left e ->
      Left e
  where
    this =
      runClientIO $
        bracket
          (setupGrpcClient $ envLndConfig env)
          close
          (\grpc -> rawUnary rpc grpc req)

runStreamServer ::
  ( MonadUnliftIO p,
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
  res <-
    catchExceptions $ liftIO (Right <$> this)
  pure $ case res of
    Right (Right (Right ((), _, _))) ->
      Right defMessage
    Right (Right (Left e)) ->
      Left . LndError $
        "LndGrpc response error: " <> fromString (Prelude.show e)
    Right (Left e) ->
      Left $ LndGrpcError e
    Left e ->
      Left e
  where
    this =
      runClientIO $
        bracket
          (setupGrpcClient $ envLndConfig env)
          close
          (\grpc -> rawStreamServer rpc grpc () req $ const handler)

catchExceptions :: MonadUnliftIO m => m (Either LndError a) -> m (Either LndError a)
catchExceptions x =
  x
    `catches` [ Handler (\(e :: BlockedIndefinitelyOnMVar) -> pure (Left $ LndGrpcException $ inspectPlain e)),
                Handler
                  ( \(ex :: IOException) -> case stripPrefix ("Network.Socket.connect" :: Text) (pack $ Prelude.show ex) of
                      Just mes -> pure $ Left $ NetworkException mes
                      Nothing -> pure $ Left $ LndIOException ex
                  )
              ]
