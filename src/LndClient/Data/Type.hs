module LndClient.Data.Type (LndError (..)) where

import Chronos (Timespan)
import LndClient.Import.External
import Network.GRPC.HighLevel.Generated
import Network.HTTP.Client (HttpException)

data LndError
  = ToGrpcError Text
  | FromGrpcError Text
  | GrpcError ClientError
  | GrpcUnexpectedResult Text
  | LndFail Timespan Text
  | LndHttpException Timespan HttpException
  deriving (Show)
