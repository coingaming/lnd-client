module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    logDefault,
    logMaskErrors,
    logOmitInfo,
  )
where

import Chronos (Timespan)
import Control.Exception (Exception)
import LndClient.Import.External
import Network.GRPC.HighLevel.Generated

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | GrpcError ClientError
  | GrpcUnexpectedResult Text
  | GrpcEmptyResult
  | LndFail Timespan Text
  | LndEnvError Text
  deriving (Show)

newtype LoggingStrategy
  = LoggingStrategy (Severity -> Maybe Timespan -> Maybe LndError -> Severity)

logDefault :: LoggingStrategy
logDefault = LoggingStrategy $ \x _ _ -> x

logMaskErrors :: LoggingStrategy
logMaskErrors = LoggingStrategy $ \x _ _ -> if x >= InfoS then InfoS else x

logOmitInfo :: LoggingStrategy
logOmitInfo = LoggingStrategy $ \x _ _ -> if x <= InfoS then DebugS else x

instance Exception LndError
