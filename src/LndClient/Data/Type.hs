{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

module LndClient.Data.Type
  ( LndError (..),
    LoggingStrategy (..),
    LogOverlayValues (..),
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

data LoggingStrategy = LogDefault | LogOverlay LogOverlayValues

data LogOverlayValues
  = LogOverlayValues
      { logInfoAs :: Severity,
        logErrorAs :: Severity
      }

instance Exception LndError
