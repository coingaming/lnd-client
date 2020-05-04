{-# LANGUAGE DeriveGeneric #-}

module LndClient.Data.OpenChannel
  ( OpenChannelRequest (..),
    ChannelPoint (..),
    ResultWrapper (..),
  )
where

import Data.Aeson (FromJSON (..), ToJSON (..))
import Data.Text (Text)
import GHC.Generics (Generic)
import LndClient.Utils (stdParseJSON, stdToJSON)

newtype ResultWrapper a
  = ResultWrapper
      { result :: a
      }
  deriving (Generic, Show)

instance (FromJSON a) => FromJSON (ResultWrapper a) where
  parseJSON = stdParseJSON

data OpenChannelRequest
  = OpenChannelRequest
      { nodePubkey :: Text,
        localFundingAmount :: Text,
        pushSat :: Text,
        targetConf :: Maybe Integer,
        satPerByte :: Maybe Integer,
        private :: Maybe Bool,
        minHtlcMsat :: Maybe Integer,
        remoteCsvDelay :: Maybe Integer,
        minConfs :: Maybe Integer,
        spendUnconfirmed :: Maybe Bool,
        closeAddress :: Maybe String
        --
        --TODO implement fundingShim field
        --
      }
  deriving (Generic, Show, Eq)

instance ToJSON OpenChannelRequest where
  toJSON = stdToJSON

instance FromJSON OpenChannelRequest where
  parseJSON = stdParseJSON

data ChannelPoint
  = ChannelPoint
      { fundingTxidBytes :: Maybe String,
        fundingTxidStr :: String,
        outputIndex :: Integer
      }
  deriving (Generic, Show, Eq)

instance FromJSON ChannelPoint where
  parseJSON = stdParseJSON
