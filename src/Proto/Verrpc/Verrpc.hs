{- This file was auto-generated from verrpc/verrpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Verrpc.Verrpc (
        Versioner(..), Version(), VersionRequest()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
import qualified Text.PrettyPrint.GenericPretty.Instance
import qualified GHC.Generics
import qualified Text.PrettyPrint.GenericPretty
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
{- | Fields :
     
         * 'Proto.Verrpc.Verrpc_Fields.commit' @:: Lens' Version Data.Text.Text@
         * 'Proto.Verrpc.Verrpc_Fields.commitHash' @:: Lens' Version Data.Text.Text@
         * 'Proto.Verrpc.Verrpc_Fields.version' @:: Lens' Version Data.Text.Text@
         * 'Proto.Verrpc.Verrpc_Fields.appMajor' @:: Lens' Version Data.Word.Word32@
         * 'Proto.Verrpc.Verrpc_Fields.appMinor' @:: Lens' Version Data.Word.Word32@
         * 'Proto.Verrpc.Verrpc_Fields.appPatch' @:: Lens' Version Data.Word.Word32@
         * 'Proto.Verrpc.Verrpc_Fields.appPreRelease' @:: Lens' Version Data.Text.Text@
         * 'Proto.Verrpc.Verrpc_Fields.buildTags' @:: Lens' Version [Data.Text.Text]@
         * 'Proto.Verrpc.Verrpc_Fields.vec'buildTags' @:: Lens' Version (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Verrpc.Verrpc_Fields.goVersion' @:: Lens' Version Data.Text.Text@ -}
data Version
  = Version'_constructor {_Version'commit :: !Data.Text.Text,
                          _Version'commitHash :: !Data.Text.Text,
                          _Version'version :: !Data.Text.Text,
                          _Version'appMajor :: !Data.Word.Word32,
                          _Version'appMinor :: !Data.Word.Word32,
                          _Version'appPatch :: !Data.Word.Word32,
                          _Version'appPreRelease :: !Data.Text.Text,
                          _Version'buildTags :: !(Data.Vector.Vector Data.Text.Text),
                          _Version'goVersion :: !Data.Text.Text,
                          _Version'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Version where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Version
instance Data.ProtoLens.Field.HasField Version "commit" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'commit (\ x__ y__ -> x__ {_Version'commit = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "commitHash" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'commitHash (\ x__ y__ -> x__ {_Version'commitHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "version" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'version (\ x__ y__ -> x__ {_Version'version = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "appMajor" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'appMajor (\ x__ y__ -> x__ {_Version'appMajor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "appMinor" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'appMinor (\ x__ y__ -> x__ {_Version'appMinor = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "appPatch" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'appPatch (\ x__ y__ -> x__ {_Version'appPatch = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "appPreRelease" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'appPreRelease
           (\ x__ y__ -> x__ {_Version'appPreRelease = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "buildTags" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'buildTags (\ x__ y__ -> x__ {_Version'buildTags = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Version "vec'buildTags" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'buildTags (\ x__ y__ -> x__ {_Version'buildTags = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Version "goVersion" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Version'goVersion (\ x__ y__ -> x__ {_Version'goVersion = y__}))
        Prelude.id
instance Data.ProtoLens.Message Version where
  messageName _ = Data.Text.pack "verrpc.Version"
  packedMessageDescriptor _
    = "\n\
      \\aVersion\DC2\SYN\n\
      \\ACKcommit\CAN\SOH \SOH(\tR\ACKcommit\DC2\US\n\
      \\vcommit_hash\CAN\STX \SOH(\tR\n\
      \commitHash\DC2\CAN\n\
      \\aversion\CAN\ETX \SOH(\tR\aversion\DC2\ESC\n\
      \\tapp_major\CAN\EOT \SOH(\rR\bappMajor\DC2\ESC\n\
      \\tapp_minor\CAN\ENQ \SOH(\rR\bappMinor\DC2\ESC\n\
      \\tapp_patch\CAN\ACK \SOH(\rR\bappPatch\DC2&\n\
      \\SIapp_pre_release\CAN\a \SOH(\tR\rappPreRelease\DC2\GS\n\
      \\n\
      \build_tags\CAN\b \ETX(\tR\tbuildTags\DC2\GS\n\
      \\n\
      \go_version\CAN\t \SOH(\tR\tgoVersion"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        commit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "commit"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"commit")) ::
              Data.ProtoLens.FieldDescriptor Version
        commitHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "commit_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"commitHash")) ::
              Data.ProtoLens.FieldDescriptor Version
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor Version
        appMajor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "app_major"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"appMajor")) ::
              Data.ProtoLens.FieldDescriptor Version
        appMinor__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "app_minor"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"appMinor")) ::
              Data.ProtoLens.FieldDescriptor Version
        appPatch__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "app_patch"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"appPatch")) ::
              Data.ProtoLens.FieldDescriptor Version
        appPreRelease__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "app_pre_release"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"appPreRelease")) ::
              Data.ProtoLens.FieldDescriptor Version
        buildTags__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "build_tags"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"buildTags")) ::
              Data.ProtoLens.FieldDescriptor Version
        goVersion__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "go_version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"goVersion")) ::
              Data.ProtoLens.FieldDescriptor Version
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, commit__field_descriptor),
           (Data.ProtoLens.Tag 2, commitHash__field_descriptor),
           (Data.ProtoLens.Tag 3, version__field_descriptor),
           (Data.ProtoLens.Tag 4, appMajor__field_descriptor),
           (Data.ProtoLens.Tag 5, appMinor__field_descriptor),
           (Data.ProtoLens.Tag 6, appPatch__field_descriptor),
           (Data.ProtoLens.Tag 7, appPreRelease__field_descriptor),
           (Data.ProtoLens.Tag 8, buildTags__field_descriptor),
           (Data.ProtoLens.Tag 9, goVersion__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Version'_unknownFields
        (\ x__ y__ -> x__ {_Version'_unknownFields = y__})
  defMessage
    = Version'_constructor
        {_Version'commit = Data.ProtoLens.fieldDefault,
         _Version'commitHash = Data.ProtoLens.fieldDefault,
         _Version'version = Data.ProtoLens.fieldDefault,
         _Version'appMajor = Data.ProtoLens.fieldDefault,
         _Version'appMinor = Data.ProtoLens.fieldDefault,
         _Version'appPatch = Data.ProtoLens.fieldDefault,
         _Version'appPreRelease = Data.ProtoLens.fieldDefault,
         _Version'buildTags = Data.Vector.Generic.empty,
         _Version'goVersion = Data.ProtoLens.fieldDefault,
         _Version'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Version
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser Version
        loop x mutable'buildTags
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'buildTags <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'buildTags)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'buildTags") frozen'buildTags x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "commit"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"commit") y x)
                                  mutable'buildTags
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "commit_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"commitHash") y x)
                                  mutable'buildTags
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
                                  mutable'buildTags
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "app_major"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"appMajor") y x)
                                  mutable'buildTags
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "app_minor"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"appMinor") y x)
                                  mutable'buildTags
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "app_patch"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"appPatch") y x)
                                  mutable'buildTags
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "app_pre_release"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"appPreRelease") y x)
                                  mutable'buildTags
                        66
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "build_tags"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'buildTags y)
                                loop x v
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "go_version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"goVersion") y x)
                                  mutable'buildTags
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'buildTags
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'buildTags <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'buildTags)
          "Version"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"commit") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"commitHash") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"appMajor") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (let
                            _v = Lens.Family2.view (Data.ProtoLens.Field.field @"appMinor") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"appPatch") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"appPreRelease") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                        ((Prelude..)
                                           (\ bs
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                      (Prelude.fromIntegral
                                                         (Data.ByteString.length bs)))
                                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                           Data.Text.Encoding.encodeUtf8 _v))
                               ((Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                     (\ _v
                                        -> (Data.Monoid.<>)
                                             (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                             ((Prelude..)
                                                (\ bs
                                                   -> (Data.Monoid.<>)
                                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                           (Prelude.fromIntegral
                                                              (Data.ByteString.length bs)))
                                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                                Data.Text.Encoding.encodeUtf8 _v))
                                     (Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"vec'buildTags") _x))
                                  ((Data.Monoid.<>)
                                     (let
                                        _v
                                          = Lens.Family2.view
                                              (Data.ProtoLens.Field.field @"goVersion") _x
                                      in
                                        if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                            Data.Monoid.mempty
                                        else
                                            (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                              ((Prelude..)
                                                 (\ bs
                                                    -> (Data.Monoid.<>)
                                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                            (Prelude.fromIntegral
                                                               (Data.ByteString.length bs)))
                                                         (Data.ProtoLens.Encoding.Bytes.putBytes
                                                            bs))
                                                 Data.Text.Encoding.encodeUtf8 _v))
                                     (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                        (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))))
