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
    liftLndResult,
    customerNodeLocation,
    merchantNodeLocation,
    withEnv,
  )
where

import LndClient.Data.BtcEnv
import LndClient.Data.GetInfo (GetInfoResponse (..))
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

setupEnv :: (KatipContext m) => Env -> m ()
setupEnv env = do
  --
  -- Init/Unlock wallets
  --
  _ <- liftLndResult =<< lazyInitWallet merchantEnv
  _ <- liftLndResult =<< lazyInitWallet customerEnv
  --
  -- Connect Customer to Merchant
  --
  GetInfoResponse merchantPubKeyHex <- liftLndResult =<< getInfo merchantEnv
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
  NewAddressResponse customerBtcAddressLazy <-
    liftLndResult
      =<< newAddress customerEnv GRPC.AddressTypeWITNESS_PUBKEY_HASH
  let customerBtcAddress = toStrict customerBtcAddressLazy
  --
  -- Give Customer some money to operate
  --
  _ <- liftIO $ generateToAddress btcClient 101 customerBtcAddress Nothing
  _ <- liftIO $ delay 3000000
  --
  -- Open channel from Customer to Merchant
  --
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
  _ <- liftLndResult =<< openChannelSync customerEnv openChannelRequest
  _ <- liftIO $ generateToAddress btcClient 101 customerBtcAddress Nothing
  _ <- liftIO $ delay 3000000
  return ()
  where
    btcClient = envBtcClient env
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

liftMaybe :: MonadIO m => String -> Maybe a -> m a
liftMaybe msg mx =
  case mx of
    Just x -> return x
    Nothing -> liftIO $ fail msg
