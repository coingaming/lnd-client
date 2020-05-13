module LndClient.Data.Types (LndResult (..)) where

import Chronos (Timespan)
import Network.HTTP.Client (HttpException)
import Universum

data LndResult a
  = LndSuccess Timespan a
  | LndFail Timespan a
  | LndHttpException Timespan HttpException
  deriving (Show)
