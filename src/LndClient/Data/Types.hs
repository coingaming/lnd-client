module LndClient.Data.Types (LndResult (..), GrpcParserError (..)) where

import Chronos (Timespan)
import LndClient.Import.External
import Network.HTTP.Client (HttpException)

data LndResult a
  = LndSuccess Timespan a
  | LndFail Timespan a
  | LndGrpcParserFail Timespan GrpcParserError
  | LndHttpException Timespan HttpException
  deriving (Show)

data GrpcParserError
  = ToGrpcError Text
  | FromGrpcError Text
  deriving (Show)
