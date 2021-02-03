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
    syncWallets,
    withEnv,
    liftMaybe,
  )
where

import LndClient.Data.LndEnv
import LndClient.Import
import LndClient.LndTest
import qualified Network.Bitcoin as BTC (Client)
import Network.GRPC.HighLevel.Generated

data Env
  = Env
      { envAlice :: TestEnv,
        envBob :: TestEnv,
        envBtcClient :: BTC.Client,
        envKatipNS :: Namespace,
        envKatipCTX :: LogContexts,
        envKatipLE :: LogEnv
      }

newBobEnv :: LndEnv -> LndEnv
newBobEnv x =
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

readEnv :: IO Env
readEnv = do
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
  bc <- newBtcClient btcEnv
  aliceLndEnv <- liftIO readLndEnv
  runKatipContextT le (mempty :: LogContexts) mempty $ do
    alice <-
      newTestEnv
        aliceLndEnv
        $ NodeLocation "localhost:9735"
    bob <-
      newTestEnv
        (newBobEnv aliceLndEnv)
        $ NodeLocation "localhost:9734"
    pure
      Env
        { envAlice = alice,
          envBob = bob,
          envBtcClient = bc,
          envKatipLE = le,
          envKatipCTX = mempty,
          envKatipNS = mempty
        }

withEnv :: (Env -> AppM IO ()) -> IO ()
withEnv f = do
  env <- readEnv
  runApp env $ do
    lazyMineInitialCoins
    lazyConnectNodes
    watchDefaults
    closeAllChannels
    f env
  --
  -- TODO : we can't really use async `cance` or `withAsync`
  -- before this is fixed somehow
  -- https://github.com/awakesecurity/gRPC-haskell/issues/104#issuecomment-769408503
  --
  --withSpawnLink
  --  ( liftLndResult
  --      =<< subscribeInvoicesChan
  --        (pure $ envMerchantIQ env)
  --        merchantEnv
  --        --
  --        -- TODO : this is related to LND bug
  --        -- https://github.com/lightningnetwork/lnd/issues/2469
  --        --
  --        (SubscribeInvoicesRequest (Just $ AddIndex 1) Nothing)
  --  )
  --  ( const $ do
  --      f env
  --      $(logTM) InfoS "GONNA_TO_TERMINATE_SUBSCRIPTION"
  --  )
  void . closeScribes $ envKatipLE env

btcEnv :: BtcEnv
btcEnv =
  BtcEnv
    { btcUrl = BtcUrl "http://localhost:18443",
      btcLogin = BtcLogin "developer",
      btcPassword = BtcPassword "developer"
    }

newtype AppM m a
  = AppM
      { unAppM :: ReaderT Env m a
      }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Env)

instance (MonadUnliftIO m) => MonadUnliftIO (AppM m) where
  withRunInIO run = AppM (withRunInIO (\k -> run (k . unAppM)))
  askUnliftIO =
    AppM
      ( fmap
          (\(UnliftIO run) -> UnliftIO (run . unAppM))
          askUnliftIO
      )

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

instance (MonadUnliftIO m) => LndTest (AppM m) where
  btcClient = asks envBtcClient
  getTestEnv = \case
    Alice -> asks envAlice
    Bob -> asks envBob

runApp :: Env -> AppM m a -> m a
runApp env app = runReaderT (unAppM app) env

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> pure x
    Nothing -> liftIO $ fail msg
