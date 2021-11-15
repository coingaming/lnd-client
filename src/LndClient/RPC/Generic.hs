{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.RPC.Generic
  ( grpcSyncSilent,
    grpcSyncKatip,
    grpcSubscribeSilent,
    grpcSubscribeKatip,
    RpcName (..),
  )
where

import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
import qualified Data.Text.Lazy as T
import qualified GHC.TypeLits as GHC
import LndClient.Import
import LndGrpc.Client
import qualified Network.GRPC.HTTP2.ProtoLens as PL

data RpcName
  = UnlockWallet
  | InitWallet
  | LazyUnlockWallet
  | LazyInitWallet
  | NewAddress
  | AddInvoice
  | AddHodlInvoice
  | CancelInvoice
  | SettleInvoice
  | SubscribeInvoices
  | SubscribeChannelEvents
  | SubscribeHtlcEvents
  | OpenChannelSync
  | OpenChannel
  | ListChannels
  | CloseChannel
  | ListPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  | WaitForGrpc
  | DecodePayReq
  | LookupInvoice
  | EnsureHodlInvoice
  | TrackPaymentV2
  | PendingChannels
  | ClosedChannels
  | ListInvoices
  | SubscribeSingleInvoice
  deriving (Generic)

instance ToJSON RpcName

type family SecretRpc (t :: GHC.Symbol) :: GHC.Nat where
--
-- Sync
--
  SecretRpc "unlockWallet" = 1
  SecretRpc "initWallet" = 1
  SecretRpc "newAddress" = 0
  SecretRpc "addInvoice" = 0
  SecretRpc "addHoldInvoice" = 0
  SecretRpc "cancelInvoice" = 0
  SecretRpc "settleInvoice" = 0
  SecretRpc "openChannelSync" = 0
  SecretRpc "listChannels" = 0
  SecretRpc "listPeers" = 0
  SecretRpc "connectPeer" = 0
  SecretRpc "getInfo" = 0
  SecretRpc "sendPaymentSync" = 0
  SecretRpc "decodePayReq" = 0
  SecretRpc "lookupInvoice" = 0
  SecretRpc "pendingChannels" = 0
  SecretRpc "closedChannels" = 0
  SecretRpc "listInvoices" = 0
--
-- Sub
--
  SecretRpc "trackPaymentV2" = 0
  SecretRpc "subscribeHtlcEvents" = 0
  SecretRpc "closeChannel" = 0
  SecretRpc "openChannel" = 0
  SecretRpc "subscribeChannelEvents" = 0
  SecretRpc "subscribeInvoices" = 0
  SecretRpc "subscribeSingleInvoice" = 0

rpcIsSecret :: forall t. GHC.KnownNat (SecretRpc t) => Bool
rpcIsSecret = natVal (Proxy @(SecretRpc t)) > 0

inspectSecret ::
  forall (rpc :: GHC.Symbol) raw.
  ( Out raw,
    KnownNat (SecretRpc rpc)
  ) =>
  LndEnv ->
  raw ->
  Text
inspectSecret env =
  inspect
    . if rpcIsSecret @rpc
      then SecretLog (loggingStrategyVis $ envLndLogStrategy env)
      else PrettyLog

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = encodeTimespan SubsecondPrecisionAuto

grpcSyncSilent ::
  ( MonadUnliftIO m,
    ToGrpc a gA,
    FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncSilent rpc env req =
  case toGrpc req of
    Right gReq -> join . second fromGrpc <$> runUnary rpc env gReq
    Left err -> pure $ Left err

grpcSyncKatip ::
  forall m a gA b gB s rm.
  ( KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB,
    KnownNat (SecretRpc rm),
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm,
    Out a,
    Out b
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncKatip rpc env req =
  katipAddContext (sl "RpcName" (T.pack $ GHC.symbolVal rpc)) $
    katipAddContext (sl "RpcRequest" $ inspectSecret @rm env req) $
      katipAddLndContext env $
        do
          $(logTM) (newSev env DebugS) "RPC is running"
          (ts, res) <-
            liftIO $
              stopwatch $
                grpcSyncSilent rpc env req
          katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
            case res of
              Left e ->
                katipAddContext (sl "RpcResponse" $ inspect e) $
                  $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
              Right x ->
                katipAddContext (sl "RpcResponse" $ inspect x) $
                  $(logTM) (newSeverity env DebugS (Just ts) Nothing) "RPC succeded"
          pure res

grpcSubscribeSilent ::
  ( MonadUnliftIO m,
    ToGrpc a gA,
    FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeSilent rpc handler env req =
  case toGrpc req of
    Right grpcReq -> second (const ()) <$> runStreamServer rpc env grpcReq gHandler
    Left err -> return $ Left err
  where
    gHandler _ x =
      case fromGrpc x of
        Right b -> liftIO $ handler b
        Left _ -> return ()

grpcSubscribeKatip ::
  forall m a gA b gB s rm.
  ( KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB,
    KnownNat (SecretRpc rm),
    HasMethod s rm,
    Out a,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeKatip rpc handler env req =
  katipAddContext (sl "RpcName" (T.pack $ GHC.symbolVal rpc)) $
    katipAddContext (sl "RpcRequest" $ inspectSecret @rm env req) $
      katipAddLndContext env $
        do
          $(logTM) (newSev env DebugS) "RPC is running"
          (ts, res) <-
            liftIO . stopwatch $ grpcSubscribeSilent rpc handler env req
          katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
            uncurry katipAddContext $
              case res of
                Left e ->
                  ( sl "RpcResponse" $ inspect e,
                    $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
                  )
                Right x ->
                  ( sl "RpcResponse" $ inspect x,
                    $(logTM) (newSeverity env DebugS (Just ts) Nothing) "RPC succeded"
                  )
          pure res
