{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.Peer
  ( Peer (..),
    PeerList (..),
    LightningAddress (..),
    ConnectPeerRequest (..),
  )
where

import LndClient.Import.External
import LndClient.Utils (stdParseJSON, stdToJSON)

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

data LightningAddress
  = LightningAddress
      { pubkey :: Text,
        host :: Text
      }
  deriving (Generic, Show, Eq)

instance FromJSON LightningAddress where
  parseJSON = stdParseJSON

instance ToJSON LightningAddress where
  toJSON = stdToJSON

data ConnectPeerRequest
  = ConnectPeerRequest
      { addr :: LightningAddress,
        perm :: Bool
      }
  deriving (Generic, Show, Eq)

instance FromJSON ConnectPeerRequest where
  parseJSON = stdParseJSON

instance ToJSON ConnectPeerRequest where
  toJSON = stdToJSON
