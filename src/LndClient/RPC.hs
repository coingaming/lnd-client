{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.RPC
  ( unlockWallet,
    newAddress,
    addInvoice,
    initWallet,
    openChannel,
    getPeers,
    connectPeer,
    sendPayment,
    getInfo,
    subscribeInvoices,
    RPCResponse (..),
    coerceRPCResponse,
    maybeRPCResponse,
  )
where

import Chronos (SubsecondPrecision (SubsecondPrecisionAuto), encodeTimespan, stopwatch)
import Control.Concurrent.Thread.Delay (delay)
import qualified Data.Conduit.List as CL
import Data.Text as T (pack)
import Katip (KatipContext, Severity (..), katipAddContext, logStr, logTM, sl)
import LndClient.Class
import LndClient.Data.AddInvoice as AddInvoice
  ( AddInvoiceRequest (..),
    AddInvoiceResponse (..),
  )
import LndClient.Data.GetInfo
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..))
import LndClient.Data.LndEnv
  ( LndB64WalletPassword (..),
    LndEnv (..),
    LndHexMacaroon (..),
    LndTlsManagerBuilder (..),
    LndUrl (..),
  )
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.Newtypes
import LndClient.Data.OpenChannel (ChannelPoint (..), OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), PeerList (..))
import LndClient.Data.SendPayment as SendPayment (SendPaymentRequest (..), SendPaymentResponse (..))
import LndClient.Data.SubscribeInvoices as SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.Types
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Data.Void (VoidRequest (..), VoidResponse (..))
import LndClient.Import.External
import LndClient.Utils (coerceLndResult, doExpBackOff)
import qualified LndGrpc as GRPC
import Network.GRPC.HighLevel.Generated
import Network.HTTP.Client
  ( RequestBody (RequestBodyLBS),
    Response (..),
    httpLbs,
    method,
    parseRequest,
    queryString,
    requestBody,
    requestHeaders,
    responseStatus,
    responseTimeout,
    responseTimeoutNone,
  )
import Network.HTTP.Simple (httpSink, setRequestManager)
import Network.HTTP.Types.Method (StdMethod (..), renderStdMethod)
import Network.HTTP.Types.Status (ok200, status404, statusCode)
import Network.HTTP.Types.URI (Query, renderQuery)
import Proto3.Suite.Class

newtype RPCResponse a
  = RPCResponse (Response (Either String a))
  deriving (Show)

data RpcName
  = UnlockWallet
  | NewAddress
  | AddInvoice
  | InitWallet
  | SubscribeInvoices
  | OpenChannel
  | GetPeers
  | ConnectPeer
  | GetInfo
  | SendPayment
  deriving (Generic)

instance ToJSON RpcName

data RpcArgs a b m
  = RpcArgs
      { rpcEnv :: LndEnv,
        rpcMethod :: StdMethod,
        rpcUrlPath :: String,
        rpcUrlQuery :: Query,
        rpcReqBody :: Maybe a,
        rpcRetryAttempt :: Int,
        rpcSuccessCond :: RPCResponse b -> Bool,
        rpcName :: RpcName,
        rpcSubHandler :: Maybe (ByteString -> m ())
      }

maybeRPCResponse :: LndResult (RPCResponse a) -> Maybe a
maybeRPCResponse res0 =
  case res0 of
    LndSuccess _ (RPCResponse res1) ->
      case responseBody res1 of
        Right res2 -> Just res2
        _ -> Nothing
    _ -> Nothing

coerceRPCResponse :: (Show a, MonadIO m) => LndResult (RPCResponse a) -> m a
coerceRPCResponse x = do
  RPCResponse y <- coerceLndResult x
  case responseBody y of
    Left e -> liftIO $ fail e
    Right z -> return z

rpc ::
  (ToJSON a, FromJSON b, KatipContext m, MonadUnliftIO m) =>
  RpcArgs a b m ->
  m (LndResult (RPCResponse b))
