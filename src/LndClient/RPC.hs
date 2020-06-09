{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.RPC
  ( unlockWallet,
    lazyUnlockWallet,
    lazyInitWallet,
    newAddress,
    addInvoice,
    initWallet,
    openChannelSync,
    listChannels,
    closeChannel,
    listPeers,
    connectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    subscribeChannelEvents,
    grpcSync,
    grpcSubscribe,
  )
where

import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.GetInfo
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (ListChannelsRequest (..), ListChannelsResponse (..))
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (ChannelPoint (..), OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), Peer (..))
import LndClient.Data.SendPayment as SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices as SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Import
import qualified LndGrpc as GRPC
import Network.GRPC.HighLevel.Generated
import Network.GRPC.LowLevel
import qualified WalletUnlockerGrpc as GRPC

data RpcName
  = UnlockWallet
  | InitWallet
  | LazyUnlockWallet
  | LazyInitWallet
  | NewAddress
  | AddInvoice
  | SubscribeInvoices
  | SubscribeChannelEvents
  | OpenChannelSync
  | ListChannels
  | CloseChannel
  | ListPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  deriving (Generic)

instance ToJSON RpcName

grpcMeta :: LndEnv -> MetadataMap
grpcMeta env =
  [("macaroon", encodeUtf8 (coerce (envLndHexMacaroon env) :: Text))]

grpcDefaultTimeout :: Int
grpcDefaultTimeout = 5

initWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
initWallet env = do
  res <-
    grpcSync
      InitWallet
      GRPC.walletUnlockerClient
      GRPC.walletUnlockerInitWallet
      grpcDefaultTimeout
      env
      InitWalletRequest
        { walletPassword = coerce $ envLndWalletPassword env,
          cipherSeedMnemonic = coerce $ envLndCipherSeedMnemonic env,
          aezeedPassphrase = coerce $ envLndAezeedPassphrase env
        }
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  _ <- liftIO $ delay 10000000
  return res

--
--  TODO : implement recovery_window and channel_backups
--
unlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
unlockWallet env =
  grpcSync
    UnlockWallet
    GRPC.walletUnlockerClient
    GRPC.walletUnlockerUnlockWallet
    grpcDefaultTimeout
    env
    UnlockWalletRequest
      { walletPassword = coerce $ envLndWalletPassword env,
        recoveryWindow = 0
      }

lazyUnlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env =
  katipAddContext (sl "RpcName" LazyUnlockWallet) $ do
    $(logTM) InfoS "RPC is running..."
    unlocked <- isRight <$> getInfo (env {envLndLogErrors = False})
    if unlocked
      then do
        $(logTM) InfoS "Wallet is already unlocked, doing nothing"
        return $ Right ()
      else unlockWallet env

lazyInitWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env =
  katipAddContext (sl "RpcName" LazyInitWallet) $ do
    $(logTM) InfoS "RPC is running..."
    unlockRes <- lazyUnlockWallet $ env {envLndLogErrors = False}
    if isRight unlockRes
      then return unlockRes
      else do
        initRes <- initWallet env
        if isRight initRes
          then lazyUnlockWallet env
          else do
            $(logTM) ErrorS "Wallet initialization failed"
            return initRes

newAddress ::
  (KatipContext m) =>
  LndEnv ->
  GRPC.AddressType ->
  m (Either LndError NewAddressResponse)
newAddress env req =
  grpcSync
    NewAddress
    GRPC.lightningClient
    GRPC.lightningNewAddress
    grpcDefaultTimeout
    env
    (GRPC.NewAddressRequest $ Enumerated $ Right req)

--
-- TODO
--
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
  grpcSync
    AddInvoice
    GRPC.lightningClient
    GRPC.lightningAddInvoice
    grpcDefaultTimeout

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

subscribeChannelEvents ::
  (KatipContext m) =>
  --
  -- TODO : replace IO with m if possible
  --
  (ChannelEventUpdate -> IO ()) ->
  LndEnv ->
  m (Either LndError ChannelEventUpdate)
