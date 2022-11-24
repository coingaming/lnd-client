{-# LANGUAGE TemplateHaskell #-}

module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    LoggingMeta (..),
    LnInitiator (..),
    logDefault,
    logDebug,
  )
where

import Control.Exception (IOException)
import qualified Data.Set as Set
import LndClient.Import.External
import LndClient.Orphan ()
import qualified Network.HTTP2.Client2.Exceptions as E

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | LndGrpcError E.ClientError
  | LndGrpcException Text
  | LndWalletLocked
  | LndWalletNotExists
  | GrpcUnexpectedResult Text
  | GrpcEmptyResult
  | LndError Text
  | LndEnvError Text
  | TChanTimeout Text
  | NetworkException Text
  | LndIOException IOException
  deriving stock (Eq, Show, Generic)

instance Out LndError

data LoggingMeta
  = LndHost
  | LndPort
  | LndMethod
  | LndRequest
  | LndRequestGrpc
  | LndResponse
  | LndResponseGrpc
  | LndResponseSub
  | LndResponseGrpcSub
  | LndElapsedSeconds
  | LndElapsedSecondsSub
  | LndMethodCompose
  | LndTestReceiveInvoice
  deriving stock
    ( Eq,
      Ord,
      Show,
      Read,
      Generic,
      Enum,
      Bounded
    )

instance Out LoggingMeta

instance ToJSON LoggingMeta

instance FromJSON LoggingMeta

data LoggingStrategy = LoggingStrategy
  { loggingStrategySeverity ::
      Severity ->
      Maybe Timespan ->
      Maybe LndError ->
      Severity,
    loggingStrategySecret :: SecretVision,
    loggingStrategyMeta :: Set LoggingMeta
  }

data LnInitiator
  = LnInitiatorUnknown
  | LnInitiatorLocal
  | LnInitiatorRemote
  | LnInitiatorBoth
  deriving stock (Eq, Ord, Show, Read, Generic)

instance Out LnInitiator

derivePersistField "LnInitiator"

logDefault :: LoggingStrategy
logDefault =
  LoggingStrategy
    { loggingStrategySeverity = \x _ _ -> x,
      loggingStrategySecret = SecretHidden,
      loggingStrategyMeta = Set.fromList enumerate
    }

logDebug :: LoggingStrategy
logDebug =
  LoggingStrategy
    { loggingStrategySeverity = \_ _ _ -> DebugS,
      loggingStrategySecret = SecretHidden,
      loggingStrategyMeta = Set.fromList enumerate
    }

instance Exception LndError
