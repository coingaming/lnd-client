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
    ToGrpc a gA,
    FromGrpc b gB,
    HasMethod s rm,
    gA ~ MethodInput s rm,
    gB ~ MethodOutput s rm
  ) =>
  PL.RPC s (rm :: Symbol) ->
  LndEnv ->
  a ->
  m (Either LndError b)
grpcSyncSilent rpc env req =
  case toGrpc req of
    Right gReq -> join . second fromGrpc <$> runUnary rpc env gReq
    Left err -> return $ Left err

grpcSyncKatip ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB,
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
    ToGrpc a gA,
    FromGrpc b gB,
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
  case toGrpc req of
    Right grpcReq -> second (const ()) <$> runStreamServer rpc env grpcReq gHandler
    Left err -> return $ Left err
  where
    gHandler _ x =
      case fromGrpc x of
        Right b -> liftIO $ handler b
        Left _ -> return ()

grpcSubscribeKatip ::
  ( MonadIO m,
    KatipContext m,
    ToGrpc a gA,
    FromGrpc b gB,
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
      katipAddContext (sl "ElapsedSeconds" (showElapsedSeconds ts))
        $ uncurry katipAddContext
        $ case res of
          Left e ->
            ( sl "RpcResponse" (show e :: Text),
              $(logTM) (newSeverity env ErrorS (Just ts) (Just e)) "RPC failed"
            )
          Right x ->
            ( sl "RpcResponse" (show x :: Text),
              $(logTM) (newSeverity env InfoS (Just ts) Nothing) "RPC succeded"
            )
      pure res
