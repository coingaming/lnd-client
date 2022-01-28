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
--import qualified LndClient.Data.InitWallet as IW
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.ListChannels (ListChannelsRequest (..))
import LndClient.Data.ListInvoices (ListInvoiceRequest (..), ListInvoiceResponse (..))
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
--import qualified LndClient.Data.UnlockWallet as UW
import qualified LndClient.Data.VerifyMessage as VM
  ( VerifyMessageRequest (..),
    VerifyMessageResponse (..),
  )
import LndClient.Import
import LndClient.RPC.Generic
import Network.GRPC.HTTP2.ProtoLens (RPC (..))
import qualified Proto.InvoiceGrpc as LnGRPC
import qualified Proto.LndGrpc as LnGRPC
import qualified Proto.RouterGrpc as LnGRPC
--import qualified Proto.WalletUnlockerGrpc as LnGRPC
import qualified Proto.SignerGrpc as LnGRPC

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
        Just _seed -> do
--          res <-
--            $(grpcRetry) $
--              $(grpcSync)
--                (RPC :: RPC LnGRPC.WalletUnlocker "initWallet")
--                env
--                IW.InitWalletRequest
--                  { IW.walletPassword =
--                      coerce $ envLndWalletPassword env,
--                    IW.cipherSeedMnemonic =
--                      coerce seed,
--                    IW.aezeedPassphrase =
--                      coerce $ envLndAezeedPassphrase env
--                  }
--          if isRight res
--            then waitForGrpc env
--            else return res
            pure $ Right ()

    unlockWallet ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError ())
    unlockWallet _env = do
--      res <-
--        $(grpcRetry) $
--          $(grpcSync)
--            (RPC :: RPC LnGRPC.WalletUnlocker "unlockWallet")
--            env
--            UW.UnlockWalletRequest
--              { UW.walletPassword = coerce $ envLndWalletPassword env,
--                UW.recoveryWindow = 100
--              }
--      if isRight res
--        then waitForGrpc env
--        else return res
      pure $ Right ()

    newAddress ::
      $(tcc m) =>
      LndEnv ->
      NewAddressRequest ->
      $(pure m) (Either LndError NewAddressResponse)
    newAddress env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "newAddress")
          env

    addInvoice ::
      $(tcc m) =>
      LndEnv ->
      AddInvoiceRequest ->
      $(pure m) (Either LndError AddInvoiceResponse)
    addInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "addInvoice")
          env

    addHodlInvoice ::
      $(tcc m) =>
      LndEnv ->
      AddHodlInvoiceRequest ->
      $(pure m) (Either LndError PaymentRequest)
    addHodlInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "addHoldInvoice")
          env

    cancelInvoice ::
      $(tcc m) =>
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError ())
    cancelInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "cancelInvoice")
          env

    settleInvoice ::
      $(tcc m) =>
      LndEnv ->
      RPreimage ->
      $(pure m) (Either LndError ())
    settleInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Invoices "settleInvoice")
          env

    subscribeSingleInvoice ::
      $(tcc m) =>
      (Invoice -> IO ()) ->
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError ())
    subscribeSingleInvoice =
      $(grpcSubscribe)
        (RPC :: RPC LnGRPC.Invoices "subscribeSingleInvoice")

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
    subscribeInvoices =
      $(grpcSubscribe)
        (RPC :: RPC LnGRPC.Lightning "subscribeInvoices")

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
    openChannel =
      $(grpcSubscribe)
        (RPC :: RPC LnGRPC.Lightning "openChannel")

    openChannelSync ::
      $(tcc m) =>
      LndEnv ->
      OpenChannelRequest ->
      $(pure m) (Either LndError ChannelPoint)
    openChannelSync =
      $(grpcSync) (RPC :: RPC LnGRPC.Lightning "openChannelSync")

    listChannels ::
      $(tcc m) =>
      LndEnv ->
      ListChannelsRequest ->
      $(pure m) (Either LndError [Channel])
    listChannels env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listChannels")
          env

    listInvoices ::
      $(tcc m) =>
      LndEnv ->
      ListInvoiceRequest ->
      $(pure m) (Either LndError ListInvoiceResponse)
    listInvoices env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listInvoices")
          env

    closedChannels ::
      $(tcc m) =>
      LndEnv ->
      ClosedChannelsRequest ->
      $(pure m) (Either LndError [ChannelCloseSummary])
    closedChannels env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "closedChannels")
          env

    closeChannel ::
      $(tcc m) =>
      (CloseStatusUpdate -> IO ()) ->
      LndEnv ->
      CloseChannelRequest ->
      $(pure m) (Either LndError ())
    closeChannel =
      $(grpcSubscribe)
        (RPC :: RPC LnGRPC.Lightning "closeChannel")

    listPeers ::
      $(tcc m) =>
      LndEnv ->
      $(pure m) (Either LndError [Peer])
    listPeers env =
      $(grpcRetry) $
        $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "listPeers")
          env
          (defMessage :: LnGRPC.ListPeersRequest)

    connectPeer ::
      $(tcc m) =>
      LndEnv ->
      ConnectPeerRequest ->
      $(pure m) (Either LndError ())
    connectPeer env =
      $(grpcRetry)
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
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "sendPaymentSync")
          env

    subscribeHtlcEvents ::
      $(tcc m) =>
      (HtlcEvent -> IO ()) ->
      LndEnv ->
      $(pure m) (Either LndError ())
    subscribeHtlcEvents handler env =
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
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "decodePayReq")
          env

    lookupInvoice ::
      $(tcc m) =>
      LndEnv ->
      RHash ->
      $(pure m) (Either LndError Invoice)
    lookupInvoice env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "lookupInvoice")
          env

    trackPaymentV2 ::
      $(tcc m) =>
      (Payment -> IO ()) ->
      LndEnv ->
      TrackPaymentRequest ->
      $(pure m) (Either LndError ())
    trackPaymentV2 =
      $(grpcSubscribe)
        (RPC :: RPC LnGRPC.Router "trackPaymentV2")

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
      $(grpcRetry) $
        $(grpcSync)
          (RPC :: RPC LnGRPC.Lightning "pendingChannels")
          env
          (defMessage :: LnGRPC.PendingChannelsRequest)

    signMessage ::
      $(tcc m) =>
      LndEnv ->
      SignMessageRequest ->
      $(pure m) (Either LndError SignMessageResponse)
    signMessage env =
      $(grpcRetry)
        . $(grpcSync)
          (RPC :: RPC LnGRPC.Signer "signMessage")
          env

    verifyMessage ::
      $(tcc m) =>
      LndEnv ->
      VM.VerifyMessageRequest ->
      $(pure m) (Either LndError VM.VerifyMessageResponse)
    verifyMessage env =
      $(grpcRetry)
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
