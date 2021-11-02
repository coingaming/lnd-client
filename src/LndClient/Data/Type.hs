{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -Wno-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

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
import qualified LndClient.Orphan
import Network.HTTP2.Client.Exceptions as E
import qualified Universum

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

instance Out E.ClientError where
  docPrec n x = docPrec n (Universum.show x :: String)
  doc x = doc (Universum.show x :: String)

instance Out LndError

newtype LoggingStrategy
  = LoggingStrategy
      (Severity -> Maybe Timespan -> Maybe LndError -> Severity)

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
  LoggingStrategy $ \x _ _ -> x

logDebug :: LoggingStrategy
logDebug =
  LoggingStrategy $ \_ _ _ -> DebugS

instance Exception LndError