subscribeChannelEvents eventsHandler env =
  grpcSubscribe
    SubscribeChannelEvents
    GRPC.lightningSubscribeChannelEvents
    3600
    (\_ _ s -> streamHandler s)
    env
    GRPC.ChannelEventSubscription {}
  where
    streamHandler :: IO (Either GRPCIOError (Maybe GRPC.ChannelEventUpdate)) -> IO ()
    streamHandler stream = do
      msg <- stream
      case msg of
        Left e -> fail $ "SubscribeChannelEvents error " <> show e
        Right Nothing -> fail "SubscribeChannelEvents got Nothing"
        Right (Just gi) -> do
          --
          -- TODO : handle all fields and types overflow
          --
          case fromGrpc gi of
            Right i -> eventsHandler i
            Left e -> fail $ show e
          streamHandler stream

openChannelSync ::
  (KatipContext m) =>
  LndEnv ->
  OpenChannelRequest ->
  m (Either LndError ChannelPoint)
openChannelSync =
  grpcSync
    OpenChannelSync
    GRPC.lightningClient
    GRPC.lightningOpenChannelSync
    grpcDefaultTimeout

listChannels ::
  (KatipContext m) =>
  LndEnv ->
  ListChannelsRequest ->
  m (Either LndError ListChannelsResponse)
listChannels =
  grpcSync
    ListChannels
    GRPC.lightningClient
    GRPC.lightningListChannels
    1

closeChannel ::
  (KatipContext m) =>
  (CloseStatusUpdate -> IO ()) ->
  LndEnv ->
  CloseChannelRequest ->
  m (Either LndError CloseStatusUpdate)
closeChannel closeHandler =
  grpcSubscribe
    CloseChannel
    GRPC.lightningCloseChannel
    3600
    (\_ _ s -> streamHandler s)
  where
    streamHandler :: IO (Either GRPCIOError (Maybe GRPC.CloseStatusUpdate)) -> IO ()
    streamHandler stream = do
      msg <- stream
      case msg of
        Left e -> fail $ "CloseChannel error " <> show e
        Right Nothing -> fail "CloseChannel got Nothing"
        Right (Just gi) -> do
          --
          -- TODO : handle all fields and types overflow
          --
          case fromGrpc gi of
            Right i -> closeHandler i
            Left e -> fail $ show e
          streamHandler stream

listPeers ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError [Peer])
listPeers env =
  grpcSync
    ListPeers
    GRPC.lightningClient
    GRPC.lightningListPeers
    grpcDefaultTimeout
    env
    (def :: GRPC.ListPeersRequest)

connectPeer ::
  (KatipContext m) =>
  LndEnv ->
  ConnectPeerRequest ->
  m (Either LndError ())
connectPeer =
  grpcSync
    ConnectPeer
    GRPC.lightningClient
    GRPC.lightningConnectPeer
    grpcDefaultTimeout

getInfo ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError GetInfoResponse)
getInfo env =
  grpcSync
    GetInfo
    GRPC.lightningClient
    GRPC.lightningGetInfo
    grpcDefaultTimeout
    env
    GRPC.GetInfoRequest

sendPayment ::
  (KatipContext m) =>
  LndEnv ->
  SendPaymentRequest ->
  m (Either LndError SendPaymentResponse)
sendPayment =
  grpcSync
    SendPayment
    GRPC.lightningClient
    GRPC.lightningSendPaymentSync
    grpcDefaultTimeout

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
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) InfoS "RPC is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> GRPC.lightningClient client
          rawGrpc <-
            method' $
              ClientReaderRequest grpcReq timeout (grpcMeta env) handler
          return $ case rawGrpc of
            --
            -- TODO : here probably ReaderResponse should be valid?
            --
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
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $ do
      case res of
        Left e -> do
          let logMsg = logStr ("RPC failed with error " <> show e :: Text)
          if envLndLogErrors env
            then $(logTM) ErrorS logMsg
            else $(logTM) InfoS logMsg
        Right _ ->
          $(logTM) InfoS "RPC succeeded"
      return res

grpcSync ::
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
  --
  -- TODO : newtype for timeout
  --
  Int ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSync rpcName service method timeout env req =
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) InfoS "RPC is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> service client
          rawGrpc <- method' $ ClientNormalRequest grpcReq timeout $ grpcMeta env
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
    --
    -- TODO : better logs?
    --
    katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $ do
      case res of
        Left e -> do
          let logMsg = logStr ("RPC failed with error " <> show e :: Text)
          if envLndLogErrors env
            then $(logTM) ErrorS logMsg
            else $(logTM) InfoS logMsg
        Right _ ->
          $(logTM) InfoS "RPC succeeded"
      return res

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = fromStrict . encodeTimespan SubsecondPrecisionAuto
