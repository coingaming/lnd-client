{- This file was auto-generated from wtclientrpc/wtclient.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Wtclientrpc.Wtclient_Fields where
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
activeSessionCandidate ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "activeSessionCandidate" a) =>
  Lens.Family2.LensLike' f s a
activeSessionCandidate
  = Data.ProtoLens.Field.field @"activeSessionCandidate"
address ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "address" a) =>
  Lens.Family2.LensLike' f s a
address = Data.ProtoLens.Field.field @"address"
addresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "addresses" a) =>
  Lens.Family2.LensLike' f s a
addresses = Data.ProtoLens.Field.field @"addresses"
includeSessions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "includeSessions" a) =>
  Lens.Family2.LensLike' f s a
includeSessions = Data.ProtoLens.Field.field @"includeSessions"
maxBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxBackups" a) =>
  Lens.Family2.LensLike' f s a
maxBackups = Data.ProtoLens.Field.field @"maxBackups"
maxUpdates ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maxUpdates" a) =>
  Lens.Family2.LensLike' f s a
maxUpdates = Data.ProtoLens.Field.field @"maxUpdates"
numBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numBackups" a) =>
  Lens.Family2.LensLike' f s a
numBackups = Data.ProtoLens.Field.field @"numBackups"
numFailedBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numFailedBackups" a) =>
  Lens.Family2.LensLike' f s a
numFailedBackups = Data.ProtoLens.Field.field @"numFailedBackups"
numPendingBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numPendingBackups" a) =>
  Lens.Family2.LensLike' f s a
numPendingBackups = Data.ProtoLens.Field.field @"numPendingBackups"
numSessions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numSessions" a) =>
  Lens.Family2.LensLike' f s a
numSessions = Data.ProtoLens.Field.field @"numSessions"
numSessionsAcquired ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numSessionsAcquired" a) =>
  Lens.Family2.LensLike' f s a
numSessionsAcquired
  = Data.ProtoLens.Field.field @"numSessionsAcquired"
numSessionsExhausted ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "numSessionsExhausted" a) =>
  Lens.Family2.LensLike' f s a
numSessionsExhausted
  = Data.ProtoLens.Field.field @"numSessionsExhausted"
policyType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "policyType" a) =>
  Lens.Family2.LensLike' f s a
policyType = Data.ProtoLens.Field.field @"policyType"
pubkey ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "pubkey" a) =>
  Lens.Family2.LensLike' f s a
pubkey = Data.ProtoLens.Field.field @"pubkey"
sessions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sessions" a) =>
  Lens.Family2.LensLike' f s a
sessions = Data.ProtoLens.Field.field @"sessions"
sweepSatPerByte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sweepSatPerByte" a) =>
  Lens.Family2.LensLike' f s a
sweepSatPerByte = Data.ProtoLens.Field.field @"sweepSatPerByte"
sweepSatPerVbyte ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "sweepSatPerVbyte" a) =>
  Lens.Family2.LensLike' f s a
sweepSatPerVbyte = Data.ProtoLens.Field.field @"sweepSatPerVbyte"
towers ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "towers" a) =>
  Lens.Family2.LensLike' f s a
towers = Data.ProtoLens.Field.field @"towers"
vec'addresses ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'addresses" a) =>
  Lens.Family2.LensLike' f s a
vec'addresses = Data.ProtoLens.Field.field @"vec'addresses"
vec'sessions ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'sessions" a) =>
  Lens.Family2.LensLike' f s a
vec'sessions = Data.ProtoLens.Field.field @"vec'sessions"
vec'towers ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'towers" a) =>
  Lens.Family2.LensLike' f s a
vec'towers = Data.ProtoLens.Field.field @"vec'towers"