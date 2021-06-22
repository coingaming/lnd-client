{-# LANGUAGE DeriveLift #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    logDefault,
    logDebug,
  )
where

import Chronos (Timespan)
import Control.Exception (Exception)
import qualified Language.Haskell.TH.Syntax as TH
import LndClient.Import.External
import Network.GRPC.HighLevel.Generated as G
import Network.HTTP2.Client.Exceptions as E

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | GrpcError G.ClientError
  | LndGrpcError E.ClientError
  | GrpcUnexpectedResult Text
  | GrpcEmptyResult
  | LndError Text
  | LndEnvError Text
  | TChanTimeout Text
  deriving (Eq, Show)

newtype FieldIndex
  = FieldIndex Word32
  deriving (TH.Lift, Show)

newtype ReversedFieldLocation
  = ReversedFieldLocation [FieldIndex]
  deriving (TH.Lift, Semigroup, Show)

newtype LoggingStrategy
  = LoggingStrategy
      (Severity -> Maybe Timespan -> Maybe LndError -> Severity)

logDefault :: LoggingStrategy
logDefault =
  LoggingStrategy $ \x _ _ -> x

logDebug :: LoggingStrategy
logDebug =
  LoggingStrategy $ \_ _ _ -> DebugS

instance Exception LndError
