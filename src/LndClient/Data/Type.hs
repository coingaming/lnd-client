module LndClient.Data.Type (LndError (..)) where

import Chronos (Timespan)
import LndClient.Import.External
import Network.GRPC.HighLevel.Generated

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | GrpcError ClientError
  | GrpcUnexpectedResult Text
  | LndFail Timespan Text
  deriving (Show)