rpc
  RpcArgs
    { rpcEnv,
      rpcMethod,
      rpcUrlPath,
      rpcUrlQuery,
      rpcReqBody,
      rpcRetryAttempt,
      rpcSuccessCond,
      rpcName,
      rpcSubHandler
    } =
    katipAddContext (sl "rpcName" rpcName) $ do
      $(logTM) InfoS "is running..."
      this <- doExpBackOff rpcRetryAttempt rpcSuccessCond expr
      case this of
        (LndSuccess et _) ->
          $(logTM) InfoS
            $ logStr
            $ "succeeded, elapsed time = "
              <> showElapsedTime et
              <> " seconds"
        (LndFail et (RPCResponse res)) ->
          $(logTM) ErrorS
            $ logStr
            $ "failed with HTTP status "
              <> (T.pack . show . statusCode . responseStatus $ res)
              <> ", elapsed time = "
              <> showElapsedTime et
              <> " seconds"
        (LndGrpcParserFail et e) ->
          $(logTM) ErrorS
            $ logStr
            $ "failed with LndGrpcParserFail "
              <> T.pack (show e)
              <> ", elapsed time = "
              <> showElapsedTime et
              <> " seconds"
        (LndHttpException et e) ->
          $(logTM) ErrorS
            $ logStr
            $ "failed with HttpException "
              <> T.pack (show e)
              <> ", elapsed time = "
              <> showElapsedTime et
              <> " seconds"
      return this
    where
      showElapsedTime = encodeTimespan SubsecondPrecisionAuto
      expr = do
        req0 <- liftIO $ parseRequest $ coerce (envLndUrl rpcEnv) <> rpcUrlPath
        let req1 =
              req0
                { method = renderStdMethod rpcMethod,
                  queryString = renderQuery False rpcUrlQuery,
                  requestHeaders =
                    [ ("Content-Type", "application/json"),
                      ( "Grpc-Metadata-macaroon",
                        coerce $ envLndHexMacaroon rpcEnv
                      )
                    ]
                }
        let req2 =
              maybe
                req1
                (\b -> req1 {requestBody = RequestBodyLBS $ encode b})
                rpcReqBody
        --liftIO $ print $ encode rpcReqBody
        manager <- liftIO $ coerce $ envLndTlsManagerBuilder rpcEnv
        case rpcSubHandler of
          Nothing -> do
            res <- liftIO $ httpLbs req2 manager
            -- liftIO $ print res
            return $ RPCResponse $ eitherDecode <$> res
          Just subHandler -> do
            let req3 = setRequestManager manager req2
            let req4 = req3 {responseTimeout = responseTimeoutNone}
            httpSink req4 $ \res -> do
              CL.mapM_ subHandler
              return
                $ RPCResponse
                $ Left "subscription don't have response body"
                  <$ res

grpcMeta :: LndEnv -> MetadataMap
grpcMeta env =
  [("macaroon", coerce $ envLndHexMacaroon env)]

initWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  InitWalletRequest ->
  m (LndResult (RPCResponse VoidResponse))
initWallet env req = do
  res <- rpc $ rpcArgs env
  --
  -- NOTE : some LND bullshit - it crashes if other RPC performed after that too soon
  --
  _ <- liftIO $ delay 5000000
  return res
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/initwallet",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = InitWallet,
          rpcSubHandler = Nothing
        }

--
--  TODO : implement recovery_window and channel_backups
--
unlockWallet ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (LndResult (RPCResponse VoidResponse))
unlockWallet env =
  rpc $ rpcArgs env
  where
    rpcReqBody rpcEnv =
      Just
        UnlockWalletRequest
          { walletPassword = coerce $ envLndB64WalletPassword rpcEnv,
            recoveryWindow = 0
          }
    rpcSuccessCond (RPCResponse res) =
      let ss = responseStatus res in ss == ok200 || ss == status404
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/unlockwallet",
          rpcUrlQuery = [],
          rpcReqBody = rpcReqBody rpcEnv,
          rpcRetryAttempt = 5,
          rpcSuccessCond,
          rpcName = UnlockWallet,
          rpcSubHandler = Nothing
        }

stdRpcCond :: RPCResponse a -> Bool
stdRpcCond (RPCResponse res) =
  (responseStatus res == ok200) && isRight (responseBody res)

newAddress ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (LndResult (RPCResponse NewAddressResponse))
newAddress env = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/newaddress",
          rpcUrlQuery = [("type", Just "1")],
          rpcReqBody = Nothing :: Maybe VoidRequest,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = NewAddress,
          rpcSubHandler = Nothing
        }

