{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.RPC
  ( unlockWallet,
    newAddress,
    addInvoice,
    initWallet,
    openChannel,
    listPeers,
    connectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    RPCResponse (..),
  )
where

import qualified Data.Conduit.List as CL
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.GetInfo
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (ChannelPoint (..), OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), Peer (..))
import LndClient.Data.SendPayment as SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SubscribeInvoices as SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Data.Void (VoidRequest (..), VoidResponse (..))
import LndClient.Import
import qualified LndGrpc as GRPC
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel
import Network.HTTP.Client
  ( RequestBody (RequestBodyLBS),
    Response (..),
    httpLbs,
    method,
    parseRequest,
    queryString,
    requestBody,
    requestHeaders,
    responseStatus,
    responseTimeout,
    responseTimeoutNone,
  )
import Network.HTTP.Simple (httpSink, setRequestManager)
import Network.HTTP.Types.Method (StdMethod (..), renderStdMethod)
import Network.HTTP.Types.Status (ok200, status404)
import Network.HTTP.Types.URI (Query, renderQuery)

newtype RPCResponse a
  = RPCResponse (Response (Either String a))
  deriving (Show)

data RpcName
  = UnlockWallet
  | NewAddress
  | AddInvoice
  | InitWallet
  | SubscribeInvoices
  | OpenChannel
  | ListPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  deriving (Generic)

instance ToJSON RpcName

data RpcArgs a b m
  = RpcArgs
      { rpcEnv :: LndEnv,
        rpcMethod :: StdMethod,
        rpcUrlPath :: String,
        rpcUrlQuery :: Query,
        rpcReqBody :: Maybe a,
        rpcRetryAttempt :: Int,
        rpcSuccessCond :: RPCResponse b -> Bool,
        rpcName :: RpcName,
        rpcSubHandler :: Maybe (ByteString -> m ())
      }

rpc ::
  (ToJSON a, FromJSON b, Show b, KatipContext m, MonadUnliftIO m) =>
  RpcArgs a b m ->
  m (Either LndError (RPCResponse b))
rpc
  RpcArgs
    { rpcEnv,
      rpcMethod,
      rpcUrlPath,
      rpcUrlQuery,
      rpcReqBody,
      rpcRetryAttempt,
      rpcSuccessCond,
      rpcName,
      rpcSubHandler
    } =
    katipAddContext (sl "rpcName" rpcName) $ do
      $(logTM) InfoS "is running..."
      doExpBackOff rpcRetryAttempt rpcSuccessCond expr
    where
      expr = do
        req0 <- liftIO $ parseRequest $ coerce (envLndUrl rpcEnv) <> rpcUrlPath
        let req1 =
              req0
                { method = renderStdMethod rpcMethod,
                  queryString = renderQuery False rpcUrlQuery,
                  requestHeaders =
                    [ ("Content-Type", "application/json"),
                      ( "Grpc-Metadata-macaroon",
                        coerce $ envLndHexMacaroon rpcEnv
                      )
                    ]
                }
        let req2 =
              maybe
                req1
                (\b -> req1 {requestBody = RequestBodyLBS $ encode b})
                rpcReqBody
        --liftIO $ print $ encode rpcReqBody
        manager <- liftIO $ coerce $ envLndTlsManagerBuilder rpcEnv
        case rpcSubHandler of
          Nothing -> do
            res <- liftIO $ httpLbs req2 manager
            --liftIO $ print res
            return $ RPCResponse $ eitherDecode <$> res
          Just subHandler -> do
            let req3 = setRequestManager manager req2
            let req4 = req3 {responseTimeout = responseTimeoutNone}
            httpSink req4 $ \res -> do
              CL.mapM_ subHandler
              return
                $ RPCResponse
                $ Left "subscription don't have response body"
                  <$ res

grpcMeta :: LndEnv -> MetadataMap
grpcMeta env =
  [("macaroon", coerce $ envLndHexMacaroon env)]

initWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  InitWalletRequest ->
  m (Either LndError (RPCResponse VoidResponse))
initWallet env req = do
  res <- rpc $ rpcArgs env
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  _ <- liftIO $ delay 5000000
  return res
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/initwallet",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = InitWallet,
          rpcSubHandler = Nothing
        }

--
--  TODO : implement recovery_window and channel_backups
--
unlockWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError (RPCResponse VoidResponse))
unlockWallet env =
  rpc $ rpcArgs env
  where
    rpcReqBody rpcEnv =
      Just
        UnlockWalletRequest
          { walletPassword = coerce $ envLndB64WalletPassword rpcEnv,
            recoveryWindow = 0
          }
    rpcSuccessCond (RPCResponse res) =
      let ss = responseStatus res in ss == ok200 || ss == status404
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/unlockwallet",
          rpcUrlQuery = [],
          rpcReqBody = rpcReqBody rpcEnv,
          rpcRetryAttempt = 5,
          rpcSuccessCond,
          rpcName = UnlockWallet,
          rpcSubHandler = Nothing
        }

stdRpcCond :: RPCResponse a -> Bool
stdRpcCond (RPCResponse res) =
  (responseStatus res == ok200) && isRight (responseBody res)

