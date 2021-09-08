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
import Network.HTTP2.Client.Exceptions as E

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
  deriving (Eq, Show)

newtype LoggingStrategy
  = LoggingStrategy
      (Severity -> Maybe Timespan -> Maybe LndError -> Severity)

data LnInitiator
  = LnInitiatorUnknown
  | LnInitiatorLocal
  | LnInitiatorRemote
  | LnInitiatorBoth
  deriving (Eq, Ord, Show, Read)

derivePersistField "LnInitiator"

logDefault :: LoggingStrategy
logDefault =
  LoggingStrategy $ \x _ _ -> x

logDebug :: LoggingStrategy
logDebug =
  LoggingStrategy $ \_ _ _ -> DebugS

instance Exception LndError
