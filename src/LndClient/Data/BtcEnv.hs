module LndClient.Data.BtcEnv
  ( BtcConfig (..),
    btcConfig,
  )
where

import Env hiding (def)

data BtcConfig
  = BtcConfig
      { btcRpcUser :: String,
        btcRpcPassword :: String,
        btcRpcUrl :: String
      }

btcConfig :: IO BtcConfig
btcConfig =
  parse (header "BtcClient config") $
    BtcConfig
      <$> var (str <=< nonempty) "BTC_RPC_USER" (keep <> help "")
      <*> var (str <=< nonempty) "BTC_RPC_PASSWORD" (keep <> help "")
      <*> var (str <=< nonempty) "BTC_RPC_URL" (keep <> help "")
