{- This file was auto-generated from chainrpc/chainnotifier.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Chainrpc.Chainnotifier_Fields where
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
blockHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blockHash" a) =>
  Lens.Family2.LensLike' f s a
blockHash = Data.ProtoLens.Field.field @"blockHash"
blockHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "blockHeight" a) =>
  Lens.Family2.LensLike' f s a
blockHeight = Data.ProtoLens.Field.field @"blockHeight"
conf ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "conf" a) =>
  Lens.Family2.LensLike' f s a
conf = Data.ProtoLens.Field.field @"conf"
hash ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "hash" a) =>
  Lens.Family2.LensLike' f s a
hash = Data.ProtoLens.Field.field @"hash"
height ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "height" a) =>
  Lens.Family2.LensLike' f s a
height = Data.ProtoLens.Field.field @"height"
heightHint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "heightHint" a) =>
  Lens.Family2.LensLike' f s a
heightHint = Data.ProtoLens.Field.field @"heightHint"
index ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "index" a) =>
  Lens.Family2.LensLike' f s a
index = Data.ProtoLens.Field.field @"index"
maybe'conf ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'conf" a) =>
  Lens.Family2.LensLike' f s a
maybe'conf = Data.ProtoLens.Field.field @"maybe'conf"
maybe'event ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'event" a) =>
  Lens.Family2.LensLike' f s a
maybe'event = Data.ProtoLens.Field.field @"maybe'event"
maybe'outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'outpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'outpoint = Data.ProtoLens.Field.field @"maybe'outpoint"
maybe'reorg ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'reorg" a) =>
  Lens.Family2.LensLike' f s a
maybe'reorg = Data.ProtoLens.Field.field @"maybe'reorg"
maybe'spend ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'spend" a) =>
  Lens.Family2.LensLike' f s a
maybe'spend = Data.ProtoLens.Field.field @"maybe'spend"
maybe'spendingOutpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'spendingOutpoint" a) =>
  Lens.Family2.LensLike' f s a
maybe'spendingOutpoint
  = Data.ProtoLens.Field.field @"maybe'spendingOutpoint"
numConfs ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numConfs" a) =>
  Lens.Family2.LensLike' f s a
numConfs = Data.ProtoLens.Field.field @"numConfs"
outpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "outpoint" a) =>
  Lens.Family2.LensLike' f s a
outpoint = Data.ProtoLens.Field.field @"outpoint"
rawSpendingTx ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "rawSpendingTx" a) =>
  Lens.Family2.LensLike' f s a
rawSpendingTx = Data.ProtoLens.Field.field @"rawSpendingTx"
rawTx ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "rawTx" a) =>
  Lens.Family2.LensLike' f s a
rawTx = Data.ProtoLens.Field.field @"rawTx"
reorg ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "reorg" a) =>
  Lens.Family2.LensLike' f s a
reorg = Data.ProtoLens.Field.field @"reorg"
script ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "script" a) =>
  Lens.Family2.LensLike' f s a
script = Data.ProtoLens.Field.field @"script"
spend ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "spend" a) =>
  Lens.Family2.LensLike' f s a
spend = Data.ProtoLens.Field.field @"spend"
spendingHeight ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendingHeight" a) =>
  Lens.Family2.LensLike' f s a
spendingHeight = Data.ProtoLens.Field.field @"spendingHeight"
spendingInputIndex ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendingInputIndex" a) =>
  Lens.Family2.LensLike' f s a
spendingInputIndex
  = Data.ProtoLens.Field.field @"spendingInputIndex"
spendingOutpoint ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendingOutpoint" a) =>
  Lens.Family2.LensLike' f s a
spendingOutpoint = Data.ProtoLens.Field.field @"spendingOutpoint"
spendingTxHash ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "spendingTxHash" a) =>
  Lens.Family2.LensLike' f s a
spendingTxHash = Data.ProtoLens.Field.field @"spendingTxHash"
txIndex ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txIndex" a) =>
  Lens.Family2.LensLike' f s a
txIndex = Data.ProtoLens.Field.field @"txIndex"
txid ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "txid" a) =>
  Lens.Family2.LensLike' f s a
txid = Data.ProtoLens.Field.field @"txid"