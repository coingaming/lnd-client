{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.Void
  ( VoidRequest (..),
    VoidResponse (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..), object)
import GHC.Generics (Generic)
import Universum

data VoidRequest
  = VoidRequest
      {
      }
  deriving (Generic, Show)

data VoidResponse
  = VoidResponse
      {
      }
  deriving (Generic, Show, Read, Eq)

instance ToJSON VoidRequest where
  toJSON _ = object []

instance FromJSON VoidResponse where
  parseJSON _ = pure VoidResponse
