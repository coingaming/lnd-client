{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
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
import GHC.TypeLits
import qualified LndClient.Class2 as C2
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

showElapsedSeconds :: Timespan -> Text
showElapsedSeconds = fromStrict . encodeTimespan SubsecondPrecisionAuto

grpcSyncSilent ::
  ( MonadIO m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncSilent rpc env req =
  case C2.toGrpc req of
    Right gReq -> join . second C2.fromGrpc <$> runUnary rpc env gReq
    Left err -> return $ Left err

grpcSyncKatip ::
  ( MonadIO m,
    KatipContext m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm,
    Show a,
    Show b
  ) =>
  PL.RPC s (rm :: Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncKatip rpc env req =
  katipAddContext (sl "RpcName" (T.pack $ symbolVal rpc))
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $
          grpcSyncSilent rpc env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res

grpcSubscribeSilent ::
  ( MonadIO m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeSilent rpc handler env req =
  case C2.toGrpc req of
    Right grpcReq -> do
      res <- runStreamServer rpc env grpcReq gHandler
      case res of
        Left err -> return $ Left err
        Right _ -> return $ Right ()
    Left err -> return $ Left err
  where
    gHandler _ x =
      case C2.fromGrpc x of
        Right b -> liftIO $ handler b
        Left _ -> return ()

grpcSubscribeKatip ::
  ( MonadIO m,
    KatipContext m,
    C2.ToGrpc a gA,
    C2.FromGrpc b gB,
    HasMethod s rm,
    Show a,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  (b -> IO ()) ->
  LndEnv ->
  a ->
  m (Either LndError ())
grpcSubscribeKatip rpc handler env req =
  katipAddContext (sl "RpcName" (T.pack $ symbolVal rpc))
    $ katipAddContext (sl "RpcRequest" (show req :: Text))
    $ katipAddLndContext env
    $ do
      $(logTM) (newSev env InfoS) "RPC is running"
      (ts, res) <-
        liftIO $ stopwatch $ grpcSubscribeSilent rpc handler env req
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts)) $
        case res of
          Left e ->
            katipAddContext (sl "RpcResponse" (show e :: Text)) $
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
          Right x ->
            katipAddContext (sl "RpcResponse" (show x :: Text)) $
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
      pure res
