module LndClient.Data.Types (LndResult (..)) where

import Chronos (Timespan)
import LndClient.Import.External
import Network.HTTP.Client (HttpException)

data LndResult a
  = LndSuccess Timespan a
  | LndFail Timespan a
  | LndHttpException Timespan HttpException
  deriving (Show)
