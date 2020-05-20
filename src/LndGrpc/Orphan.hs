{-# LANGUAGE FlexibleInstances #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndGrpc.Orphan where

import Data.ByteString
import qualified Data.Map as M
import Proto3.Suite.JSONPB
import Universum

instance {-# OVERLAPPING #-} ToSchema (OverrideToSchema (M.Map a ByteString)) where
  declareNamedSchema _ = return (NamedSchema Nothing mempty)
