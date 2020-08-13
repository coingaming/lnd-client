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
    withEnv,
    spawnLinkDelayed_,
    syncWallets,
    mine101_,
  )
where

import Control.Concurrent.Async (Async, async, link)
import LndClient.Data.BtcEnv
import LndClient.Data.CloseChannel (CloseChannelRequest (..))
import LndClient.Data.GetInfo (GetInfoResponse (..))
import LndClient.Data.ListChannels as LC (Channel (..), ListChannelsRequest (..))
import LndClient.Data.LndEnv
import LndClient.Data.NewAddress (NewAddressResponse (..))
import LndClient.Data.OpenChannel (OpenChannelRequest (..))
import LndClient.Data.Peer (ConnectPeerRequest (..), LightningAddress (..))
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
        envKatipLE :: LogEnv
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

newBtcClient :: IO BTC.Client
newBtcClient = do
  env <- btcEnv
  let user = btcRpcUser env
  let passw = btcRpcPassword env
  let url = btcRpcUrl env
  getClient (unpack url) user passw

readEnv :: KatipContextT IO Env
readEnv = do
  le <- getLogEnv
  ctx <- getKatipContext
  ns <- getKatipNamespace
  lndEnv <- liftIO readLndEnv
  bc <- liftIO newBtcClient
  return
    Env
      { envLndMerchant = lndEnv,
        envLndCustomer = custEnv lndEnv,
        envBtcClient = bc,
        envKatipLE = le,
        envKatipCTX = ctx,
        envKatipNS = ns
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

withEnv :: (Env -> IO ()) -> IO ()
withEnv =
  bracket
    ( runKatip $ do
        env <- readEnv
        runApp env $ setupEnv env
        return env
    )
    (closeScribes . envKatipLE)

mine101_ :: Env -> IO ()
mine101_ env = do
  NewAddressResponse btcAddress <-
    runApp env $
      liftLndResult
        =<< newAddress
          (envLndCustomer env)
          GRPC.AddressTypeWITNESS_PUBKEY_HASH
  _ <- generateToAddress (envBtcClient env) 101 (toStrict btcAddress) Nothing
  runApp_ env $ liftLndResult =<< syncWallets env
  return ()

setupEnv :: (KatipContext m) => Env -> m ()
setupEnv env = do
  --
  -- Init/Unlock and Sync wallets
  --
  _ <- liftLndResult =<< lazyInitWallet merchantEnv
  _ <- liftLndResult =<< lazyInitWallet customerEnv
  --
  -- Connect Customer to Merchant
  --
  GetInfoResponse merchantPubKeyHex _ _ <- liftLndResult =<< getInfo merchantEnv
  let connectPeerRequest =
        ConnectPeerRequest
          { addr =
              LightningAddress
                { pubkey = merchantPubKeyHex,
                  host = merchantNodeLocation
                },
            perm = False
          }
  _ <- liftLndResult =<< lazyConnectPeer customerEnv connectPeerRequest
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
              -- but for some reason handler is not called in this case
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
    delay 1000000
    mine101_ env
    mapM_ (\(_, x) -> takeMVar x) cpxs
  --
  -- Open channel from Customer to Merchant
  --
  merchantPubKey <-
    liftMaybe "can't decode hex pub key" $ unHexPubKey merchantPubKeyHex
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
  _ <-
    runApp env $
      liftLndResult =<< openChannelSync (envLndCustomer env) openChannelRequest
  -- mine some blocks to give confirmations to funding transaction
  liftIO $ mine101_ env
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

spawnLink :: (MonadUnliftIO m) => m a -> m (Async a)
spawnLink x =
  withRunInIO $ \run -> do
    pid <- async $ run x
    link pid
    return pid

spawnLinkDelayed_ :: (MonadUnliftIO m) => m a -> m ()
spawnLinkDelayed_ x = do
  _ <- spawnLink x
  -- give process 1 second to spawn
  liftIO $ delay 1000000
  return ()

syncWallets ::
  (KatipContext m) =>
  Env ->
  m (Either LndError ())
syncWallets env = do
  $(logTM) InfoS "Wallet sync ..."
  resMerchant <- getInfo (envLndMerchant env)
  resCustomer <- getInfo (envLndCustomer env)
  case (,) <$> resMerchant <*> resCustomer of
    Left e -> return $ Left e
    Right (x, y) ->
      if syncedToChain x
        && (syncedToGraph x)
        && (syncedToChain y)
        && (syncedToGraph y)
        then return $ Right ()
        else (liftIO $ delay 1000000) >> syncWallets env
