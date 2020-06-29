module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    --    LogOverlayValues (..),
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

--data LoggingStrategy = LogDefault | LogOverlay LogOverlayValues

--data LogOverlayValues
--  = LogOverlayValues
--      { logInfoAs :: Severity,
--        logErrorAs :: Severity
--      }

newtype LoggingStrategy = LoggingStrategy (Severity -> Severity)

logDefault :: LoggingStrategy
logDefault = LoggingStrategy id

logMaskErrors :: LoggingStrategy
logMaskErrors = LoggingStrategy $ \x -> if x >= InfoS then InfoS else x

logOmitInfo :: LoggingStrategy
logOmitInfo = LoggingStrategy $ \x -> if x <= InfoS then DebugS else x

instance Exception LndError
