{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.RPC
  ( waitForGrpc,
    unlockWallet,
    lazyUnlockWallet,
    lazyInitWallet,
    newAddress,
    addInvoice,
    addHodlInvoice,
    cancelInvoice,
    settleInvoice,
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
    subscribeInvoicesQ,
    subscribeChannelEvents,
    subscribeChannelEventsQ,
  )
where

import qualified InvoiceGrpc as GRPC
import LndClient.Data.AddHodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice (AddInvoiceRequest (..), AddInvoiceResponse (..))
import LndClient.Data.ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (Channel (..), ListChannelsRequest (..))
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..), Peer (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Import
import LndClient.RPC.Generic
import LndClient.RPC.TH
import qualified LndGrpc as GRPC
import qualified WalletUnlockerGrpc as GRPC

$(mkRpc RpcKatip)

waitForGrpc ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
waitForGrpc env0 = this 30 $ env0 {envLndLogStrategy = logMaskErrors}
  where
    this (x :: Int) env =
      if x > 0
        then do
          $(logTM) InfoS "Waiting for GRPC ..."
          res <- getInfo env
          if isRight res
            then return $ Right ()
            else liftIO (delay 1000000) >> this (x - 1) env
        else do
          let msg = "waitForGrpc attempt limit exceeded"
          $(logTM) ErrorS $ logStr msg
          return . Left $ LndError msg

unlockWallet ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError ())
unlockWallet env = do
  res <-
    grpcSyncKatip
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
  if isRight res
    then waitForGrpc env
    else return res

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
  grpcSyncKatip
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
  grpcSyncKatip
    AddInvoice
    GRPC.lightningClient
    GRPC.lightningAddInvoice

addHodlInvoice ::
  (KatipContext m) =>
  LndEnv ->
  AddHodlInvoiceRequest ->
  m (Either LndError PaymentRequest)
addHodlInvoice =
  grpcSyncKatip
    AddHodlInvoice
    GRPC.invoicesClient
    GRPC.invoicesAddHoldInvoice

cancelInvoice ::
  (KatipContext m) =>
  LndEnv ->
  RHash ->
  m (Either LndError ())
cancelInvoice =
  grpcSyncKatip
    CancelInvoice
    GRPC.invoicesClient
    GRPC.invoicesCancelInvoice

settleInvoice ::
  (KatipContext m) =>
  LndEnv ->
  RPreimage ->
  m (Either LndError ())
settleInvoice =
  grpcSyncKatip
    SettleInvoice
    GRPC.invoicesClient
    GRPC.invoicesSettleInvoice

subscribeInvoices ::
  (KatipContext m) =>
  (Invoice -> IO ()) ->
  LndEnv ->
  SubscribeInvoicesRequest ->
  m (Either LndError ())
subscribeInvoices =
  grpcSubscribeKatip
    SubscribeInvoices
    GRPC.lightningSubscribeInvoices

subscribeInvoicesQ ::
  (KatipContext m) =>
  Maybe (TChan Invoice) ->
  LndEnv ->
  SubscribeInvoicesRequest ->
  m (Either LndError ())
subscribeInvoicesQ mq env req = do
  q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
  subscribeInvoices (atomically . writeTChan q) env req

subscribeChannelEvents ::
  (KatipContext m) =>
  (ChannelEventUpdate -> IO ()) ->
  LndEnv ->
  m (Either LndError ())
subscribeChannelEvents handler env =
  grpcSubscribeKatip
    SubscribeChannelEvents
    GRPC.lightningSubscribeChannelEvents
    handler
    env
    GRPC.ChannelEventSubscription {}

subscribeChannelEventsQ ::
  (KatipContext m) =>
  Maybe (TChan ChannelEventUpdate) ->
  LndEnv ->
  m (Either LndError ())
subscribeChannelEventsQ mq env = do
  q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
  subscribeChannelEvents (atomically . writeTChan q) env

openChannel ::
  (KatipContext m) =>
  (GRPC.OpenStatusUpdate -> IO ()) ->
  LndEnv ->
  OpenChannelRequest ->
  m (Either LndError ())
openChannel =
  grpcSubscribeKatip
    OpenChannel
    GRPC.lightningOpenChannel

openChannelSync ::
  (KatipContext m) =>
  LndEnv ->
  OpenChannelRequest ->
  m (Either LndError ChannelPoint)
openChannelSync =
  grpcSyncKatip
    OpenChannelSync
    GRPC.lightningClient
    GRPC.lightningOpenChannelSync

listChannels ::
  (KatipContext m) =>
  LndEnv ->
  ListChannelsRequest ->
  m (Either LndError [Channel])
listChannels =
  grpcSyncKatip
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
  grpcSubscribeKatip
    CloseChannel
    GRPC.lightningCloseChannel

listPeers ::
  (KatipContext m) =>
  LndEnv ->
  m (Either LndError [Peer])
listPeers env =
  grpcSyncKatip
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
  grpcSyncKatip
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

sendPayment ::
  (KatipContext m) =>
  LndEnv ->
  SendPaymentRequest ->
  m (Either LndError SendPaymentResponse)
sendPayment =
  grpcSyncKatip
    SendPayment
    GRPC.lightningClient
    GRPC.lightningSendPaymentSync
