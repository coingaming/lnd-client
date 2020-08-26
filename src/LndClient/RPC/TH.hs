{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC.TH
  ( mkRpc,
    RpcKind (..),
  )
where

import qualified InvoiceGrpc as GRPC
import Language.Haskell.TH.Syntax
import LndClient.Data.AddHodlInvoice (AddHodlInvoiceRequest (..))
import LndClient.Data.AddInvoice (AddInvoiceRequest (..), AddInvoiceResponse (..))
import LndClient.Data.ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..), CloseStatusUpdate (..))
import LndClient.Data.GetInfo
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
import qualified LndGrpc as GRPC
import qualified WalletUnlockerGrpc as GRPC

data RpcKind = RpcSilent | RpcKatip

mkRpc :: RpcKind -> Q [Dec]
mkRpc k = do
  [d|
    getInfo ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError GetInfoResponse)
    getInfo env =
      $(grpcSync)
        GetInfo
        GRPC.lightningClient
        GRPC.lightningGetInfo
        env
        GRPC.GetInfoRequest

    initWallet ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError ())
    initWallet env = do
      res <-
        $(grpcSync)
          InitWallet
          GRPC.walletUnlockerClient
          GRPC.walletUnlockerInitWallet
          env
          InitWalletRequest
            { walletPassword = coerce $ envLndWalletPassword env,
              cipherSeedMnemonic = coerce $ envLndCipherSeedMnemonic env,
              aezeedPassphrase = coerce $ envLndAezeedPassphrase env
            }
      if isRight res
        then waitForGrpc env
        else return res

    unlockWallet ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError ())
    unlockWallet env = do
      res <-
        $(grpcSync)
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

    newAddress ::
      ($(tcc) m) =>
      LndEnv ->
      GRPC.AddressType ->
      m (Either LndError NewAddressResponse)
    newAddress env req =
      $(grpcSync)
        NewAddress
        GRPC.lightningClient
        GRPC.lightningNewAddress
        env
        (GRPC.NewAddressRequest $ Enumerated $ Right req)

    addInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      AddInvoiceRequest ->
      m (Either LndError AddInvoiceResponse)
    addInvoice =
      $(grpcSync)
        AddInvoice
        GRPC.lightningClient
        GRPC.lightningAddInvoice

    addHodlInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      AddHodlInvoiceRequest ->
      m (Either LndError PaymentRequest)
    addHodlInvoice =
      $(grpcSync)
        AddHodlInvoice
        GRPC.invoicesClient
        GRPC.invoicesAddHoldInvoice

    cancelInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RHash ->
      m (Either LndError ())
    cancelInvoice =
      $(grpcSync)
        CancelInvoice
        GRPC.invoicesClient
        GRPC.invoicesCancelInvoice

    settleInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RPreimage ->
      m (Either LndError ())
    settleInvoice =
      $(grpcSync)
        SettleInvoice
        GRPC.invoicesClient
        GRPC.invoicesSettleInvoice

    subscribeInvoices ::
      ($(tcc) m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      m (Either LndError ())
    subscribeInvoices =
      $(grpcSubscribe)
        SubscribeInvoices
        GRPC.lightningSubscribeInvoices

    subscribeInvoicesQ ::
      ($(tcc) m) =>
      Maybe (TChan Invoice) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      m (Either LndError ())
    subscribeInvoicesQ mq env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeInvoices (atomically . writeTChan q) env req

    subscribeChannelEvents ::
      ($(tcc) m) =>
      (ChannelEventUpdate -> IO ()) ->
      LndEnv ->
      m (Either LndError ())
    subscribeChannelEvents handler env =
      $(grpcSubscribe)
        SubscribeChannelEvents
        GRPC.lightningSubscribeChannelEvents
        handler
        env
        GRPC.ChannelEventSubscription {}

    subscribeChannelEventsQ ::
      ($(tcc) m) =>
      Maybe (TChan ChannelEventUpdate) ->
      LndEnv ->
      m (Either LndError ())
    subscribeChannelEventsQ mq env = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeChannelEvents (atomically . writeTChan q) env

    openChannel ::
      ($(tcc) m) =>
      (GRPC.OpenStatusUpdate -> IO ()) ->
      LndEnv ->
      OpenChannelRequest ->
      m (Either LndError ())
    openChannel =
      $(grpcSubscribe)
        OpenChannel
        GRPC.lightningOpenChannel

    openChannelSync ::
      ($(tcc) m) =>
      LndEnv ->
      OpenChannelRequest ->
      m (Either LndError ChannelPoint)
    openChannelSync =
      $(grpcSync)
        OpenChannelSync
        GRPC.lightningClient
        GRPC.lightningOpenChannelSync

    listChannels ::
      ($(tcc) m) =>
      LndEnv ->
      ListChannelsRequest ->
      m (Either LndError [Channel])
    listChannels =
      $(grpcSync)
        ListChannels
        GRPC.lightningClient
        GRPC.lightningListChannels

    closeChannel ::
      ($(tcc) m) =>
      (CloseStatusUpdate -> IO ()) ->
      LndEnv ->
      CloseChannelRequest ->
      m (Either LndError ())
    closeChannel =
      $(grpcSubscribe)
        CloseChannel
        GRPC.lightningCloseChannel

    listPeers ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError [Peer])
    listPeers env =
      $(grpcSync)
        ListPeers
        GRPC.lightningClient
        GRPC.lightningListPeers
        env
        (def :: GRPC.ListPeersRequest)

    connectPeer ::
      ($(tcc) m) =>
      LndEnv ->
      ConnectPeerRequest ->
      m (Either LndError ())
    connectPeer =
      $(grpcSync)
        ConnectPeer
        GRPC.lightningClient
        GRPC.lightningConnectPeer

    lazyConnectPeer ::
      ($(tcc) m) =>
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
      ($(tcc) m) =>
      LndEnv ->
      SendPaymentRequest ->
      m (Either LndError SendPaymentResponse)
    sendPayment =
      $(grpcSync)
        SendPayment
        GRPC.lightningClient
        GRPC.lightningSendPaymentSync
    |]
  where
    tcc = case k of
      RpcSilent -> [t|MonadIO|]
      RpcKatip -> [t|KatipContext|]
    grpcSync = case k of
      RpcSilent -> [e|grpcSyncSilent|]
      RpcKatip -> [e|grpcSyncKatip|]
    grpcSubscribe = case k of
      RpcSilent -> [e|grpcSubscribeSilent|]
      RpcKatip -> [e|grpcSubscribeKatip|]
