{- This file was auto-generated from invoice_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.InvoiceGrpc_Fields where
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
import qualified Proto.LndGrpc
cltvExpiry ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cltvExpiry" a) =>
  Lens.Family2.LensLike' f s a
cltvExpiry = Data.ProtoLens.Field.field @"cltvExpiry"
descriptionHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "descriptionHash" a) =>
  Lens.Family2.LensLike' f s a
descriptionHash = Data.ProtoLens.Field.field @"descriptionHash"
expiry ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "expiry" a) =>
  Lens.Family2.LensLike' f s a
expiry = Data.ProtoLens.Field.field @"expiry"
fallbackAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "fallbackAddr" a) =>
  Lens.Family2.LensLike' f s a
fallbackAddr = Data.ProtoLens.Field.field @"fallbackAddr"
hash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hash" a) =>
  Lens.Family2.LensLike' f s a
hash = Data.ProtoLens.Field.field @"hash"
memo ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "memo" a) =>
  Lens.Family2.LensLike' f s a
memo = Data.ProtoLens.Field.field @"memo"
paymentHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentHash" a) =>
  Lens.Family2.LensLike' f s a
paymentHash = Data.ProtoLens.Field.field @"paymentHash"
paymentRequest ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentRequest" a) =>
  Lens.Family2.LensLike' f s a
paymentRequest = Data.ProtoLens.Field.field @"paymentRequest"
preimage ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "preimage" a) =>
  Lens.Family2.LensLike' f s a
preimage = Data.ProtoLens.Field.field @"preimage"
private ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "private" a) =>
  Lens.Family2.LensLike' f s a
private = Data.ProtoLens.Field.field @"private"
rHash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rHash" a) =>
  Lens.Family2.LensLike' f s a
rHash = Data.ProtoLens.Field.field @"rHash"
routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "routeHints" a) =>
  Lens.Family2.LensLike' f s a
routeHints = Data.ProtoLens.Field.field @"routeHints"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
valueMsat ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "valueMsat" a) =>
  Lens.Family2.LensLike' f s a
valueMsat = Data.ProtoLens.Field.field @"valueMsat"
vec'routeHints ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'routeHints" a) =>
  Lens.Family2.LensLike' f s a
vec'routeHints = Data.ProtoLens.Field.field @"vec'routeHints"