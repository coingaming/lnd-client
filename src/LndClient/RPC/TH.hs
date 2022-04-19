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
import LndClient.Data.FinalizePsbt
import LndClient.Data.FundPsbt (FundPsbtRequest, FundPsbtResponse)
import qualified LndClient.Data.GetInfo as GI
import LndClient.Data.HtlcEvent (HtlcEvent (..))
import qualified LndClient.Data.InitWallet as IW
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.LeaseOutput (LeaseOutputRequest, LeaseOutputResponse)
import LndClient.Data.ListChannels (ListChannelsRequest (..))
import LndClient.Data.ListInvoices (ListInvoiceRequest (..), ListInvoiceResponse (..))
import LndClient.Data.ListLeases (ListLeasesRequest, ListLeasesResponse)
import LndClient.Data.ListUnspent
import LndClient.Data.NewAddress (NewAddressRequest (..), NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..), OpenStatusUpdate (..))
import LndClient.Data.PayReq (PayReq (..))
import LndClient.Data.Payment (Payment (..))
import LndClient.Data.Peer
  ( ConnectPeerRequest (..),
    LightningAddress (..),
    Peer (..),
  )
import LndClient.Data.PendingChannels (PendingChannelsResponse (..))
import LndClient.Data.PublishTransaction (PublishTransactionRequest, PublishTransactionResponse)
import LndClient.Data.ReleaseOutput (ReleaseOutputRequest, ReleaseOutputResponse)
import LndClient.Data.SendCoins (SendCoinsRequest, SendCoinsResponse)
import LndClient.Data.SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SignMessage
  ( SignMessageRequest (..),
    SignMessageResponse (..),
  )
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Data.SubscribeInvoices
  ( SubscribeInvoicesRequest (..),
  )
import LndClient.Data.TrackPayment (TrackPaymentRequest (..))
import qualified LndClient.Data.UnlockWallet as UW
import qualified LndClient.Data.VerifyMessage as VM
  ( VerifyMessageRequest (..),
    VerifyMessageResponse (..),
  )
import LndClient.Import
import LndClient.RPC.Generic
import Network.GRPC.HTTP2.ProtoLens (RPC (..))
import qualified Proto.Invoicesrpc.Invoices as LnGRPC
import qualified Proto.Lightning as LnGRPC
import qualified Proto.Lnrpc.Ln0 as LnGRPC
import qualified Proto.Routerrpc.Router as LnGRPC
import qualified Proto.Signrpc.Signer as LnGRPC
import qualified Proto.Walletrpc.Walletkit as LnGRPC
import qualified Proto.Walletunlocker as LnGRPC

data RpcKind = RpcSilent | RpcKatip

