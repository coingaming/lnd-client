{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell #-}

module LndClient.RPC
  ( unlockWallet,
    newAddress,
    addInvoice,
    initWallet,
    openChannel,
    getPeers,
    connectPeer,
    subscribeInvoices,
    RPCResponse (..),
    coerceRPCResponse,
    maybeRPCResponse,
  )
where

import Control.Concurrent.Thread.Delay (delay)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Data.Aeson (FromJSON, ToJSON, eitherDecode, encode)
import Data.ByteString (ByteString)
import Data.ByteString.Lazy (fromStrict)
import Data.Coerce (coerce)
import qualified Data.Conduit.List as CL
import Data.Either (isRight)
import Data.Text.Encoding (encodeUtf8)
import GHC.Generics (Generic)
import Katip
  ( KatipContext,
    Severity (..),
    katipAddContext,
    logStr,
    logTM,
    sl,
  )
import LndClient.Data.AddInvoice (AddInvoiceRequest (..), AddInvoiceResponse (..))
import LndClient.Data.InitWallet (InitWalletRequest (..))
import LndClient.Data.Invoice (Invoice (..), ResultWrapper (..))
import LndClient.Data.LndEnv
  ( LndB64WalletPassword (..),
    LndEnv (..),
    LndHexMacaroon (..),
    LndTlsManagerBuilder (..),
    LndUrl (..),
  )
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (ChannelPoint (..), OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), PeerList (..))
import LndClient.Data.SubscribeInvoices as SubscribeInvoices (SubscribeInvoicesRequest (..))
import LndClient.Data.Types
import LndClient.Data.UnlockWallet (UnlockWalletRequest (..))
import LndClient.Data.Void (VoidRequest (..), VoidResponse (..))
import LndClient.Utils (coerceLndResult, doExpBackOff)
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
import UnliftIO

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
    LndSuccess (RPCResponse res1) ->
      case responseBody res1 of
        Right res2 -> Just res2
        _ -> Nothing
    _ -> Nothing

coerceRPCResponse :: (Show a, MonadIO m) => LndResult (RPCResponse a) -> m a
coerceRPCResponse x = do
  RPCResponse y <- coerceLndResult x
  case responseBody y of
    Left e -> fail e
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
        (LndSuccess _) -> $(logTM) InfoS "succeeded"
        (LndFail (RPCResponse res)) ->
          $(logTM) ErrorS
            $ logStr
            $ "failed with HTTP status "
              <> (show . statusCode . responseStatus $ res)
        (LndHttpException e) ->
          $(logTM) ErrorS $ logStr $ "failed with HttpException " <> show e
      return this
    where
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
        liftIO $ print $ encode rpcReqBody
        manager <- liftIO $ coerce $ envLndTlsManagerBuilder rpcEnv
        case rpcSubHandler of
          Nothing -> do
            res <- liftIO $ httpLbs req2 manager
            liftIO $ print res
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

addInvoice ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  AddInvoiceRequest ->
  m (LndResult (RPCResponse AddInvoiceResponse))
addInvoice env req = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = POST,
          rpcUrlPath = "/v1/invoices",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = AddInvoice,
          rpcSubHandler = Nothing
        }

subscribeInvoices ::
  (KatipContext m, MonadUnliftIO m) =>
  LndEnv ->
  SubscribeInvoicesRequest ->
  (Invoice -> m ()) ->
  m (LndResult (RPCResponse VoidResponse))
subscribeInvoices env req invoiceHandler = rpc $ rpcArgs env
  where
    query =
      [ ("add_index", SubscribeInvoices.addIndex),
        ("settle_index", SubscribeInvoices.settleIndex)
      ]
        >>= (\(t, f) -> maybe [] (\x -> [(t, Just $ encodeUtf8 x)]) $ f req)
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/invoices/subscribe",
          rpcUrlQuery = query,
          rpcReqBody = Nothing :: Maybe VoidRequest,
          rpcRetryAttempt = 0,
          rpcSuccessCond = stdRpcCond,
          rpcName = SubscribeInvoices,
          rpcSubHandler = Just subHandler
        }
    subHandler x = case eitherDecode $ fromStrict x of
      Left e ->
        $(logTM) ErrorS $ logStr $ "failed to parse subscription invoice " <> e
      Right (ResultWrapper (i :: Invoice)) -> invoiceHandler i

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
  VoidRequest ->
  m (LndResult (RPCResponse PeerList))
getPeers env req = rpc $ rpcArgs env
  where
    rpcArgs rpcEnv =
      RpcArgs
        { rpcEnv,
          rpcMethod = GET,
          rpcUrlPath = "/v1/peers",
          rpcUrlQuery = [],
          rpcReqBody = Just req,
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
