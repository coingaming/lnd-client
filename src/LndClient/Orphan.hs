{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.Orphan where

import qualified Data.Text.Internal as T
import LndClient.Class2
import LndClient.Import.External

instance FromGrpc Text T.Text where
  fromGrpc = Right . fromStrict

instance ToGrpc Text T.Text where
  toGrpc = Right . toStrict
