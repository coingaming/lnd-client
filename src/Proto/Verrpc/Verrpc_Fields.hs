{- This file was auto-generated from verrpc/verrpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Verrpc.Verrpc_Fields where
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
appMajor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "appMajor" a) =>
  Lens.Family2.LensLike' f s a
appMajor = Data.ProtoLens.Field.field @"appMajor"
appMinor ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "appMinor" a) =>
  Lens.Family2.LensLike' f s a
appMinor = Data.ProtoLens.Field.field @"appMinor"
appPatch ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "appPatch" a) =>
  Lens.Family2.LensLike' f s a
appPatch = Data.ProtoLens.Field.field @"appPatch"
appPreRelease ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "appPreRelease" a) =>
  Lens.Family2.LensLike' f s a
appPreRelease = Data.ProtoLens.Field.field @"appPreRelease"
buildTags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "buildTags" a) =>
  Lens.Family2.LensLike' f s a
buildTags = Data.ProtoLens.Field.field @"buildTags"
commit ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "commit" a) =>
  Lens.Family2.LensLike' f s a
commit = Data.ProtoLens.Field.field @"commit"
commitHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "commitHash" a) =>
  Lens.Family2.LensLike' f s a
commitHash = Data.ProtoLens.Field.field @"commitHash"
goVersion ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "goVersion" a) =>
  Lens.Family2.LensLike' f s a
goVersion = Data.ProtoLens.Field.field @"goVersion"
vec'buildTags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'buildTags" a) =>
  Lens.Family2.LensLike' f s a
vec'buildTags = Data.ProtoLens.Field.field @"vec'buildTags"
version ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "version" a) =>
  Lens.Family2.LensLike' f s a
version = Data.ProtoLens.Field.field @"version"