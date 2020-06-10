module LndClient.Data.Type (LndError (..)) where

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

instance Exception LndError
