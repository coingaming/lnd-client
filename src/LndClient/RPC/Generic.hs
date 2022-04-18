{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeApplications #-}

module LndClient.RPC.Generic
  ( grpcSyncSilent,
    grpcSyncKatip,
    grpcSubscribeSilent,
    grpcSubscribeKatip,
    RpcName (..),
  )
where

import Data.ProtoLens.Service.Types (HasMethod, HasMethodImpl (..))
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
  | SendCoins
  | WaitForGrpc
  | DecodePayReq
  | LookupInvoice
  | EnsureHodlInvoice
  | TrackPaymentV2
  | PendingChannels
  | ClosedChannels
  | ListInvoices
  | SubscribeSingleInvoice
  | CloseChannelSync
  deriving stock (Generic)

instance ToJSON RpcName

instance Out RpcName

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds =
  encodeTimespan SubsecondPrecisionAuto

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
    Right gReq ->
      join
        . second fromGrpc
        <$> runUnary rpc env gReq
    Left e ->
      pure $ Left e

grpcSyncKatip ::
  forall m a gA b gB s rm.
  ( KatipContext m,
    MonadUnliftIO m,
    ToGrpc a gA,
    FromGrpc b gB,
    KnownNat (SecretRpc rm),
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm,
    Out a,
    Out b,
    Out gA,
    Out gB
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncKatip rpc env req =
  katipAddLndPublic env LndMethod (GHC.symbolVal rpc) $
    katipAddLndSecret @rm env LndRequest req $
      katipAddLndLoc env $ do
        (ts, gRes) <-
          withRunInIO $ \run -> stopwatch $
            case toGrpc req of
              Right gReq -> run $
                katipAddLndSecret @rm env LndRequestGrpc gReq $ do
                  $(logTM) (newSev env DebugS) rpcRunning
                  runUnary rpc env gReq
              Left e ->
                pure $ Left e
        katipAddLndSecret @rm env LndResponseGrpc gRes $
          katipAddLndPublic env LndElapsedSeconds (showElapsedSeconds ts) $
            case gRes >>= fromGrpc of
              Left e ->
                katipAddLndPublic env LndResponse e $ do
                  $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) rpcFailed
                  pure $ Left e
              Right x ->
                katipAddLndSecret @rm env LndResponse x $ do
                  $(logTM) (newSeverity env DebugS (Just ts) Nothing) rpcSucceeded
                  pure $ Right x

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
    Right grpcReq ->
      second (const ())
        <$> runStreamServer rpc env grpcReq gHandler
    Left e ->
      return $ Left e
  where
    gHandler _ x =
      case fromGrpc x of
        Right b -> liftIO $ handler b
        Left _ -> return ()

grpcSubscribeKatip ::
  forall m a gA b gB s rm.
  ( KatipContext m,
    MonadUnliftIO m,
    ToGrpc a gA,
    FromGrpc b gB,
    KnownNat (SecretRpc rm),
    HasMethod s rm,
    Out a,
    Out b,
    Out gA,
    Out gB,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: GHC.Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeKatip rpc handler env req =
  katipAddLndPublic env LndMethod (GHC.symbolVal rpc) $
    katipAddLndSecret @rm env LndRequest req $
      katipAddLndLoc env $ do
        (ts, gRes) <-
          withRunInIO $ \run -> stopwatch $
            case toGrpc req of
              Right gReq -> run $
                katipAddLndSecret @rm env LndRequestGrpc gReq $ do
                  $(logTM) (newSev env DebugS) rpcRunning
                  runStreamServer rpc env gReq $ \_ gRes -> liftIO . run $ gHandler gRes
              Left e ->
                pure $ Left e
        katipAddLndSecret @rm env LndResponseGrpc gRes $
          katipAddLndPublic env LndElapsedSeconds (showElapsedSeconds ts) $
            case gRes of
              Left e -> do
                katipAddLndPublic env LndResponse e $
                  $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) rpcFailed
                pure $ Left e
              Right x -> do
                katipAddLndSecret @rm env LndResponse x $
                  $(logTM) (newSeverity env DebugS (Just ts) Nothing) rpcSucceeded
                pure $ Right ()
  where
    gHandler gRes =
      katipAddLndSecret @rm env LndResponseGrpcSub gRes $
        case fromGrpc gRes of
          Left e ->
            katipAddLndPublic env LndResponseSub e $
              $(logTM) (newSeverity env ErrorS Nothing (Just e)) rpcFailed
          Right x ->
            katipAddLndSecret @rm env LndResponseSub x $ do
              $(logTM) (newSev env DebugS) rpcRunning
              (ts, ()) <- liftIO . stopwatch $ handler x
              katipAddLndPublic env LndElapsedSecondsSub (showElapsedSeconds ts) $
                $(logTM) (newSeverity env DebugS (Just ts) Nothing) rpcSucceeded