--
-- TODO
-- better generic utils for request/parsing
-- handle exceptions
-- fix RHash type
-- fix PaymentRequest type
-- rm RPCResponse (we don't have HTTP-related low level details anymore)
--
addInvoice ::
  (MonadIO m) =>
  LndEnv ->
  AddInvoiceRequest ->
  m (LndResult AddInvoiceResponse)
addInvoice env req =
  liftIO $ case toGrpc req of
    Left e ->
      --
      -- TODO : remove fail everywhere, don't throw exceptions
      -- work with pure values
      --
      fail $ show e
    Right grpcReq ->
      --
      -- TODO : maybe make generic helper if possible
      --
      withGRPCClient (envLndGrpcConfig env) $ \client -> do
        method <- GRPC.lightningAddInvoice <$> GRPC.lightningClient client
        (ts, rawGrpc) <-
          stopwatch . method $ ClientNormalRequest grpcReq 1 $ grpcMeta env
        case rawGrpc of
          --
          -- TODO : patterns here are not exhaustive and compiler don't warn about it
          -- for some reason. Investigate and/or fix
          --
          ClientNormalResponse grpcRes _ _ _ _ ->
            case fromGrpc grpcRes of
              Left e -> fail $ show e
              Right res -> return $ LndSuccess ts res
          ClientErrorResponse err -> do
            print err
            fail "ClientErrorResponse"

subscribeInvoices ::
  (MonadIO m) =>
  LndEnv ->
  SubscribeInvoicesRequest ->
  --
  -- TODO : replace IO with m if possible
  --
  (Invoice -> IO ()) ->
  m (LndResult ())
subscribeInvoices env req invoiceHandler =
  liftIO $ withGRPCClient (envLndGrpcConfig env) $ \client -> do
    method <- GRPC.lightningSubscribeInvoices <$> GRPC.lightningClient client
    (ts, rawGrpc) <-
      stopwatch . method $
        ClientReaderRequest grpcReq 3600 (grpcMeta env) (\_ _ s -> streamHandler s)
    case rawGrpc of
      ClientReaderResponse {} ->
        return $ LndFail ts ()
      ClientErrorResponse err -> do
        print err
        fail "ClientErrorResponse"
  where
    streamHandler stream = do
      msg <- stream
      case msg of
        Left e -> fail $ "SubscribeInvoices error " <> show e
        Right Nothing -> fail "SubscribeInvoices got Nothing"
        Right (Just i) -> do
          --
          -- TODO : handle all fields and types overflow
          --
          invoiceHandler $
            Invoice
              { rHash = RHash $ GRPC.invoiceRHash i,
                amtPaidSat =
                  Just . MoneyAmount $ fromIntegral $ GRPC.invoiceAmtPaidSat i,
                creationDate = Nothing,
                settleDate = Nothing,
                value = MoneyAmount $ fromIntegral $ GRPC.invoiceValue i,
                expiry = Nothing,
                settled = Nothing,
                settleIndex = Nothing,
                descriptionHash = Nothing,
                memo = Nothing,
                paymentRequest = Nothing,
                fallbackAddr = Nothing,
                cltvExpiry = Nothing,
                private = Nothing,
                addIndex = AddIndex $ GRPC.invoiceAddIndex i,
                state = Nothing
              }
          streamHandler stream
    grpcReq :: GRPC.InvoiceSubscription
    grpcReq =
      def
        { GRPC.invoiceSubscriptionAddIndex =
            maybe def coerce $ SubscribeInvoices.addIndex req,
          GRPC.invoiceSubscriptionSettleIndex =
            maybe def coerce $ SubscribeInvoices.settleIndex req
        }

openChannel ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  OpenChannelRequest ->
  m (LndResult (RPCResponse ChannelPoint))
openChannel env req = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/channels",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = OpenChannel,
          rpcSubHandler = Nothing
        }

getPeers ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (LndResult (RPCResponse PeerList))
getPeers env = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/peers",
          rpcUrlQuery = [],
          rpcReqBody = Nothing :: Maybe VoidRequest,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = GetPeers,
          rpcSubHandler = Nothing
        }

connectPeer ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  ConnectPeerRequest ->
  m (LndResult (RPCResponse VoidResponse))
connectPeer env req = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/peers",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = ConnectPeer,
          rpcSubHandler = Nothing
        }

getInfo ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  m (LndResult (RPCResponse GetInfoResponse))
getInfo env = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/getinfo",
          rpcUrlQuery = [],
          rpcReqBody = Nothing :: Maybe VoidRequest,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = GetInfo,
          rpcSubHandler = Nothing
        }

sendPayment ::
  (MonadIO m) =>
  LndEnv ->
  SendPaymentRequest ->
  m (LndResult SendPaymentResponse)
sendPayment env req =
  liftIO $ case toGrpc req of
    Left e ->
      --
      -- TODO : remove fail everywhere, don't throw exceptions
      -- work with pure values
      --
      fail $ show e
    Right grpcReq ->
      --
      -- TODO : maybe make generic helper if possible
      --
      withGRPCClient (envLndGrpcConfig env) $ \client -> do
        method <- GRPC.lightningSendPaymentSync <$> GRPC.lightningClient client
        (ts, rawGrpc) <-
          stopwatch . method $ ClientNormalRequest grpcReq 1 $ grpcMeta env
        case rawGrpc of
          --
          -- TODO : patterns here are not exhaustive and compiler don't warn about it
          -- for some reason. Investigate and/or fix
          --
          ClientNormalResponse grpcRes _ _ _ _ ->
            case fromGrpc grpcRes of
              Left e -> fail $ show e
              Right res -> return $ LndSuccess ts res
          ClientErrorResponse err -> do
            print err
            fail "ClientErrorResponse"
