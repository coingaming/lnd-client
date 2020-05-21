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
    newAddress,
    addInvoice,
    initWallet,
    openChannelSync,
    listPeers,
    connectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    grpcSync,
    grpcSubscribe,
  )
where

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
import LndClient.Data.SendPayment as SendPayment
  ( SendPaymentRequest (..),
    SendPaymentResponse (..),
  )
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
  | NewAddress
  | AddInvoice
  | InitWallet
  | SubscribeInvoices
  | OpenChannelSync
  | ListPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  deriving (Generic)

instance ToJSON RpcName

grpcMeta :: LndEnv -> MetadataMap
grpcMeta env =
  [("macaroon", coerce $ envLndHexMacaroon env)]

grpcDefaultTimeout :: Int
grpcDefaultTimeout = 5

initWallet ::
  (KatipContext m) =>
  LndEnv ->
  InitWalletRequest ->
  m (Either LndError ())
initWallet env req = do
  res <-
    grpcSync
      InitWallet
      GRPC.walletUnlockerClient
      GRPC.walletUnlockerInitWallet
      grpcDefaultTimeout
      env
      req
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  _ <- liftIO $ delay 5000000
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
    InitWallet
    GRPC.walletUnlockerClient
    GRPC.walletUnlockerUnlockWallet
    grpcDefaultTimeout
    env
    UnlockWalletRequest
      { walletPassword = coerce $ envLndWalletPassword env,
        recoveryWindow = 0
      }

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
    katipAddContext (sl "elapsedSeconds" (showElapsedSeconds ts)) $ do
      if isRight res
        then $(logTM) ErrorS "rpc failed"
        else $(logTM) InfoS "rpc succeeded"
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
  katipAddContext (sl "rpcName" rpcName) $ do
    $(logTM) InfoS "rpc is running..."
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
    katipAddContext (sl "elapsedSeconds" (showElapsedSeconds ts)) $ do
      case res of
        Left e ->
          $(logTM) ErrorS $ logStr ("rpc failed with error " <> show e :: Text)
        Right _ ->
          $(logTM) InfoS "rpc succeeded"
      return res

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = encodeTimespan SubsecondPrecisionAuto
