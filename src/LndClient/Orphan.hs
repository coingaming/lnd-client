{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module LndClient.Orphan
  (
  )
where

import qualified Control.Exception as Exception
import Data.ByteString.Base16 as B16 (encode)
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Wire
import qualified Data.Text as T
import qualified Data.Text.Lazy as TL
import qualified Data.Vector.Unboxed as Unboxed
import qualified Network.HTTP2.Client as HTTP2
import qualified Text.Pretty.Simple as PrettySimple
import qualified Text.PrettyPrint as Pretty
import Text.PrettyPrint.GenericPretty
import Universum

deriving instance Generic Wire.Tag

deriving instance Generic Wire.WireValue

deriving instance Generic Wire.TaggedValue

instance Out Wire.Tag

instance Out Wire.WireValue

instance Out Wire.TaggedValue

deriving instance Generic HTTP2.TooMuchConcurrency

instance Out HTTP2.TooMuchConcurrency

deriving instance Generic Exception.BlockedIndefinitelyOnMVar

instance Out Exception.BlockedIndefinitelyOnMVar

--
-- TODO : proper instance
--
instance (Show a, Show b) => Out (Map a b) where
  docPrec _ = Pretty.text . TL.unpack . PrettySimple.pShow
  doc = Pretty.text . TL.unpack . PrettySimple.pShow

instance (Out a) => Out (Vector a) where
  docPrec n = docPrec n . toList
  doc = doc . toList

instance
  (Out a, Unboxed.Unbox a) =>
  Out (Unboxed.Vector a)
  where
  docPrec n = docPrec n . Unboxed.toList
  doc = doc . Unboxed.toList

instance Out Text where
  docPrec n = docPrec n . T.unpack
  doc = doc . T.unpack

data ByteStringDoc
  = ByteStringUtf8 Text
  | ByteStringHex Text
  | ByteStringRaw Text
  deriving (Generic)

instance Out ByteStringDoc

instance Out ByteString where
  docPrec n = docPrec n . newBsDoc
  doc = doc . newBsDoc

newBsDoc :: ByteString -> ByteStringDoc
newBsDoc bs =
  case decodeUtf8' bs of
    Right txt -> ByteStringUtf8 txt
    Left {} ->
      case decodeUtf8' $ B16.encode bs of
        Right txt -> ByteStringHex txt
        Left {} -> ByteStringRaw $ Universum.show bs

instance Out Word32 where
  docPrec n = docPrec n . fromIntegral @Word32 @Integer
  doc = doc . fromIntegral @Word32 @Integer

instance Out Word64 where
  docPrec n = docPrec n . fromIntegral @Word64 @Integer
  doc = doc . fromIntegral @Word64 @Integer

instance Out Int32 where
  docPrec n = docPrec n . fromIntegral @Int32 @Integer
  doc = doc . fromIntegral @Int32 @Integer

instance Out Int64 where
  docPrec n = docPrec n . fromIntegral @Int64 @Integer
  doc = doc . fromIntegral @Int64 @Integer
