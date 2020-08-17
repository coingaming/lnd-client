{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.TestApp
  ( Env (..),
    runApp,
    runApp_,
    liftLndResult,
    customerNodeLocation,
    merchantNodeLocation,
    spawnLinkDelayed_,
    syncWallets,
    mine6_,
    newEnv,
    deleteEnv,
    setupEnv,
  )
where

import LndClient.Data.ChannelPoint as ChannelPoint (ChannelPoint (..))
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..))
import LndClient.Data.SubscribeChannelEvents (ChannelEventUpdate (..))
import LndClient.Import
import LndClient.RPC
import LndClient.TestOrphan ()
import qualified LndGrpc as GRPC
import Network.Bitcoin as BTC (Client, getClient)
import Network.Bitcoin.Mining (generateToAddress)
import Network.GRPC.HighLevel.Generated

liftLndResult :: (MonadIO m) => Either LndError a -> m a
liftLndResult (Right x) = return x
liftLndResult (Left x) = liftIO $ fail $ "liftLndResult failed " <> show x

customerNodeLocation :: NodeLocation
customerNodeLocation = NodeLocation "localhost:9734"

merchantNodeLocation :: NodeLocation
merchantNodeLocation = NodeLocation "localhost:9735"

data Env
  = Env
      { envLndMerchant :: LndEnv,
        envLndCustomer :: LndEnv,
        envBtcClient :: BTC.Client,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv,
        envMerchantCQ :: TChan ChannelEventUpdate,
        envCustomerCQ :: TChan ChannelEventUpdate
      }

custEnv :: LndEnv -> LndEnv
custEnv x =
  x
    { envLndGrpcConfig =
        (envLndGrpcConfig x)
          { clientServerPort = 11009
          },
      envLndCipherSeedMnemonic =
        CipherSeedMnemonic
          [ "absent",
            "betray",
            "direct",
            "scheme",
            "sunset",
            "mechanic",
            "exhaust",
            "suggest",
            "boy",
            "arena",
            "sketch",
            "bone",
            "news",
            "south",
            "way",
            "survey",
            "clip",
            "dutch",
            "depart",
            "green",
            "furnace",
            "wire",
            "wave",
            "fall"
          ],
      envLndAezeedPassphrase = Nothing
    }

readEnv :: KatipContextT IO Env
readEnv = do
  le <- getLogEnv
  ctx <- getKatipContext
  ns <- getKatipNamespace
  lndEnv <- liftIO readLndEnv
  bc <- liftIO newBtcClient
  mcq <- atomically newBroadcastTChan
  ccq <- atomically newBroadcastTChan
  return
    Env
      { envLndMerchant = lndEnv,
        envLndCustomer = custEnv lndEnv,
        envBtcClient = bc,
        envKatipLE = le,
        envKatipCTX = ctx,
        envKatipNS = ns,
        envMerchantCQ = mcq,
        envCustomerCQ = ccq
      }

runKatip :: KatipContextT IO a -> IO a
runKatip x = do
  handleScribe <-
    mkHandleScribeWithFormatter
      bracketFormat
      ColorIfTerminal
      stdout
      (permitItem DebugS)
      V2
  le <-
    registerScribe "stdout" handleScribe defaultScribeSettings
      =<< initLogEnv "LndClient" "test"
  runKatipContextT le (mempty :: LogContexts) mempty x

newEnv :: IO Env
newEnv = do
  env <- runKatip readEnv
  let merchantEnv = envLndMerchant env
  let customerEnv = envLndCustomer env
  let merchantCQ = envMerchantCQ env
  let customerCQ = envCustomerCQ env
  runApp env $ do
    --
    -- Init wallets
    --
    void $ liftLndResult =<< lazyInitWallet merchantEnv
    void $ liftLndResult =<< lazyInitWallet customerEnv
    --
    -- TODO : move waitForGrpc to init/unlock wallet
    --
    liftLndResult =<< waitForGrpc env
    liftIO $ mine_ 101 env
    --
    -- Connect Customer to Merchant
    --
    GetInfoResponse merchantPubKeyHex _ _ <-
      liftLndResult =<< getInfo merchantEnv
    let connectPeerRequest =
          ConnectPeerRequest
            { addr =
                LightningAddress
                  { pubkey = merchantPubKeyHex,
                    host = merchantNodeLocation
                  },
              perm = False
            }
    void $ liftLndResult =<< lazyConnectPeer customerEnv connectPeerRequest
    --
    -- Subscribe to channel events
    --
    void . spawnLink $
      liftLndResult =<< subscribeChannelEventsQ (pure merchantCQ) merchantEnv
    void . spawnLink $
      liftLndResult =<< subscribeChannelEventsQ (pure customerCQ) customerEnv
  delay 3000000
  return env

deleteEnv :: Env -> IO ()
deleteEnv = void . closeScribes . envKatipLE

newBtcClient :: IO BTC.Client
newBtcClient =
  getClient
    "http://localhost:18443"
    "developer"
    "developer"

mine_ :: Int -> Env -> IO ()
mine_ x env = do
  NewAddressResponse btcAddress <-
    runApp env $
      liftLndResult
        =<< newAddress
          (envLndCustomer env)
          GRPC.AddressTypeWITNESS_PUBKEY_HASH
  void $ generateToAddress (envBtcClient env) x (toStrict btcAddress) Nothing
  runApp_ env $ liftLndResult =<< syncWallets env
  return ()

mine6_ :: Env -> IO ()
mine6_ = mine_ 6

