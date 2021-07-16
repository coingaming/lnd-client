{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC.TH
  ( mkRpc,
    RpcKind (..),
  )
where

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
import qualified LndClient.Data.GetInfo as GI
import LndClient.Data.HtlcEvent (HtlcEvent (..))
import qualified LndClient.Data.InitWallet as IW
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (ListChannelsRequest (..))
import LndClient.Data.ListInvoices (ListInvoiceRequest (..), ListInvoiceResponse (..))
import LndClient.Data.NewAddress (NewAddressRequest (..), NewAddressResponse (..))
import LndClient.Data.OpenChannel
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
import qualified LndClient.Data.UnlockWallet as UW
import LndClient.Import
import LndClient.RPC.Generic
import qualified LndGrpc as GRPC
import Network.GRPC.HTTP2.ProtoLens (RPC (..))
import qualified Proto.InvoiceGrpc as LnGRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.WalletUnlockerGrpc as LnGRPC
import qualified RouterGrpc as GRPC

data RpcKind = RpcSilent | RpcKatip

mkRpc :: RpcKind -> Q [Dec]
mkRpc k = do
  [d|
    getInfo ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError GI.GetInfoResponse)
    getInfo env =
      $(grpcRetry) $
        $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "getInfo")
          env
          (defMessage :: LnGRPC.GetInfoRequest)

    initWallet ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError ())
    initWallet env = do
      case envLndCipherSeedMnemonic env of
        Nothing -> pure . Left $ LndEnvError "CipherSeed is required for initWallet"
        Just seed -> do
          res <-
            $(grpcRetry) $
              $(grpcSync2)
                (RPC :: RPC LnGRPC.WalletUnlocker "initWallet")
                env
                IW.InitWalletRequest
                  { IW.walletPassword =
                      coerce $ envLndWalletPassword env,
                    IW.cipherSeedMnemonic =
                      coerce seed,
                    IW.aezeedPassphrase =
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
          $(grpcSync2)
            (RPC :: RPC LnGRPC.WalletUnlocker "unlockWallet")
            env
            UW.UnlockWalletRequest
              { UW.walletPassword = coerce $ envLndWalletPassword env,
                UW.recoveryWindow = 100
              }
      if isRight res
        then waitForGrpc env
        else return res

    newAddress ::
      ($(tcc) m) =>
      LndEnv ->
      NewAddressRequest ->
      m (Either LndError NewAddressResponse)
    newAddress env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "newAddress")
          env

    addInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      AddInvoiceRequest ->
      m (Either LndError AddInvoiceResponse)
    addInvoice env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "addInvoice")
          env

    addHodlInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      AddHodlInvoiceRequest ->
      m (Either LndError PaymentRequest)
    addHodlInvoice env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Invoices "addHoldInvoice")
          env

    cancelInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RHash ->
      m (Either LndError ())
    cancelInvoice env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Invoices "cancelInvoice")
          env

    settleInvoice ::
      ($(tcc) m) =>
      LndEnv ->
      RPreimage ->
      m (Either LndError ())
    settleInvoice env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Invoices "settleInvoice")
          env

    subscribeSingleInvoice ::
      ($(tcc) m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      RHash ->
      m (Either LndError ())
    subscribeSingleInvoice =
      $(grpcSubscribe2)
        (RPC :: RPC LnGRPC.Invoices "subscribeSingleInvoice")

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
      $(grpcSubscribe2)
        (RPC :: RPC LnGRPC.Lightning "subscribeInvoices")

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
      $(grpcSubscribe2)
        (RPC :: RPC LnGRPC.Lightning "subscribeChannelEvents")
        handler
        env
        (defMessage :: LnGRPC.ChannelEventSubscription)

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
      (OpenStatusUpdate -> IO ()) ->
      LndEnv ->
      OpenChannelRequest ->
      m (Either LndError ())
    openChannel =
      $(grpcSubscribe2)
        (RPC :: RPC LnGRPC.Lightning "openChannel")

    openChannelSync ::
      ($(tcc) m) =>
      LndEnv ->
      OpenChannelRequest ->
      m (Either LndError ChannelPoint)
    openChannelSync env =
      $(grpcSync2)
        (RPC :: RPC LnGRPC.Lightning "openChannelSync")
        env

    listChannels ::
      ($(tcc) m) =>
      LndEnv ->
      ListChannelsRequest ->
      m (Either LndError [Channel])
    listChannels env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "listChannels")
          env

    listInvoices ::
      ($(tcc) m) =>
      LndEnv ->
      ListInvoiceRequest ->
      m (Either LndError ListInvoiceResponse)
    listInvoices env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "listInvoices")
          env

    closedChannels ::
      ($(tcc) m) =>
      LndEnv ->
      ClosedChannelsRequest ->
      m (Either LndError [ChannelCloseSummary])
    closedChannels env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "closedChannels")
          env

    closeChannel ::
      ($(tcc) m) =>
      (CloseStatusUpdate -> IO ()) ->
      LndEnv ->
      CloseChannelRequest ->
      m (Either LndError ())
    closeChannel =
      $(grpcSubscribe2)
        (RPC :: RPC LnGRPC.Lightning "closeChannel")

    listPeers ::
      ($(tcc) m) =>
      LndEnv ->
      m (Either LndError [Peer])
    listPeers env =
      $(grpcRetry) $
        $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "listPeers")
          env
          (defMessage :: LnGRPC.ListPeersRequest)

    connectPeer ::
      ($(tcc) m) =>
      LndEnv ->
      ConnectPeerRequest ->
      m (Either LndError ())
    connectPeer env =
      $(grpcRetry)
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "connectPeer")
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
        . $(grpcSync2)
          (RPC :: RPC LnGRPC.Lightning "sendPaymentSync")
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
    grpcSync2 = case k of
      RpcSilent -> [e|grpcSync2Silent|]
      RpcKatip -> [e|grpcSync2Katip|]
    grpcSubscribe = case k of
      RpcSilent -> [e|grpcSubscribeSilent|]
      RpcKatip -> [e|grpcSubscribeKatip|]
    grpcSubscribe2 = case k of
      RpcSilent -> [e|grpcSubscribe2Silent|]
      RpcKatip -> [e|grpcSubscribe2Katip|]
