module LndClient.Data.BtcEnv
  ( BtcEnv (..),
    btcEnv,
  )
where

import Data.ByteString (ByteString)
import Env hiding (def)

data BtcEnv
  = BtcEnv
      { btcRpcUser :: ByteString,
        btcRpcPassword :: ByteString,
        btcRpcUrl :: String
      }

btcEnv :: IO BtcEnv
btcEnv =
  parse (header "BtcClient config") $
    BtcEnv
      <$> var (str <=< nonempty) "BTC_RPC_USER" (keep <> help "")
      <*> var (str <=< nonempty) "BTC_RPC_PASSWORD" (keep <> help "")
      <*> var (str <=< nonempty) "BTC_RPC_URL" (keep <> help "")
