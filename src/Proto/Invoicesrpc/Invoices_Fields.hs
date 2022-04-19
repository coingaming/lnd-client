{- This file was auto-generated from invoicesrpc/invoices.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Invoicesrpc.Invoices_Fields where
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
import qualified Proto.Lnrpc.Ln0
import qualified Proto.Lnrpc.Ln1
addIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addIndex" a) =>
  Lens.Family2.LensLike' f s a
addIndex = Data.ProtoLens.Field.field @"addIndex"
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
lookupModifier ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lookupModifier" a) =>
  Lens.Family2.LensLike' f s a
lookupModifier = Data.ProtoLens.Field.field @"lookupModifier"
maybe'invoiceRef ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'invoiceRef" a) =>
  Lens.Family2.LensLike' f s a
maybe'invoiceRef = Data.ProtoLens.Field.field @"maybe'invoiceRef"
maybe'paymentAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'paymentAddr" a) =>
  Lens.Family2.LensLike' f s a
maybe'paymentAddr = Data.ProtoLens.Field.field @"maybe'paymentAddr"
maybe'paymentHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'paymentHash" a) =>
  Lens.Family2.LensLike' f s a
maybe'paymentHash = Data.ProtoLens.Field.field @"maybe'paymentHash"
maybe'setId ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'setId" a) =>
  Lens.Family2.LensLike' f s a
maybe'setId = Data.ProtoLens.Field.field @"maybe'setId"
memo ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "memo" a) =>
  Lens.Family2.LensLike' f s a
memo = Data.ProtoLens.Field.field @"memo"
paymentAddr ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "paymentAddr" a) =>
  Lens.Family2.LensLike' f s a
paymentAddr = Data.ProtoLens.Field.field @"paymentAddr"
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
setId ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "setId" a) =>
  Lens.Family2.LensLike' f s a
setId = Data.ProtoLens.Field.field @"setId"
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