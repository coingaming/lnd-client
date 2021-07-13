{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPC.Generic
  ( grpcSyncSilent,
    grpcSyncKatip,
    grpcSync2Silent,
    grpcSync2Katip,
    grpcSubscribeSilent,
    grpcSubscribeKatip,
    grpcSubscribe2Silent,
    grpcSubscribe2Katip,
    RpcName (..),
  )
where

import qualified Control.Exception as CE
  ( Handler (..),
    catches,
    throw,
  )
import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import qualified Data.Text.Lazy as T
import GHC.TypeLits
import qualified LndClient.Class2 as C2
import LndClient.Import
import LndGrpc.Client
import qualified Network.GRPC.HTTP2.ProtoLens as PL
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel

data RpcName
  = UnlockWallet
  | InitWallet
  | LazyUnlockWallet
  | LazyInitWallet
  | NewAddress
  | AddInvoice
  | AddHodlInvoice
  | CancelInvoice
  | SettleInvoice
  | SubscribeInvoices
  | SubscribeChannelEvents
  | SubscribeHtlcEvents
  | OpenChannelSync
  | OpenChannel
  | ListChannels
  | CloseChannel
  | ListPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  | WaitForGrpc
  | DecodePayReq
  | LookupInvoice
  | EnsureHodlInvoice
  | TrackPaymentV2
  | PendingChannels
  | ClosedChannels
  | ListInvoices
  | SubscribeSingleInvoice
  deriving (Generic)

instance ToJSON RpcName

grpcMeta :: LndEnv -> MetadataMap
grpcMeta env =
  [("macaroon", encodeUtf8 (coerce (envLndHexMacaroon env) :: Text))]

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = fromStrict . encodeTimespan SubsecondPrecisionAuto

grpcSyncSilent ::
  ( MonadIO m,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  (Client -> IO client) ->
  ( client ->
    ClientRequest 'Normal gA response2 ->
    IO (ClientResult streamType gB)
  ) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncSilent _ service method env req =
  liftIO $ case toGrpc req of
    Left e -> return $ Left e
    Right grpcReq ->
      withGRPCClient (envLndGrpcConfig env) $ \client -> do
        method' <- method <$> service client
        rawGrpc <-
          method' $
            ClientNormalRequest
              grpcReq
              ( unGrpcTimeout
                  . fromMaybe defaultSyncGrpcTimeout
                  $ envLndSyncGrpcTimeout env
              )
              (grpcMeta env)
        return $ case rawGrpc of
          ClientNormalResponse grpcRes _ _ _ _ ->
            fromGrpc grpcRes
          ClientErrorResponse err ->
            Left $ GrpcError err
          ClientWriterResponse {} ->
            Left $ GrpcUnexpectedResult "ClientWriterResponse"
          ClientReaderResponse {} ->
            Left $ GrpcUnexpectedResult "ClientReaderResponse"
          ClientBiDiResponse {} ->
            Left $ GrpcUnexpectedResult "ClientBiDiResponse"

grpcSyncKatip ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB,
    Show a,
    Show b
  ) =>
  RpcName ->
  (Client -> IO client) ->
  ( client ->
    ClientRequest 'Normal gA response2 ->
    IO (ClientResult streamType gB)
  ) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncKatip rpcName service method env req =
  katipAddContext (sl "RpcName" rpcName)
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $
          grpcSyncSilent rpcName service method env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res

grpcSync2Silent ::
  ( MonadIO m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSync2Silent rpc env req =
  case C2.toGrpc req of
    Right gReq -> join . second C2.fromGrpc <$> runUnary rpc env gReq
    Left err -> return $ Left err

grpcSync2Katip ::
  ( MonadIO m,
    KatipContext m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm,
    Show a,
    Show b
  ) =>
  PL.RPC s (rm :: Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSync2Katip rpc env req =
  katipAddContext (sl "RpcName" (T.pack $ symbolVal rpc))
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $
          grpcSync2Silent rpc env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res

grpcSubscribe2Silent ::
  ( MonadIO m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribe2Silent rpc handler env req =
  case C2.toGrpc req of
    Right grpcReq -> do
      res <- runStreamServer rpc env grpcReq gHandler
      case res of
        Left err -> return $ Left err
        Right _ -> return $ Right ()
    Left err -> return $ Left err
  where
    gHandler _ x =
      case C2.fromGrpc x of
        Right b -> liftIO $ handler b
        Left _ -> return ()

grpcSubscribe2Katip ::
  ( MonadIO m,
    KatipContext m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    Show a,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribe2Katip rpc handler env req =
  katipAddContext (sl "RpcName" (T.pack $ symbolVal rpc))
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $ grpcSubscribe2Silent rpc handler env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res

grpcSubscribeSilent ::
  ( MonadIO m,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  (Client -> IO client) ->
  ( client ->
    ClientRequest 'ServerStreaming gA gB ->
    IO (ClientResult streamType streamResult)
  ) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeSilent _ service method handler env req =
  liftIO $ case toGrpc req of
    Left e -> return $ Left e
    Right grpcReq ->
      withGRPCClient (envLndGrpcConfig env) $ \client -> do
        method' <- method <$> service client
        let greq =
              ClientReaderRequest
                grpcReq
                ( unGrpcTimeout
                    . fromMaybe defaultAsyncGrpcTimeout
                    $ envLndAsyncGrpcTimeout env
                )
                (grpcMeta env)
                (\_ _ s -> genStreamHandler s handler)
        rawGrpc <-
          CE.catches
            (Right <$> method' greq)
            [ CE.Handler $
                \(x :: LndError) -> pure $ Left x
            ]
        return $ case rawGrpc of
          Right ClientNormalResponse {} ->
            Left $ GrpcUnexpectedResult "ClientNormalResponse"
          Right (ClientErrorResponse err) ->
            Left $ GrpcError err
          Right ClientWriterResponse {} ->
            Left $ GrpcUnexpectedResult "ClientWriterResponse"
          Right ClientReaderResponse {} ->
            Right ()
          Right ClientBiDiResponse {} ->
            Left $ GrpcUnexpectedResult "ClientBiDiResponse"
          Left e ->
            Left e

grpcSubscribeKatip ::
  ( MonadIO m,
    KatipContext m,
    Show a,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  (Client -> IO client) ->
  ( client ->
    ClientRequest 'ServerStreaming gA gB ->
    IO (ClientResult streamType streamResult)
  ) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeKatip rpcName service method handler env req =
  katipAddContext (sl "RpcName" rpcName)
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $
          grpcSubscribeSilent rpcName service method handler env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res

genStreamHandler ::
  (FromGrpc a b) =>
  IO (Either GRPCIOError (Maybe b)) ->
  (a -> IO ()) ->
  IO ()
genStreamHandler stream handler = do
  msg <- stream
  case msg of
    Left e -> CE.throw $ GrpcError $ ClientIOError e
    Right Nothing -> CE.throw GrpcEmptyResult
    Right (Just gi) -> do
      case fromGrpc gi of
        Right i -> handler i
        Left e -> CE.throw e
      genStreamHandler stream handler
