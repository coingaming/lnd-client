module LndClient.Data.Types (LndResult (..)) where

import Network.HTTP.Client (HttpException)

data LndResult a
  = LndSuccess a
  | LndFail a
  | LndHttpException HttpException
  deriving (Show)
