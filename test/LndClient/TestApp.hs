{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralisedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module LndClient.TestApp
  ( withEnv,
    Owner (..),
    proxyOwner,
  )
where

import LndClient.Data.LndEnv
import LndClient.Import
import LndClient.LndTest
import qualified Network.Bitcoin as BTC (Client)
import Network.GRPC.Client.Helpers (GrpcClientConfig (..))

data Env = Env
  { envAlice :: TestEnv,
    envBob :: TestEnv,
    envNick :: TestEnv,
    envBtc :: BTC.Client,
    envKatipNS :: Namespace,
    envKatipCTX :: LogContexts,
    envKatipLE :: LogEnv
  }

data Owner = Alice | Bob | Nick
  deriving
    ( Eq,
      Ord,
      Show,
      Bounded,
      Enum,
      Generic
    )

instance Out Owner

proxyOwner :: Proxy Owner
proxyOwner = Proxy

newBobEnv :: LndEnv -> LndEnv
newBobEnv x =
  x
    { envLndConfig =
        (envLndConfig x)
          { _grpcClientConfigPort = 11009
          },
      envLndCipherSeedMnemonic =
        Just $
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

newNickEnv :: LndEnv -> LndEnv
newNickEnv x =
  x
    { envLndConfig =
        (envLndConfig x)
          { _grpcClientConfigPort = 12009
          },
      envLndCipherSeedMnemonic =
        Just $
          CipherSeedMnemonic
            [ "about",
              "rice",
              "knock",
              "icon",
              "double",
              "inner",
              "walnut",
              "all",
              "ability",
              "merry",
              "shed",
              "call",
              "they",
              "cool",
              "wild",
              "point",
              "shoot",
              "public",
              "door",
              "release",
              "music",
              "stereo",
              "report",
              "together"
            ],
      envLndAezeedPassphrase = Nothing
    }

withEnv :: AppM IO () -> IO ()
withEnv action = do
  bc <- newBtcClient btcEnv
  aliceLndEnv <- liftIO readLndEnv
  handleScribe <-
    mkHandleScribeWithFormatter
      bracketFormat
      ColorIfTerminal
      stdout
      ( permitItem
          . fromMaybe DebugS
          $ envLndLogSeverity aliceLndEnv
      )
      V2
  let newLogEnv =
        registerScribe "stdout" handleScribe defaultScribeSettings
          =<< initLogEnv "LndClient" "test"
  bracket newLogEnv rmLogEnv $ \le ->
    runKatipContextT le (mempty :: LogContexts) mempty $ do
      withTestEnv aliceLndEnv (NodeLocation "127.0.0.1:9735") $ \alice ->
        withTestEnv (newBobEnv aliceLndEnv) (NodeLocation "127.0.0.1:9734") $ \bob ->
          withTestEnv (newNickEnv aliceLndEnv) (NodeLocation "127.0.0.1:9736") $ \nick ->
            liftIO $
              runApp
                Env
                  { envAlice = alice,
                    envBob = bob,
                    envNick = nick,
                    envBtc = bc,
                    envKatipLE = le,
                    envKatipCTX = mempty,
                    envKatipNS = mempty
                  }
                $ do
                  setupZeroChannels proxyOwner
                  action
  where
    rmLogEnv :: LogEnv -> IO ()
    rmLogEnv =
      void . liftIO . closeScribes

btcEnv :: BtcEnv
btcEnv =
  BtcEnv
    { btcUrl = BtcUrl "http://localhost:18443",
      btcLogin = BtcLogin "developer",
      btcPassword = BtcPassword "developer"
    }

newtype AppM m a = AppM
  { unAppM :: ReaderT Env m a
  }
  deriving (Functor, Applicative, Monad, MonadIO, MonadReader Env, MonadUnliftIO)

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

instance (MonadUnliftIO m) => LndTest (AppM m) Owner where
  getBtcClient = const $ asks envBtc
  getTestEnv = \case
    Alice -> asks envAlice
    Bob -> asks envBob
    Nick -> asks envNick

runApp :: Env -> AppM m a -> m a
runApp env app = runReaderT (unAppM app) env
