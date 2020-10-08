{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC.Generic
  ( grpcSyncSilent,
    grpcSyncKatip,
    grpcSubscribeSilent,
    grpcSubscribeKatip,
    RpcName (..),
  )
where

import qualified Control.Exception as CE (catch, throw)
import LndClient.Import
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
grpcSyncKatip rpcName service method env req =
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    (ts, res) <-
      liftIO $ stopwatch $
        grpcSyncSilent rpcName service method env req
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $ do
      case res of
        Left e -> do
          let logMsg = logStr ("RPC exited with message " <> show e :: Text)
          $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) logMsg
        Right _ ->
          $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      return res

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
        rawGrpc <- CE.catch (Right <$> method' greq) $ return . Left
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
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    (ts, res) <-
      liftIO $ stopwatch $
        grpcSubscribeSilent rpcName service method handler env req
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $ do
      case res of
        Left e -> do
          let logMsg = logStr ("RPC exited with message " <> show e :: Text)
          $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) logMsg
        Right _ ->
          $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      return res

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
