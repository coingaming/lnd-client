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
    openChannel,
    listChannels,
    closeChannel,
    listPeers,
    connectPeer,
    lazyConnectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    subscribeChannelEvents,
    grpcSync,
    grpcSubscribe,
  )
where

import qualified Control.Exception as CE (catch, throw)
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.GetInfo
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (Channel (..), ListChannelsRequest (..))
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
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
  | OpenChannel
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
      env
      InitWalletRequest
        { walletPassword = coerce $ envLndWalletPassword env,
          cipherSeedMnemonic = coerce $ envLndCipherSeedMnemonic env,
          aezeedPassphrase = coerce $ envLndAezeedPassphrase env
        }
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  when (isRight res) $ void $ liftIO $ delay 5000000
  return res

unlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
unlockWallet env = do
  res <-
    grpcSync
      UnlockWallet
      GRPC.walletUnlockerClient
      GRPC.walletUnlockerUnlockWallet
      env
      UnlockWalletRequest
        { walletPassword = coerce $ envLndWalletPassword env,
          --
          -- TODO : this is related to BIP44
          -- hardcoded value will be sufficient for most cases
          -- but maybe let's have it in LndEnv as well?
          --
          recoveryWindow = 100
        }
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  when (isRight res) $ void $ liftIO $ delay 5000000
  return res

lazyUnlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyUnlockWallet env =
  katipAddContext (sl "RpcName" LazyUnlockWallet) $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    unlocked <- isRight <$> getInfo (env {envLndLogStrategy = logMaskErrors})
    if unlocked
      then do
        $(logTM)
          (newSeverity env InfoS Nothing Nothing)
          "Wallet is already unlocked, doing nothing"
        return $ Right ()
      else unlockWallet env

lazyInitWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
lazyInitWallet env =
  katipAddContext (sl "RpcName" LazyInitWallet) $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    unlockRes <- lazyUnlockWallet $ env {envLndLogStrategy = logMaskErrors}
    if isRight unlockRes
      then return unlockRes
      else do
        initRes <- initWallet env
        when (isLeft initRes) $
          $(logTM) ErrorS "Wallet initialization fiasco"
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
    env
    (GRPC.NewAddressRequest $ Enumerated $ Right req)

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

subscribeInvoices ::
  (KatipContext m) =>
  --
  -- TODO : replace IO with m if possible
  --
  (Invoice -> IO ()) ->
  LndEnv ->
  SubscribeInvoicesRequest ->
  m (Either LndError ())
subscribeInvoices =
  grpcSubscribe
    SubscribeInvoices
    GRPC.lightningSubscribeInvoices

subscribeChannelEvents ::
  (KatipContext m) =>
  --
  -- TODO : replace IO with m if possible
  --
  (ChannelEventUpdate -> IO ()) ->
  LndEnv ->
  m (Either LndError ())
subscribeChannelEvents handler env =
  grpcSubscribe
    SubscribeChannelEvents
    GRPC.lightningSubscribeChannelEvents
    handler
    env
    GRPC.ChannelEventSubscription {}

openChannel ::
  (KatipContext m) =>
  (GRPC.OpenStatusUpdate -> IO ()) ->
  LndEnv ->
  OpenChannelRequest ->
  m (Either LndError ())
openChannel =
  grpcSubscribe
    OpenChannel
    GRPC.lightningOpenChannel

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

listChannels ::
  (KatipContext m) =>
  LndEnv ->
  ListChannelsRequest ->
  m (Either LndError [Channel])
listChannels =
  grpcSync
    ListChannels
    GRPC.lightningClient
    GRPC.lightningListChannels

closeChannel ::
  (KatipContext m) =>
  (CloseStatusUpdate -> IO ()) ->
  LndEnv ->
  CloseChannelRequest ->
  m (Either LndError ())
closeChannel =
  grpcSubscribe
    CloseChannel
    GRPC.lightningCloseChannel

listPeers ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError [Peer])
listPeers env =
  grpcSync
    ListPeers
    GRPC.lightningClient
    GRPC.lightningListPeers
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

lazyConnectPeer ::
  (KatipContext m) =>
  LndEnv ->
  ConnectPeerRequest ->
  m (Either LndError ())
lazyConnectPeer env cpr = do
  eps <- listPeers env
  case eps of
    Left e ->
      return $ Left e
    Right ps ->
      if any ((== pk) . pubKey) ps
        then return $ Right ()
        else connectPeer env cpr
  where
    pk = pubkey $ addr cpr

getInfo ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError GetInfoResponse)
getInfo env =
  grpcSync
    GetInfo
    GRPC.lightningClient
    GRPC.lightningGetInfo
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

grpcSubscribe ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB
  ) =>
  RpcName ->
  ( GRPC.Lightning ClientRequest ClientResult ->
    ClientRequest 'ServerStreaming gA gB ->
    IO (ClientResult streamType streamResult)
  ) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribe rpcName method handler env req =
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> GRPC.lightningClient client
          let greq =
                ClientReaderRequest
                  grpcReq
                  (unGrpcTimeout $ envLndAsyncGrpcTimeout env)
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
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSync rpcName service method env req =
  katipAddContext (sl "RpcName" rpcName) $ katipAddLndContext env $ do
    $(logTM) (newSeverity env InfoS Nothing Nothing) "RPC is running..."
    (ts, res) <- liftIO $ stopwatch $ case toGrpc req of
      Left e -> return $ Left e
      Right grpcReq ->
        withGRPCClient (envLndGrpcConfig env) $ \client -> do
          method' <- method <$> service client
          rawGrpc <-
            method' $
              ClientNormalRequest
                grpcReq
                (unGrpcTimeout $ envLndSyncGrpcTimeout env)
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

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = fromStrict . encodeTimespan SubsecondPrecisionAuto

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
