{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}

module LndGrpc.Client
  ( runUnary,
    runStreamServer,
    runBiDiStreamServer,
  )
where

import Control.Exception (BlockedIndefinitelyOnMVar (..))
import Data.ProtoLens.Message
import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import GHC.TypeLits (Symbol)
import LndClient.Data.LndEnv
import LndClient.Import
import Network.GRPC.Client (IncomingEvent, OutgoingEvent)
import Network.GRPC.Client.Helpers
import qualified Network.GRPC.HTTP2.ProtoLens as ProtoLens
import Network.HPACK (HeaderList)
import Network.HTTP2.Client
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
    liftIO (Right <$> this)
      `catch` (\(e :: BlockedIndefinitelyOnMVar) -> pure $ Left e)
  pure $ case res of
    Right (Right (Right (Right (_, _, Right x)))) ->
      Right x
    Right (Right (Right (Right (_, _, Left e)))) ->
      Left $ LndError $ pack e
    Right (Right (Right (Left e))) ->
      Left $ LndError ("LndGrpc response error, code: " <> inspect e)
    Right (Right (Left e)) ->
      Left . LndError $
        "LndGrpc TooMuchConcurrency error" <> fromString (Prelude.show e)
    Right (Left e) ->
      Left $ LndGrpcError e
    Left e ->
      Left . LndGrpcException $ inspect e
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
    liftIO (Right <$> this)
      `catch` (\(e :: BlockedIndefinitelyOnMVar) -> pure $ Left e)
  pure $ case res of
    Right (Right (Right ((), _, _))) ->
      Right defMessage
    Right (Right (Left e)) ->
      Left . LndError $
        "LndGrpc response error: " <> fromString (Prelude.show e)
    Right (Left e) ->
      Left $ LndGrpcError e
    Left e ->
      Left . LndGrpcException $ inspect e
  where
    this =
      runClientIO $
        bracket
          (setupGrpcClient $ envLndConfig env)
          close
          (\grpc -> rawStreamServer rpc grpc () req $ const handler)

--runBiDiStreamServer ::
--  ( MonadUnliftIO p,
--    HasMethod s m,
--    req ~ MethodInput s m,
--    res ~ MethodOutput s m
--  ) =>
--  ProtoLens.RPC s (m :: Symbol) ->
--  LndEnv ->
--  RunBiDiStep req res () ->
--  p (Either LndError ())
--runBiDiStreamServer rpc env handler = do
--  res <-
--    liftIO (Right <$> this)
--      `catch` (\(e :: BlockedIndefinitelyOnMVar) -> pure $ Left e)
--  pure $ case res of
--    Right (Right (Right ())) ->
--      Right ()
--    Right (Right (Left e)) ->
--      Left . LndError $
--        "LndGrpc response error: " <> fromString (Prelude.show e)
--    Right (Left e) ->
--      Left $ LndGrpcError e
--    Left e ->
--      Left . LndGrpcException $ inspect e
--  where
--    this =
--      runClientIO $
--        bracket
--          (setupGrpcClient $ envLndConfig env)
--          close
--          (\grpc -> rawSteppedBidirectional rpc grpc () handler)

runBiDiStreamServer ::
  ( MonadUnliftIO p,
    HasMethod s m,
    req ~ MethodInput s m,
    res ~ MethodOutput s m
  ) =>
  ProtoLens.RPC s (m :: Symbol) ->
  LndEnv ->
  (IncomingEvent res () -> ClientIO ()) ->
  ClientIO ((), OutgoingEvent req ()) ->
  p (Either LndError ())
runBiDiStreamServer rpc env handlerIn handlerOut = do
  res <-
    liftIO (Right <$> this)
      `catch` (\(e :: BlockedIndefinitelyOnMVar) -> pure $ Left e)
  pure $ case res of
    Right (Right (Right ((), ()))) ->
      Right ()
    Right (Right (Left e)) ->
      Left . LndError $
        "LndGrpc response error: " <> fromString (Prelude.show e)
    Right (Left e) ->
      Left $ LndGrpcError e
    Left e ->
      Left . LndGrpcException $ inspect e
  where
    this =
      runClientIO $
        bracket
          (setupGrpcClient $ envLndConfig env)
          close
          (\grpc -> rawGeneralStream rpc grpc () (const handlerIn) () (const handlerOut))
