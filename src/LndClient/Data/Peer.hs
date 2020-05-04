{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.Peer
  ( Peer (..),
    PeerList (..),
  )
where

import Data.Aeson (FromJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON)

data Peer
  = Peer
      { pubKey :: Text,
        address :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON Peer where
  parseJSON = stdParseJSON

newtype PeerList
  = PeerList
      { peers :: [Peer]
      }
  deriving (Generic, Show, Eq)

instance FromJSON PeerList where
  parseJSON = stdParseJSON
