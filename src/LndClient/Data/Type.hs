{-# LANGUAGE TemplateHaskell #-}

module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    LnInitiator (..),
    logDefault,
    logDebug,
  )
where

import Chronos (Timespan)
import Control.Exception (Exception)
import LndClient.Import.External
import LndClient.Orphan ()
import qualified Network.HTTP2.Client.Exceptions as E

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | LndGrpcError E.ClientError
  | LndGrpcException Text
  | GrpcUnexpectedResult Text
  | GrpcEmptyResult
  | LndError Text
  | LndEnvError Text
  | TChanTimeout Text
  deriving (Eq, Show, Generic)

instance Out LndError

data LoggingStrategy = LoggingStrategy
  { loggingStrategySev :: Severity -> Maybe Timespan -> Maybe LndError -> Severity,
    loggingStrategyVis :: SecretVision
  }

data LnInitiator
  = LnInitiatorUnknown
  | LnInitiatorLocal
  | LnInitiatorRemote
  | LnInitiatorBoth
  deriving (Eq, Ord, Show, Read, Generic)

instance Out LnInitiator

derivePersistField "LnInitiator"

logDefault :: LoggingStrategy
logDefault =
  LoggingStrategy
    { loggingStrategySev = \x _ _ -> x,
      loggingStrategyVis = SecretHidden
    }

logDebug :: LoggingStrategy
logDebug =
  LoggingStrategy
    { loggingStrategySev = \_ _ _ -> DebugS,
      loggingStrategyVis = SecretHidden
    }

instance Exception LndError