mkRpc :: RpcKind -> Q [Dec]
mkRpc k = do
  m <- VarT <$> newName "m"
  [d|
    getInfo ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError GI.GetInfoResponse)
    getInfo env =
      $(grpcRetry) $
        $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "getInfo")
          env
          (defMessage :: LnGRPC.GetInfoRequest)

    initWallet ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError ())
    initWallet env = do
      case envLndCipherSeedMnemonic env of
        Nothing -> pure . Left $ LndEnvError "CipherSeed is required for initWallet"
        Just seed -> do
          res <-
            $(grpcRetry) $
              $(grpcSync)
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
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError ())
    unlockWallet env = do
      res <-
        $(grpcRetry) $
          $(grpcSync)
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
      $(tcc m) =>
      LndEnv ->
      NewAddressRequest ->
      $(pure m) (Either LndError NewAddressResponse)
    newAddress env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "newAddress")
          env

    addInvoice ::
      $(tcc m) =>
      LndEnv ->
      AddInvoiceRequest ->
      $(pure m) (Either LndError AddInvoiceResponse)
    addInvoice env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "addInvoice")
          env

    addHodlInvoice ::
      $(tcc m) =>
      LndEnv ->
      AddHodlInvoiceRequest ->
      $(pure m) (Either LndError PaymentRequest)
    addHodlInvoice env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "addHoldInvoice")
          env

    cancelInvoice ::
      $(tcc m) =>
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError ())
    cancelInvoice env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "cancelInvoice")
          env

    settleInvoice ::
      $(tcc m) =>
      LndEnv ->
      RPreimage ->
      $(pure m) (Either LndError ())
    settleInvoice env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "settleInvoice")
          env

    subscribeSingleInvoice ::
      $(tcc m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError ())
    subscribeSingleInvoice handler env =
      catchWalletLock env
        . $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Invoices "subscribeSingleInvoice")
          handler
          env

    subscribeSingleInvoiceChan ::
      $(tcc m) =>
      (req -> RHash) ->
      Maybe (TChan (req, Invoice)) ->
      LndEnv ->
      req ->
      $(pure m) (Either LndError ())
    subscribeSingleInvoiceChan accessor mq env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeSingleInvoice
        (\x -> atomically $ writeTChan q (req, x))
        env
        $ accessor req

    subscribeInvoices ::
      $(tcc m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      $(pure m) (Either LndError ())
    subscribeInvoices handler env =
      catchWalletLock env
        . $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Lightning "subscribeInvoices")
          handler
          env

    subscribeInvoicesChan ::
      $(tcc m) =>
      Maybe (TChan (SubscribeInvoicesRequest, Invoice)) ->
      LndEnv ->
      SubscribeInvoicesRequest ->
      $(pure m) (Either LndError ())
    subscribeInvoicesChan mq env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeInvoices
        (\x -> atomically $ writeTChan q (req, x))
        env
        req

    subscribeChannelEvents ::
      $(tcc m) =>
      (ChannelEventUpdate -> IO ()) ->
      LndEnv ->
      $(pure m) (Either LndError ())
    subscribeChannelEvents handler env =
      catchWalletLock env $
        $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Lightning "subscribeChannelEvents")
          handler
          env
          (defMessage :: LnGRPC.ChannelEventSubscription)

    subscribeChannelEventsChan ::
      $(tcc m) =>
      Maybe (TChan ((), ChannelEventUpdate)) ->
      LndEnv ->
      $(pure m) (Either LndError ())
    subscribeChannelEventsChan mq env = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mq
      subscribeChannelEvents
        (\x -> atomically $ writeTChan q ((), x))
        env

    openChannel ::
      $(tcc m) =>
      (OpenStatusUpdate -> IO ()) ->
      LndEnv ->
      OpenChannelRequest ->
      $(pure m) (Either LndError ())
    openChannel handler env =
      catchWalletLock env
        . $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Lightning "openChannel")
          handler
          env

    openChannelSync ::
      $(tcc m) =>
      LndEnv ->
      OpenChannelRequest ->
      $(pure m) (Either LndError ChannelPoint)
    openChannelSync env =
      catchWalletLock env
        . $(grpcSync) (RPC :: RPC LnGRPC.Lightning "openChannelSync") env

    listChannels ::
      $(tcc m) =>
      LndEnv ->
      ListChannelsRequest ->
      $(pure m) (Either LndError [Channel])
    listChannels env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listChannels")
          env

    listInvoices ::
      $(tcc m) =>
      LndEnv ->
      ListInvoiceRequest ->
      $(pure m) (Either LndError ListInvoiceResponse)
    listInvoices env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listInvoices")
          env

    closedChannels ::
      $(tcc m) =>
      LndEnv ->
      ClosedChannelsRequest ->
      $(pure m) (Either LndError [ChannelCloseSummary])
    closedChannels env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "closedChannels")
          env

    closeChannel ::
      $(tcc m) =>
      (CloseStatusUpdate -> IO ()) ->
      LndEnv ->
      CloseChannelRequest ->
      $(pure m) (Either LndError ())
    closeChannel handler env =
      catchWalletLock env
        . $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Lightning "closeChannel")
          handler
          env

    listPeers ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError [Peer])
    listPeers env =
      catchWalletLock env
        . $(grpcRetry)
        $ $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listPeers")
          env
          (defMessage :: LnGRPC.ListPeersRequest)

    connectPeer ::
      $(tcc m) =>
      LndEnv ->
      ConnectPeerRequest ->
      $(pure m) (Either LndError ())
    connectPeer env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "connectPeer")
          env

    lazyConnectPeer ::
      $(tcc m) =>
      LndEnv ->
      ConnectPeerRequest ->
      $(pure m) (Either LndError ())
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
      $(tcc m) =>
      LndEnv ->
      SendPaymentRequest ->
      $(pure m) (Either LndError SendPaymentResponse)
    sendPayment env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "sendPaymentSync")
          env

    fundPsbt ::
      $(tcc m) =>
      LndEnv ->
      FundPsbtRequest ->
      $(pure m) (Either LndError FundPsbtResponse)
    fundPsbt env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "fundPsbt")
          env

    finalizePsbt ::
      $(tcc m) =>
      LndEnv ->
      FinalizePsbtRequest ->
      $(pure m) (Either LndError FinalizePsbtResponse)
    finalizePsbt env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "finalizePsbt")
          env

    publishTransaction ::
      $(tcc m) =>
      LndEnv ->
      PublishTransactionRequest ->
      $(pure m) (Either LndError PublishTransactionResponse)
    publishTransaction env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "publishTransaction")
          env

    listUnspent ::
      $(tcc m) =>
      LndEnv ->
      ListUnspentRequest ->
      $(pure m) (Either LndError ListUnspentResponse)
    listUnspent env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "listUnspent")
          env

    listLeases ::
      $(tcc m) =>
      LndEnv ->
      ListLeasesRequest ->
      $(pure m) (Either LndError ListLeasesResponse)
    listLeases env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "listLeases")
          env

    leaseOutput ::
      $(tcc m) =>
      LndEnv ->
      LeaseOutputRequest ->
      $(pure m) (Either LndError LeaseOutputResponse)
    leaseOutput env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "leaseOutput")
          env

    releaseOutput ::
      $(tcc m) =>
      LndEnv ->
      ReleaseOutputRequest ->
      $(pure m) (Either LndError ReleaseOutputResponse)
    releaseOutput env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.WalletKit "releaseOutput")
          env

    sendCoins ::
      $(tcc m) =>
      LndEnv ->
      SendCoinsRequest ->
      $(pure m) (Either LndError SendCoinsResponse)
    sendCoins env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "sendCoins")
          env

    subscribeHtlcEvents ::
      $(tcc m) =>
      (HtlcEvent -> IO ()) ->
      LndEnv ->
      $(pure m) (Either LndError ())
    subscribeHtlcEvents handler env =
      catchWalletLock env $
        $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Router "subscribeHtlcEvents")
          handler
          env
          (defMessage :: LnGRPC.SubscribeHtlcEventsRequest)

    decodePayReq ::
      $(tcc m) =>
      LndEnv ->
      PaymentRequest ->
      $(pure m) (Either LndError PayReq)
    decodePayReq env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "decodePayReq")
          env

    lookupInvoice ::
      $(tcc m) =>
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError Invoice)
    lookupInvoice env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "lookupInvoice")
          env

    trackPaymentV2 ::
      $(tcc m) =>
      (Payment -> IO ()) ->
      LndEnv ->
      TrackPaymentRequest ->
      $(pure m) (Either LndError ())
    trackPaymentV2 handler env =
      catchWalletLock env
        . $(grpcSubscribe)
          (RPC :: RPC LnGRPC.Router "trackPaymentV2")
          handler
          env

    trackPaymentV2Chan ::
      $(tcc m) =>
      Maybe (TChan (TrackPaymentRequest, Payment)) ->
      LndEnv ->
      TrackPaymentRequest ->
      $(pure m) (Either LndError ())
    trackPaymentV2Chan mc env req = do
      q <- fromMaybeM (atomically newBroadcastTChan) $ pure mc
      trackPaymentV2
        (\x -> atomically $ writeTChan q (req, x))
        env
        req

    pendingChannels ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError PendingChannelsResponse)
    pendingChannels env =
      catchWalletLock env
        . $(grpcRetry)
        $ $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "pendingChannels")
          env
          (defMessage :: LnGRPC.PendingChannelsRequest)

    signMessage ::
      $(tcc m) =>
      LndEnv ->
      SignMessageRequest ->
      $(pure m) (Either LndError SignMessageResponse)
    signMessage env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Signer "signMessage")
          env

    verifyMessage ::
      $(tcc m) =>
      LndEnv ->
      VM.VerifyMessageRequest ->
      $(pure m) (Either LndError VM.VerifyMessageResponse)
    verifyMessage env =
      catchWalletLock env
        . $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Signer "verifyMessage")
          env
    |]
  where
    tcc m = case k of
      RpcSilent -> [t|(MonadUnliftIO $(pure m))|]
      RpcKatip -> [t|(KatipContext $(pure m), MonadUnliftIO $(pure m))|]
    grpcRetry = case k of
      RpcSilent -> [e|retrySilent|]
      RpcKatip -> [e|retryKatip|]
    grpcSync = case k of
      RpcSilent -> [e|grpcSyncSilent|]
      RpcKatip -> [e|grpcSyncKatip|]
    grpcSubscribe = case k of
      RpcSilent -> [e|grpcSubscribeSilent|]
      RpcKatip -> [e|grpcSubscribeKatip|]
