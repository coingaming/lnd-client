{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.Orphan
  (
  )
where

import Data.ProtoLens.Message
import Network.HTTP2.Client.Exceptions as E
import Text.PrettyPrint.GenericPretty
import Universum
import Control.Exception (IOException)

instance Out E.ClientError where
  docPrec n x = docPrec n (Universum.show x :: String)
  doc x = doc (Universum.show x :: String)

instance Out IOException where
  docPrec n x = docPrec n (Universum.show x :: String)
  doc x = doc (Universum.show x :: String)

instance FieldDefault (Maybe a) where
  fieldDefault = Nothing