newAddress ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (Either LndError (RPCResponse NewAddressResponse))
newAddress env = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/newaddress",
          rpcUrlQuery = [("type", Just "1")],
          rpcReqBody = Nothing :: Maybe VoidRequest,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = NewAddress,
          rpcSubHandler = Nothing
        }

--
-- TODO
-- better generic utils for request/parsing
-- handle exceptions
-- fix RHash type
-- fix PaymentRequest type
-- rm RPCResponse (we don't have HTTP-related low level details anymore)
--
addInvoice ::
  (KatipContext m) =>
  LndEnv ->
  AddInvoiceRequest ->
  m (Either LndError AddInvoiceResponse)
addInvoice =
  grpcSync AddInvoice GRPC.lightningAddInvoice 1

subscribeInvoices ::
  (KatipContext m) =>
  --
  -- TODO : replace IO with m if possible
  --
  (Invoice -> IO ()) ->
  LndEnv ->
  SubscribeInvoicesRequest ->
  m (Either LndError Invoice)
subscribeInvoices invoiceHandler =
  grpcSubscribe
    SubscribeInvoices
    GRPC.lightningSubscribeInvoices
    3600
    (\_ _ s -> streamHandler s)
  where
    streamHandler :: IO (Either GRPCIOError (Maybe GRPC.Invoice)) -> IO ()
    streamHandler stream = do
      msg <- stream
      case msg of
        Left e -> fail $ "SubscribeInvoices error " <> show e
        Right Nothing -> fail "SubscribeInvoices got Nothing"
        Right (Just gi) -> do
          --
          -- TODO : handle all fields and types overflow
          --
          case fromGrpc gi of
            Right i -> invoiceHandler i
            Left e -> fail $ show e
          streamHandler stream

openChannel ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  OpenChannelRequest ->
  m (Either LndError (RPCResponse ChannelPoint))
openChannel env req = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/channels",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = OpenChannel,
          rpcSubHandler = Nothing
        }

listPeers ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError [Peer])
listPeers env =
  grpcSync ListPeers GRPC.lightningListPeers 1 env (def :: GRPC.ListPeersRequest)

connectPeer ::
  (KatipContext m) =>
  LndEnv ->
  ConnectPeerRequest ->
  m (Either LndError ())
connectPeer =
  grpcSync ConnectPeer GRPC.lightningConnectPeer 1

getInfo ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError GetInfoResponse)
getInfo env =
  grpcSync GetInfo GRPC.lightningGetInfo 1 env GRPC.GetInfoRequest

sendPayment ::
  (KatipContext m) =>
  LndEnv ->
  SendPaymentRequest ->
  m (Either LndError SendPaymentResponse)
sendPayment =
  grpcSync SendPayment GRPC.lightningSendPaymentSync 1

--
-- TODO : add logging and elapsed time logs
--
grpcSubscribe ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  ( GRPC.Lightning ClientRequest ClientResult ->
    ClientRequest 'ServerStreaming gA response1 ->
    IO (ClientResult streamType gB)
  ) ->
  --
  -- TODO : newtype for timeout
  --
  Int ->
  ( ClientCall ->
    MetadataMap ->
    StreamRecv response1 ->
    IO ()
  ) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSubscribe rpcName method timeout handler env req =
  katipAddContext (sl "rpcName" rpcName) $ do
    $(logTM) InfoS "rpc is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> GRPC.lightningClient client
          rawGrpc <-
            method' $
              ClientReaderRequest grpcReq timeout (grpcMeta env) handler
          return $ case rawGrpc of
            ClientNormalResponse grpcRes _ _ _ _ -> fromGrpc grpcRes
            _ -> Left $ GrpcError "TODO IMPLEMENT ERROR DATA CONSTRUCTOR"
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "elapsedSeconds" (showElapsedSeconds ts)) $ do
      if isRight res
        then $(logTM) ErrorS $ "rpc failed"
        else $(logTM) InfoS $ "rpc succeeded"
      return res

grpcSync ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  ( GRPC.Lightning ClientRequest ClientResult ->
    ClientRequest 'Normal gA response2 ->
    IO (ClientResult streamType gB)
  ) ->
  --
  -- TODO : newtype for timeout
  --
  Int ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSync rpcName method timeout env req = do
  katipAddContext (sl "rpcName" rpcName) $ do
    $(logTM) InfoS "rpc is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> GRPC.lightningClient client
          rawGrpc <- method' $ ClientNormalRequest grpcReq timeout $ grpcMeta env
          return $ case rawGrpc of
            ClientNormalResponse grpcRes _ _ _ _ -> fromGrpc grpcRes
            _ -> Left $ GrpcError "TODO IMPLEMENT ERROR DATA CONSTRUCTOR"
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "elapsedSeconds" (showElapsedSeconds ts)) $ do
      if isRight res
        then $(logTM) ErrorS $ "rpc failed"
        else $(logTM) InfoS $ "rpc succeeded"
      return res

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = encodeTimespan SubsecondPrecisionAuto
