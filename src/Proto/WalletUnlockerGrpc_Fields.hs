{- This file was auto-generated from wallet_unlocker_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.WalletUnlockerGrpc_Fields where
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
adminMacaroon ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "adminMacaroon" a) =>
  Lens.Family2.LensLike' f s a
adminMacaroon = Data.ProtoLens.Field.field @"adminMacaroon"
aezeedPassphrase ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "aezeedPassphrase" a) =>
  Lens.Family2.LensLike' f s a
aezeedPassphrase = Data.ProtoLens.Field.field @"aezeedPassphrase"
channelBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "channelBackups" a) =>
  Lens.Family2.LensLike' f s a
channelBackups = Data.ProtoLens.Field.field @"channelBackups"
cipherSeedMnemonic ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "cipherSeedMnemonic" a) =>
  Lens.Family2.LensLike' f s a
cipherSeedMnemonic
  = Data.ProtoLens.Field.field @"cipherSeedMnemonic"
currentPassword ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "currentPassword" a) =>
  Lens.Family2.LensLike' f s a
currentPassword = Data.ProtoLens.Field.field @"currentPassword"
encipheredSeed ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "encipheredSeed" a) =>
  Lens.Family2.LensLike' f s a
encipheredSeed = Data.ProtoLens.Field.field @"encipheredSeed"
maybe'channelBackups ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'channelBackups" a) =>
  Lens.Family2.LensLike' f s a
maybe'channelBackups
  = Data.ProtoLens.Field.field @"maybe'channelBackups"
newMacaroonRootKey ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "newMacaroonRootKey" a) =>
  Lens.Family2.LensLike' f s a
newMacaroonRootKey
  = Data.ProtoLens.Field.field @"newMacaroonRootKey"
newPassword ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "newPassword" a) =>
  Lens.Family2.LensLike' f s a
newPassword = Data.ProtoLens.Field.field @"newPassword"
recoveryWindow ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "recoveryWindow" a) =>
  Lens.Family2.LensLike' f s a
recoveryWindow = Data.ProtoLens.Field.field @"recoveryWindow"
seedEntropy ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "seedEntropy" a) =>
  Lens.Family2.LensLike' f s a
seedEntropy = Data.ProtoLens.Field.field @"seedEntropy"
statelessInit ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "statelessInit" a) =>
  Lens.Family2.LensLike' f s a
statelessInit = Data.ProtoLens.Field.field @"statelessInit"
vec'cipherSeedMnemonic ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'cipherSeedMnemonic" a) =>
  Lens.Family2.LensLike' f s a
vec'cipherSeedMnemonic
  = Data.ProtoLens.Field.field @"vec'cipherSeedMnemonic"
walletPassword ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "walletPassword" a) =>
  Lens.Family2.LensLike' f s a
walletPassword = Data.ProtoLens.Field.field @"walletPassword"