setupEnv :: Env -> IO ()
setupEnv env = runApp env $ do
  --
  -- Initialize closing channels procedure
  --
  cs <-
    liftLndResult
      =<< listChannels
        customerEnv
        (ListChannelsRequest False False False False Nothing)
  let cps = LC.channelPoint <$> cs
  cpxs <-
    mapM
      ( \cp -> do
          x <- newEmptyMVar
          return (cp, x)
      )
      cps
  liftIO $
    mapM_
      ( \(cp, x) ->
          spawnLink $ runApp env $
            closeChannel
              --
              -- TODO : investigate why it throws empty gRPC
              -- response error and as consequence
              -- probably it's how subscription terminates
              -- when channel is completely closed
              --
              --(const $ return ())
              (liftIO . putMVar x)
              (envLndMerchant env)
              (CloseChannelRequest cp False Nothing Nothing Nothing)
      )
      cpxs
  --
  -- Give some time for closeChannel processes to be spawned
  -- Give Customer some money to operate
  -- And wait for every channel to be closed
  --
  liftIO $ do
    delay 3000000
    mine6_ env
    mapM_ (\(_, x) -> takeMVar x) cpxs
  --
  -- Open channel from Customer to Merchant
  --
  GetInfoResponse merchantPubKeyHex _ _ <-
    liftLndResult =<< getInfo merchantEnv
  merchantPubKey <-
    liftMaybe "Can't decode hex pub key" $ unHexPubKey merchantPubKeyHex
  let openChannelRequest =
        OpenChannelRequest
          { nodePubkey = merchantPubKey,
            localFundingAmount = MoneyAmount 20000,
            pushSat = Just $ MoneyAmount 1000,
            targetConf = Nothing,
            satPerByte = Nothing,
            private = Nothing,
            minHtlcMsat = Nothing,
            remoteCsvDelay = Nothing,
            minConfs = Nothing,
            spendUnconfirmed = Nothing,
            closeAddress = Nothing
          }
  runApp env $ do
    cp <- liftLndResult =<< openChannelSync (envLndCustomer env) openChannelRequest
    cq <- atomically $ dupTChan $ envCustomerCQ env
    liftIO $ mine6_ env
    liftLndResult =<< waitForActiveChannel cp cq
  where
    merchantEnv = envLndMerchant env
    customerEnv = envLndCustomer env

newtype AppM m a
  = AppM
      { unAppM :: ReaderT Env m a
      }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Env)

instance (MonadUnliftIO m) => MonadUnliftIO (AppM m) where
  askUnliftIO =
    AppM (fmap (\(UnliftIO run) -> UnliftIO (run . unAppM)) askUnliftIO)
  withRunInIO go = AppM (withRunInIO (\k -> go (k . unAppM)))

instance (MonadIO m) => Katip (AppM m) where
  getLogEnv = asks envKatipLE
  localLogEnv f (AppM m) =
    AppM (local (\s -> s {envKatipLE = f (envKatipLE s)}) m)

instance (MonadIO m) => KatipContext (AppM m) where
  getKatipContext = asks envKatipCTX
  localKatipContext f (AppM m) =
    AppM (local (\s -> s {envKatipCTX = f (envKatipCTX s)}) m)
  getKatipNamespace = asks envKatipNS
  localKatipNamespace f (AppM m) =
    AppM (local (\s -> s {envKatipNS = f (envKatipNS s)}) m)

runApp :: Env -> AppM m a -> m a
runApp env app = runReaderT (unAppM app) env

runApp_ :: (Functor m) => Env -> AppM m a -> m ()
runApp_ env app = void $ runApp env app

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> return x
    Nothing -> liftIO $ fail msg

spawnLinkDelayed_ :: (MonadUnliftIO m) => m a -> m ()
spawnLinkDelayed_ x = do
  void $ spawnLink x
  -- give process some time to spawn
  liftIO $ delay 3000000
  return ()

waitForActiveChannel ::
  KatipContext m =>
  ChannelPoint ->
  TChan ChannelEventUpdate ->
  m (Either LndError ())
waitForActiveChannel cp cq = do
  x <- readTChanTimeout (MicroSecondsDelay 30000000) cq
  case channelEvent <$> x of
    Just (GRPC.ChannelEventUpdateChannelActiveChannel gcp) ->
      if Right cp == fromGrpc gcp
        then return $ Right ()
        else waitForActiveChannel cp cq
    Just _ ->
      waitForActiveChannel cp cq
    Nothing ->
      return . Left $ TChanTimeout "waitForActiveChannel"

waitForGrpc ::
  (KatipContext m) =>
  Env ->
  m (Either LndError ())
waitForGrpc env = do
  $(logTM) InfoS "Waiting for GRPC ..."
  resMerchant <- getInfo (envLndMerchant env)
  resCustomer <- getInfo (envLndCustomer env)
  --
  -- TODO : remove infinite recursion
  --
  if isRight $ (,) <$> resMerchant <*> resCustomer
    then return $ Right ()
    else liftIO (delay 1000000) >> waitForGrpc env

syncWallets ::
  (KatipContext m) =>
  Env ->
  m (Either LndError ())
syncWallets env = do
  $(logTM) InfoS "Wallet sync ..."
  resMerchant <- getInfo (envLndMerchant env)
  resCustomer <- getInfo (envLndCustomer env)
  case (,) <$> resMerchant <*> resCustomer of
    Left _ ->
      --
      -- TODO : remove infinite recursion
      --
      liftIO (delay 1000000) >> syncWallets env
    Right (x, y) ->
      if syncedToChain x
        --
        -- TODO : add condition for empty channel/peer list (expected False there)
        --
        -- && (syncedToGraph x)
        -- && (syncedToGraph y)
        && (syncedToChain y)
        then return $ Right ()
        else liftIO (delay 1000000) >> syncWallets env