instance Control.DeepSeq.NFData Version where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Version'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Version'commit x__)
                (Control.DeepSeq.deepseq
                   (_Version'commitHash x__)
                   (Control.DeepSeq.deepseq
                      (_Version'version x__)
                      (Control.DeepSeq.deepseq
                         (_Version'appMajor x__)
                         (Control.DeepSeq.deepseq
                            (_Version'appMinor x__)
                            (Control.DeepSeq.deepseq
                               (_Version'appPatch x__)
                               (Control.DeepSeq.deepseq
                                  (_Version'appPreRelease x__)
                                  (Control.DeepSeq.deepseq
                                     (_Version'buildTags x__)
                                     (Control.DeepSeq.deepseq (_Version'goVersion x__) ())))))))))
{- | Fields :
      -}
data VersionRequest
  = VersionRequest'_constructor {_VersionRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show VersionRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out VersionRequest
instance Data.ProtoLens.Message VersionRequest where
  messageName _ = Data.Text.pack "verrpc.VersionRequest"
  packedMessageDescriptor _
    = "\n\
      \\SOVersionRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _VersionRequest'_unknownFields
        (\ x__ y__ -> x__ {_VersionRequest'_unknownFields = y__})
  defMessage
    = VersionRequest'_constructor {_VersionRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          VersionRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser VersionRequest
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "VersionRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData VersionRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_VersionRequest'_unknownFields x__) ()
data Versioner = Versioner {}
instance Data.ProtoLens.Service.Types.Service Versioner where
  type ServiceName Versioner = "Versioner"
  type ServicePackage Versioner = "verrpc"
  type ServiceMethods Versioner = '["getVersion"]
  packedServiceDescriptor _
    = "\n\
      \\tVersioner\DC25\n\
      \\n\
      \GetVersion\DC2\SYN.verrpc.VersionRequest\SUB\SI.verrpc.Version"
instance Data.ProtoLens.Service.Types.HasMethodImpl Versioner "getVersion" where
  type MethodName Versioner "getVersion" = "GetVersion"
  type MethodInput Versioner "getVersion" = VersionRequest
  type MethodOutput Versioner "getVersion" = Version
  type MethodStreamingType Versioner "getVersion" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC3verrpc/verrpc.proto\DC2\ACKverrpc\"\DLE\n\
    \\SOVersionRequest\"\153\STX\n\
    \\aVersion\DC2\SYN\n\
    \\ACKcommit\CAN\SOH \SOH(\tR\ACKcommit\DC2\US\n\
    \\vcommit_hash\CAN\STX \SOH(\tR\n\
    \commitHash\DC2\CAN\n\
    \\aversion\CAN\ETX \SOH(\tR\aversion\DC2\ESC\n\
    \\tapp_major\CAN\EOT \SOH(\rR\bappMajor\DC2\ESC\n\
    \\tapp_minor\CAN\ENQ \SOH(\rR\bappMinor\DC2\ESC\n\
    \\tapp_patch\CAN\ACK \SOH(\rR\bappPatch\DC2&\n\
    \\SIapp_pre_release\CAN\a \SOH(\tR\rappPreRelease\DC2\GS\n\
    \\n\
    \build_tags\CAN\b \ETX(\tR\tbuildTags\DC2\GS\n\
    \\n\
    \go_version\CAN\t \SOH(\tR\tgoVersion2B\n\
    \\tVersioner\DC25\n\
    \\n\
    \GetVersion\DC2\SYN.verrpc.VersionRequest\SUB\SI.verrpc.VersionB.Z,github.com/lightningnetwork/lnd/lnrpc/verrpcJ\170\n\
    \\n\
    \\ACK\DC2\EOT\NUL\NUL.\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\SI\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULC\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULC\n\
    \\136\SOH\n\
    \\STX\ACK\NUL\DC2\EOT\b\NUL\SO\SOH\SUB| Versioner is a service that can be used to get information about the version\n\
    \ and build information of the running daemon.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\b\b\DC1\n\
    \s\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\r\EOT6\SUBf lncli: `version`\n\
    \GetVersion returns the current version and build information of the running\n\
    \daemon.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\r\b\DC2\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\r\DC4\"\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\r-4\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\DLE\NUL\DC1\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\DLE\b\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\DC3\NUL.\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\DC3\b\SI\n\
    \<\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\NAK\EOT\SYN\SUB/ A verbose description of the daemon's commit.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\NAK\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\NAK\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\NAK\DC4\NAK\n\
    \E\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\CAN\EOT\ESC\SUB8 The SHA1 commit hash that the daemon is compiled with.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\CAN\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\CAN\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\CAN\EM\SUB\n\
    \$\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\ESC\EOT\ETB\SUB\ETB The semantic version.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX\ESC\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\ESC\v\DC2\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\ESC\NAK\SYN\n\
    \-\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETX\RS\EOT\EM\SUB  The major application version.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ENQ\DC2\ETX\RS\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETX\RS\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETX\RS\ETB\CAN\n\
    \-\n\
    \\EOT\EOT\SOH\STX\EOT\DC2\ETX!\EOT\EM\SUB  The minor application version.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ENQ\DC2\ETX!\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\SOH\DC2\ETX!\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\EOT\ETX\DC2\ETX!\ETB\CAN\n\
    \,\n\
    \\EOT\EOT\SOH\STX\ENQ\DC2\ETX$\EOT\EM\SUB\US The application patch number.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ENQ\DC2\ETX$\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\SOH\DC2\ETX$\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ENQ\ETX\DC2\ETX$\ETB\CAN\n\
    \D\n\
    \\EOT\EOT\SOH\STX\ACK\DC2\ETX'\EOT\US\SUB7 The application pre-release modifier, possibly empty.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ENQ\DC2\ETX'\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\SOH\DC2\ETX'\v\SUB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ACK\ETX\DC2\ETX'\GS\RS\n\
    \L\n\
    \\EOT\EOT\SOH\STX\a\DC2\ETX*\EOT#\SUB? The list of build tags that were supplied during compilation.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\EOT\DC2\ETX*\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ENQ\DC2\ETX*\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\SOH\DC2\ETX*\DC4\RS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\a\ETX\DC2\ETX*!\"\n\
    \>\n\
    \\EOT\EOT\SOH\STX\b\DC2\ETX-\EOT\SUB\SUB1 The version of go that compiled the executable.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ENQ\DC2\ETX-\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\SOH\DC2\ETX-\v\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\b\ETX\DC2\ETX-\CAN\EMb\ACKproto3"