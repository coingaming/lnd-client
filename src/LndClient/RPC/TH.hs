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
import LndClient.Data.Channel (Channel (..))
import LndClient.Data.ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel
  ( ChannelCloseSummary (..),
    CloseChannelRequest (..),
    CloseStatusUpdate (..),
  )
import LndClient.Data.ClosedChannels (ClosedChannelsRequest (..))
import LndClient.Data.HtlcEvent (HtlcEvent (..))
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (ListChannelsRequest (..))
import LndClient.Data.ListInvoices (ListInvoiceRequest (..), ListInvoiceResponse (..))
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.PayReq (PayReq (..))
import LndClient.Data.Payment (Payment (..))
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
    Peer (..),
  )
import LndClient.Data.PendingChannels (PendingChannelsResponse (..))
import LndClient.Data.SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Data.TrackPayment (TrackPaymentRequest (..))
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Import
import LndClient.RPC.Generic
import qualified LndGrpc as GRPC
import qualified RouterGrpc as GRPC
import qualified WalletUnlockerGrpc as GRPC

data RpcKind = RpcSilent | RpcKatip

mkRpc :: RpcKind -> Q [Dec]
mkRpc k = do
  [d|
    initWallet ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError ())
    initWallet env =
      case envLndCipherSeedMnemonic env of
        Nothing -> pure . Left $ LndEnvError "CipherSeed is required for initWallet"
        Just seed -> do
          res <-
            $(grpcRetry) $
              $(grpcSync)
                InitWallet
                GRPC.walletUnlockerClient
                GRPC.walletUnlockerInitWallet
                env
                InitWalletRequest
                  { walletPassword =
                      coerce $ envLndWalletPassword env,
                    cipherSeedMnemonic =
                      coerce seed,
                    aezeedPassphrase =
                      coerce $ envLndAezeedPassphrase env
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
        $(grpcRetry) $
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
      $(grpcRetry) $
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
    addInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          AddInvoice
          GRPC.lightningClient
          GRPC.lightningAddInvoice
          env

    addHodlInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      AddHodlInvoiceRequest ->
      m (Either LndError PaymentRequest)
    addHodlInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          AddHodlInvoice
          GRPC.invoicesClient
          GRPC.invoicesAddHoldInvoice
          env

    cancelInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RHash ->
      m (Either LndError ())
    cancelInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          CancelInvoice
          GRPC.invoicesClient
          GRPC.invoicesCancelInvoice
          env

    settleInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RPreimage ->
      m (Either LndError ())
    settleInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          SettleInvoice
          GRPC.invoicesClient
          GRPC.invoicesSettleInvoice
          env

    subscribeSingleInvoice ::
      ($(tcc) m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      RHash ->
      m (Either LndError ())
    subscribeSingleInvoice =
      $(grpcSubscribe)
        SubscribeSingleInvoice
        GRPC.invoicesClient
        GRPC.invoicesSubscribeSingleInvoice

    subscribeSingleInvoiceChan ::
      ($(tcc) m) =>
      Maybe (TChan (RHash, Invoice)) ->
      LndEnv ->
      RHash ->
      m (Either LndError ())
    subscribeSingleInvoiceChan mq env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeSingleInvoice
        (\x -> atomically $ writeTChan q (req, x))
        env
        req

    subscribeInvoices ::
      ($(tcc) m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      m (Either LndError ())
    subscribeInvoices =
      $(grpcSubscribe)
        SubscribeInvoices
        GRPC.lightningClient
        GRPC.lightningSubscribeInvoices

    subscribeInvoicesChan ::
      ($(tcc) m) =>
      Maybe (TChan (SubscribeInvoicesRequest, Invoice)) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      m (Either LndError ())
    subscribeInvoicesChan mq env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeInvoices
        (\x -> atomically $ writeTChan q (req, x))
        env
        req

    subscribeChannelEvents ::
      ($(tcc) m) =>
      (ChannelEventUpdate -> IO ()) ->
      LndEnv ->
      m (Either LndError ())
    subscribeChannelEvents handler env =
      $(grpcSubscribe)
        SubscribeChannelEvents
        GRPC.lightningClient
        GRPC.lightningSubscribeChannelEvents
        handler
        env
        GRPC.ChannelEventSubscription {}

    subscribeChannelEventsChan ::
      ($(tcc) m) =>
      Maybe (TChan ((), ChannelEventUpdate)) ->
      LndEnv ->
      m (Either LndError ())
    subscribeChannelEventsChan mq env = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeChannelEvents
        (\x -> atomically $ writeTChan q ((), x))
        env

    openChannel ::
      ($(tcc) m) =>
      (GRPC.OpenStatusUpdate -> IO ()) ->
      LndEnv ->
      OpenChannelRequest ->
      m (Either LndError ())
    openChannel =
      $(grpcSubscribe)
        OpenChannel
        GRPC.lightningClient
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
    listChannels env =
      $(grpcRetry)
        . $(grpcSync)
          ListChannels
          GRPC.lightningClient
          GRPC.lightningListChannels
          env

    listInvoices ::
      ($(tcc) m) =>
      LndEnv ->
      ListInvoiceRequest ->
      m (Either LndError ListInvoiceResponse)
    listInvoices env =
      $(grpcRetry)
        . $(grpcSync)
          ListInvoices
          GRPC.lightningClient
          GRPC.lightningListInvoices
          env

    closedChannels ::
      ($(tcc) m) =>
      LndEnv ->
      ClosedChannelsRequest ->
      m (Either LndError [ChannelCloseSummary])
    closedChannels env =
      $(grpcRetry)
        . $(grpcSync)
          ClosedChannels
          GRPC.lightningClient
          GRPC.lightningClosedChannels
          env

    closeChannel ::
      ($(tcc) m) =>
      (CloseStatusUpdate -> IO ()) ->
      LndEnv ->
      CloseChannelRequest ->
      m (Either LndError ())
    closeChannel =
      $(grpcSubscribe)
        CloseChannel
        GRPC.lightningClient
        GRPC.lightningCloseChannel

    listPeers ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError [Peer])
    listPeers env =
      $(grpcRetry) $
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
    connectPeer env =
      $(grpcRetry)
        . $(grpcSync)
          ConnectPeer
          GRPC.lightningClient
          GRPC.lightningConnectPeer
          env

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
    sendPayment env =
      $(grpcRetry)
        . $(grpcSync)
          SendPayment
          GRPC.lightningClient
          GRPC.lightningSendPaymentSync
          env

    subscribeHtlcEvents ::
      ($(tcc) m) =>
      (HtlcEvent -> IO ()) ->
      LndEnv ->
      m (Either LndError ())
    subscribeHtlcEvents handler env =
      $(grpcSubscribe)
        SubscribeHtlcEvents
        GRPC.routerClient
        GRPC.routerSubscribeHtlcEvents
        handler
        env
        GRPC.SubscribeHtlcEventsRequest {}

    decodePayReq ::
      ($(tcc) m) =>
      LndEnv ->
      PaymentRequest ->
      m (Either LndError PayReq)
    decodePayReq env =
      $(grpcRetry)
        . $(grpcSync)
          DecodePayReq
          GRPC.lightningClient
          GRPC.lightningDecodePayReq
          env

    lookupInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RHash ->
      m (Either LndError Invoice)
    lookupInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          LookupInvoice
          GRPC.lightningClient
          GRPC.lightningLookupInvoice
          env

    trackPaymentV2 ::
      ($(tcc) m) =>
      (Payment -> IO ()) ->
      LndEnv ->
      TrackPaymentRequest ->
      m (Either LndError ())
    trackPaymentV2 =
      $(grpcSubscribe)
        TrackPaymentV2
        GRPC.routerClient
        GRPC.routerTrackPaymentV2

    trackPaymentV2Chan ::
      ($(tcc) m) =>
      Maybe (TChan (TrackPaymentRequest, Payment)) ->
      LndEnv ->
      TrackPaymentRequest ->
      m (Either LndError ())
    trackPaymentV2Chan mc env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mc
      trackPaymentV2
        (\x -> atomically $ writeTChan q (req, x))
        env
        req

    pendingChannels ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError PendingChannelsResponse)
    pendingChannels env =
      $(grpcRetry) $
        $(grpcSync)
          PendingChannels
          GRPC.lightningClient
          GRPC.lightningPendingChannels
          env
          GRPC.PendingChannelsRequest
    |]
  where
    tcc = case k of
      RpcSilent -> [t|MonadIO|]
      RpcKatip -> [t|KatipContext|]
    grpcRetry = case k of
      RpcSilent -> [e|retrySilent|]
      RpcKatip -> [e|retryKatip|]
    grpcSync = case k of
      RpcSilent -> [e|grpcSyncSilent|]
      RpcKatip -> [e|grpcSyncKatip|]
    grpcSubscribe = case k of
      RpcSilent -> [e|grpcSubscribeSilent|]
      RpcKatip -> [e|grpcSubscribeKatip|]
