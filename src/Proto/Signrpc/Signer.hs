{- This file was auto-generated from signrpc/signer.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Signrpc.Signer (
        Signer(..), InputScript(), InputScriptResp(), KeyDescriptor(),
        KeyLocator(), SharedKeyRequest(), SharedKeyResponse(),
        SignDescriptor(), SignMessageReq(), SignMessageResp(), SignReq(),
        SignResp(), TxOut(), VerifyMessageReq(), VerifyMessageResp()
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
     
         * 'Proto.Signrpc.Signer_Fields.witness' @:: Lens' InputScript [Data.ByteString.ByteString]@
         * 'Proto.Signrpc.Signer_Fields.vec'witness' @:: Lens' InputScript (Data.Vector.Vector Data.ByteString.ByteString)@
         * 'Proto.Signrpc.Signer_Fields.sigScript' @:: Lens' InputScript Data.ByteString.ByteString@ -}
data InputScript
  = InputScript'_constructor {_InputScript'witness :: !(Data.Vector.Vector Data.ByteString.ByteString),
                              _InputScript'sigScript :: !Data.ByteString.ByteString,
                              _InputScript'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show InputScript where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out InputScript
instance Data.ProtoLens.Field.HasField InputScript "witness" [Data.ByteString.ByteString] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InputScript'witness
           (\ x__ y__ -> x__ {_InputScript'witness = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField InputScript "vec'witness" (Data.Vector.Vector Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InputScript'witness
           (\ x__ y__ -> x__ {_InputScript'witness = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InputScript "sigScript" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InputScript'sigScript
           (\ x__ y__ -> x__ {_InputScript'sigScript = y__}))
        Prelude.id
instance Data.ProtoLens.Message InputScript where
  messageName _ = Data.Text.pack "signrpc.InputScript"
  packedMessageDescriptor _
    = "\n\
      \\vInputScript\DC2\CAN\n\
      \\awitness\CAN\SOH \ETX(\fR\awitness\DC2\GS\n\
      \\n\
      \sig_script\CAN\STX \SOH(\fR\tsigScript"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        witness__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "witness"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"witness")) ::
              Data.ProtoLens.FieldDescriptor InputScript
        sigScript__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sig_script"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sigScript")) ::
              Data.ProtoLens.FieldDescriptor InputScript
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, witness__field_descriptor),
           (Data.ProtoLens.Tag 2, sigScript__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _InputScript'_unknownFields
        (\ x__ y__ -> x__ {_InputScript'_unknownFields = y__})
  defMessage
    = InputScript'_constructor
        {_InputScript'witness = Data.Vector.Generic.empty,
         _InputScript'sigScript = Data.ProtoLens.fieldDefault,
         _InputScript'_unknownFields = []}
  parseMessage
    = let
        loop ::
          InputScript
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.ByteString.ByteString
             -> Data.ProtoLens.Encoding.Bytes.Parser InputScript
        loop x mutable'witness
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'witness <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'witness)
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
                              (Data.ProtoLens.Field.field @"vec'witness") frozen'witness x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getBytes
                                              (Prelude.fromIntegral len))
                                        "witness"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'witness y)
                                loop x v
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "sig_script"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"sigScript") y x)
                                  mutable'witness
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'witness
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'witness <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'witness)
          "InputScript"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'witness") _x))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sigScript") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData InputScript where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_InputScript'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_InputScript'witness x__)
                (Control.DeepSeq.deepseq (_InputScript'sigScript x__) ()))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.inputScripts' @:: Lens' InputScriptResp [InputScript]@
         * 'Proto.Signrpc.Signer_Fields.vec'inputScripts' @:: Lens' InputScriptResp (Data.Vector.Vector InputScript)@ -}
data InputScriptResp
  = InputScriptResp'_constructor {_InputScriptResp'inputScripts :: !(Data.Vector.Vector InputScript),
                                  _InputScriptResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show InputScriptResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out InputScriptResp
instance Data.ProtoLens.Field.HasField InputScriptResp "inputScripts" [InputScript] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InputScriptResp'inputScripts
           (\ x__ y__ -> x__ {_InputScriptResp'inputScripts = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField InputScriptResp "vec'inputScripts" (Data.Vector.Vector InputScript) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InputScriptResp'inputScripts
           (\ x__ y__ -> x__ {_InputScriptResp'inputScripts = y__}))
        Prelude.id
instance Data.ProtoLens.Message InputScriptResp where
  messageName _ = Data.Text.pack "signrpc.InputScriptResp"
  packedMessageDescriptor _
    = "\n\
      \\SIInputScriptResp\DC29\n\
      \\rinput_scripts\CAN\SOH \ETX(\v2\DC4.signrpc.InputScriptR\finputScripts"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        inputScripts__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "input_scripts"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor InputScript)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"inputScripts")) ::
              Data.ProtoLens.FieldDescriptor InputScriptResp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, inputScripts__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _InputScriptResp'_unknownFields
        (\ x__ y__ -> x__ {_InputScriptResp'_unknownFields = y__})
  defMessage
    = InputScriptResp'_constructor
        {_InputScriptResp'inputScripts = Data.Vector.Generic.empty,
         _InputScriptResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          InputScriptResp
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld InputScript
             -> Data.ProtoLens.Encoding.Bytes.Parser InputScriptResp
        loop x mutable'inputScripts
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'inputScripts <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                               (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                  mutable'inputScripts)
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
                              (Data.ProtoLens.Field.field @"vec'inputScripts")
                              frozen'inputScripts x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "input_scripts"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'inputScripts y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'inputScripts
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'inputScripts <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'inputScripts)
          "InputScriptResp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'inputScripts") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData InputScriptResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_InputScriptResp'_unknownFields x__)
             (Control.DeepSeq.deepseq (_InputScriptResp'inputScripts x__) ())
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.rawKeyBytes' @:: Lens' KeyDescriptor Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.keyLoc' @:: Lens' KeyDescriptor KeyLocator@
         * 'Proto.Signrpc.Signer_Fields.maybe'keyLoc' @:: Lens' KeyDescriptor (Prelude.Maybe KeyLocator)@ -}
data KeyDescriptor
  = KeyDescriptor'_constructor {_KeyDescriptor'rawKeyBytes :: !Data.ByteString.ByteString,
                                _KeyDescriptor'keyLoc :: !(Prelude.Maybe KeyLocator),
                                _KeyDescriptor'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show KeyDescriptor where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out KeyDescriptor
instance Data.ProtoLens.Field.HasField KeyDescriptor "rawKeyBytes" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyDescriptor'rawKeyBytes
           (\ x__ y__ -> x__ {_KeyDescriptor'rawKeyBytes = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField KeyDescriptor "keyLoc" KeyLocator where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyDescriptor'keyLoc
           (\ x__ y__ -> x__ {_KeyDescriptor'keyLoc = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField KeyDescriptor "maybe'keyLoc" (Prelude.Maybe KeyLocator) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyDescriptor'keyLoc
           (\ x__ y__ -> x__ {_KeyDescriptor'keyLoc = y__}))
        Prelude.id
instance Data.ProtoLens.Message KeyDescriptor where
  messageName _ = Data.Text.pack "signrpc.KeyDescriptor"
  packedMessageDescriptor _
    = "\n\
      \\rKeyDescriptor\DC2\"\n\
      \\rraw_key_bytes\CAN\SOH \SOH(\fR\vrawKeyBytes\DC2,\n\
      \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLoc"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rawKeyBytes__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_key_bytes"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rawKeyBytes")) ::
              Data.ProtoLens.FieldDescriptor KeyDescriptor
        keyLoc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_loc"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor KeyLocator)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'keyLoc")) ::
              Data.ProtoLens.FieldDescriptor KeyDescriptor
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, rawKeyBytes__field_descriptor),
           (Data.ProtoLens.Tag 2, keyLoc__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _KeyDescriptor'_unknownFields
        (\ x__ y__ -> x__ {_KeyDescriptor'_unknownFields = y__})
  defMessage
    = KeyDescriptor'_constructor
        {_KeyDescriptor'rawKeyBytes = Data.ProtoLens.fieldDefault,
         _KeyDescriptor'keyLoc = Prelude.Nothing,
         _KeyDescriptor'_unknownFields = []}
  parseMessage
    = let
        loop ::
          KeyDescriptor -> Data.ProtoLens.Encoding.Bytes.Parser KeyDescriptor
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "raw_key_bytes"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"rawKeyBytes") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key_loc"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"keyLoc") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "KeyDescriptor"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"rawKeyBytes") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'keyLoc") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData KeyDescriptor where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_KeyDescriptor'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_KeyDescriptor'rawKeyBytes x__)
                (Control.DeepSeq.deepseq (_KeyDescriptor'keyLoc x__) ()))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.keyFamily' @:: Lens' KeyLocator Data.Int.Int32@
         * 'Proto.Signrpc.Signer_Fields.keyIndex' @:: Lens' KeyLocator Data.Int.Int32@ -}
data KeyLocator
  = KeyLocator'_constructor {_KeyLocator'keyFamily :: !Data.Int.Int32,
                             _KeyLocator'keyIndex :: !Data.Int.Int32,
                             _KeyLocator'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show KeyLocator where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out KeyLocator
instance Data.ProtoLens.Field.HasField KeyLocator "keyFamily" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyLocator'keyFamily
           (\ x__ y__ -> x__ {_KeyLocator'keyFamily = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField KeyLocator "keyIndex" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _KeyLocator'keyIndex
           (\ x__ y__ -> x__ {_KeyLocator'keyIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Message KeyLocator where
  messageName _ = Data.Text.pack "signrpc.KeyLocator"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \KeyLocator\DC2\GS\n\
      \\n\
      \key_family\CAN\SOH \SOH(\ENQR\tkeyFamily\DC2\ESC\n\
      \\tkey_index\CAN\STX \SOH(\ENQR\bkeyIndex"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        keyFamily__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_family"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keyFamily")) ::
              Data.ProtoLens.FieldDescriptor KeyLocator
        keyIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"keyIndex")) ::
              Data.ProtoLens.FieldDescriptor KeyLocator
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, keyFamily__field_descriptor),
           (Data.ProtoLens.Tag 2, keyIndex__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _KeyLocator'_unknownFields
        (\ x__ y__ -> x__ {_KeyLocator'_unknownFields = y__})
  defMessage
    = KeyLocator'_constructor
        {_KeyLocator'keyFamily = Data.ProtoLens.fieldDefault,
         _KeyLocator'keyIndex = Data.ProtoLens.fieldDefault,
         _KeyLocator'_unknownFields = []}
  parseMessage
    = let
        loop ::
          KeyLocator -> Data.ProtoLens.Encoding.Bytes.Parser KeyLocator
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
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "key_family"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"keyFamily") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "key_index"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"keyIndex") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "KeyLocator"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"keyFamily") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"keyIndex") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData KeyLocator where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_KeyLocator'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_KeyLocator'keyFamily x__)
                (Control.DeepSeq.deepseq (_KeyLocator'keyIndex x__) ()))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.ephemeralPubkey' @:: Lens' SharedKeyRequest Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.keyLoc' @:: Lens' SharedKeyRequest KeyLocator@
         * 'Proto.Signrpc.Signer_Fields.maybe'keyLoc' @:: Lens' SharedKeyRequest (Prelude.Maybe KeyLocator)@
         * 'Proto.Signrpc.Signer_Fields.keyDesc' @:: Lens' SharedKeyRequest KeyDescriptor@
         * 'Proto.Signrpc.Signer_Fields.maybe'keyDesc' @:: Lens' SharedKeyRequest (Prelude.Maybe KeyDescriptor)@ -}
data SharedKeyRequest
  = SharedKeyRequest'_constructor {_SharedKeyRequest'ephemeralPubkey :: !Data.ByteString.ByteString,
                                   _SharedKeyRequest'keyLoc :: !(Prelude.Maybe KeyLocator),
                                   _SharedKeyRequest'keyDesc :: !(Prelude.Maybe KeyDescriptor),
                                   _SharedKeyRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SharedKeyRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SharedKeyRequest
instance Data.ProtoLens.Field.HasField SharedKeyRequest "ephemeralPubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyRequest'ephemeralPubkey
           (\ x__ y__ -> x__ {_SharedKeyRequest'ephemeralPubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SharedKeyRequest "keyLoc" KeyLocator where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyRequest'keyLoc
           (\ x__ y__ -> x__ {_SharedKeyRequest'keyLoc = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SharedKeyRequest "maybe'keyLoc" (Prelude.Maybe KeyLocator) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyRequest'keyLoc
           (\ x__ y__ -> x__ {_SharedKeyRequest'keyLoc = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SharedKeyRequest "keyDesc" KeyDescriptor where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyRequest'keyDesc
           (\ x__ y__ -> x__ {_SharedKeyRequest'keyDesc = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SharedKeyRequest "maybe'keyDesc" (Prelude.Maybe KeyDescriptor) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyRequest'keyDesc
           (\ x__ y__ -> x__ {_SharedKeyRequest'keyDesc = y__}))
        Prelude.id
instance Data.ProtoLens.Message SharedKeyRequest where
  messageName _ = Data.Text.pack "signrpc.SharedKeyRequest"
  packedMessageDescriptor _
    = "\n\
      \\DLESharedKeyRequest\DC2)\n\
      \\DLEephemeral_pubkey\CAN\SOH \SOH(\fR\SIephemeralPubkey\DC20\n\
      \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLocB\STX\CAN\SOH\DC21\n\
      \\bkey_desc\CAN\ETX \SOH(\v2\SYN.signrpc.KeyDescriptorR\akeyDesc"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        ephemeralPubkey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "ephemeral_pubkey"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"ephemeralPubkey")) ::
              Data.ProtoLens.FieldDescriptor SharedKeyRequest
        keyLoc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_loc"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor KeyLocator)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'keyLoc")) ::
              Data.ProtoLens.FieldDescriptor SharedKeyRequest
        keyDesc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_desc"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor KeyDescriptor)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'keyDesc")) ::
              Data.ProtoLens.FieldDescriptor SharedKeyRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, ephemeralPubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, keyLoc__field_descriptor),
           (Data.ProtoLens.Tag 3, keyDesc__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SharedKeyRequest'_unknownFields
        (\ x__ y__ -> x__ {_SharedKeyRequest'_unknownFields = y__})
  defMessage
    = SharedKeyRequest'_constructor
        {_SharedKeyRequest'ephemeralPubkey = Data.ProtoLens.fieldDefault,
         _SharedKeyRequest'keyLoc = Prelude.Nothing,
         _SharedKeyRequest'keyDesc = Prelude.Nothing,
         _SharedKeyRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SharedKeyRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser SharedKeyRequest
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "ephemeral_pubkey"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"ephemeralPubkey") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key_loc"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"keyLoc") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key_desc"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"keyDesc") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SharedKeyRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"ephemeralPubkey") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'keyLoc") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'keyDesc") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData SharedKeyRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SharedKeyRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SharedKeyRequest'ephemeralPubkey x__)
                (Control.DeepSeq.deepseq
                   (_SharedKeyRequest'keyLoc x__)
                   (Control.DeepSeq.deepseq (_SharedKeyRequest'keyDesc x__) ())))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.sharedKey' @:: Lens' SharedKeyResponse Data.ByteString.ByteString@ -}
data SharedKeyResponse
  = SharedKeyResponse'_constructor {_SharedKeyResponse'sharedKey :: !Data.ByteString.ByteString,
                                    _SharedKeyResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SharedKeyResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SharedKeyResponse
instance Data.ProtoLens.Field.HasField SharedKeyResponse "sharedKey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SharedKeyResponse'sharedKey
           (\ x__ y__ -> x__ {_SharedKeyResponse'sharedKey = y__}))
        Prelude.id
instance Data.ProtoLens.Message SharedKeyResponse where
  messageName _ = Data.Text.pack "signrpc.SharedKeyResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC1SharedKeyResponse\DC2\GS\n\
      \\n\
      \shared_key\CAN\SOH \SOH(\fR\tsharedKey"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        sharedKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "shared_key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sharedKey")) ::
              Data.ProtoLens.FieldDescriptor SharedKeyResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, sharedKey__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SharedKeyResponse'_unknownFields
        (\ x__ y__ -> x__ {_SharedKeyResponse'_unknownFields = y__})
  defMessage
    = SharedKeyResponse'_constructor
        {_SharedKeyResponse'sharedKey = Data.ProtoLens.fieldDefault,
         _SharedKeyResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SharedKeyResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser SharedKeyResponse
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "shared_key"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"sharedKey") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SharedKeyResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sharedKey") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SharedKeyResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SharedKeyResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SharedKeyResponse'sharedKey x__) ())
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.keyDesc' @:: Lens' SignDescriptor KeyDescriptor@
         * 'Proto.Signrpc.Signer_Fields.maybe'keyDesc' @:: Lens' SignDescriptor (Prelude.Maybe KeyDescriptor)@
         * 'Proto.Signrpc.Signer_Fields.singleTweak' @:: Lens' SignDescriptor Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.doubleTweak' @:: Lens' SignDescriptor Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.witnessScript' @:: Lens' SignDescriptor Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.output' @:: Lens' SignDescriptor TxOut@
         * 'Proto.Signrpc.Signer_Fields.maybe'output' @:: Lens' SignDescriptor (Prelude.Maybe TxOut)@
         * 'Proto.Signrpc.Signer_Fields.sighash' @:: Lens' SignDescriptor Data.Word.Word32@
         * 'Proto.Signrpc.Signer_Fields.inputIndex' @:: Lens' SignDescriptor Data.Int.Int32@ -}
data SignDescriptor
  = SignDescriptor'_constructor {_SignDescriptor'keyDesc :: !(Prelude.Maybe KeyDescriptor),
                                 _SignDescriptor'singleTweak :: !Data.ByteString.ByteString,
                                 _SignDescriptor'doubleTweak :: !Data.ByteString.ByteString,
                                 _SignDescriptor'witnessScript :: !Data.ByteString.ByteString,
                                 _SignDescriptor'output :: !(Prelude.Maybe TxOut),
                                 _SignDescriptor'sighash :: !Data.Word.Word32,
                                 _SignDescriptor'inputIndex :: !Data.Int.Int32,
                                 _SignDescriptor'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SignDescriptor where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SignDescriptor
instance Data.ProtoLens.Field.HasField SignDescriptor "keyDesc" KeyDescriptor where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'keyDesc
           (\ x__ y__ -> x__ {_SignDescriptor'keyDesc = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SignDescriptor "maybe'keyDesc" (Prelude.Maybe KeyDescriptor) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'keyDesc
           (\ x__ y__ -> x__ {_SignDescriptor'keyDesc = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "singleTweak" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'singleTweak
           (\ x__ y__ -> x__ {_SignDescriptor'singleTweak = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "doubleTweak" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'doubleTweak
           (\ x__ y__ -> x__ {_SignDescriptor'doubleTweak = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "witnessScript" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'witnessScript
           (\ x__ y__ -> x__ {_SignDescriptor'witnessScript = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "output" TxOut where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'output
           (\ x__ y__ -> x__ {_SignDescriptor'output = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SignDescriptor "maybe'output" (Prelude.Maybe TxOut) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'output
           (\ x__ y__ -> x__ {_SignDescriptor'output = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "sighash" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'sighash
           (\ x__ y__ -> x__ {_SignDescriptor'sighash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignDescriptor "inputIndex" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignDescriptor'inputIndex
           (\ x__ y__ -> x__ {_SignDescriptor'inputIndex = y__}))
        Prelude.id
instance Data.ProtoLens.Message SignDescriptor where
  messageName _ = Data.Text.pack "signrpc.SignDescriptor"
  packedMessageDescriptor _
    = "\n\
      \\SOSignDescriptor\DC21\n\
      \\bkey_desc\CAN\SOH \SOH(\v2\SYN.signrpc.KeyDescriptorR\akeyDesc\DC2!\n\
      \\fsingle_tweak\CAN\STX \SOH(\fR\vsingleTweak\DC2!\n\
      \\fdouble_tweak\CAN\ETX \SOH(\fR\vdoubleTweak\DC2%\n\
      \\SOwitness_script\CAN\EOT \SOH(\fR\rwitnessScript\DC2&\n\
      \\ACKoutput\CAN\ENQ \SOH(\v2\SO.signrpc.TxOutR\ACKoutput\DC2\CAN\n\
      \\asighash\CAN\a \SOH(\rR\asighash\DC2\US\n\
      \\vinput_index\CAN\b \SOH(\ENQR\n\
      \inputIndex"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        keyDesc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_desc"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor KeyDescriptor)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'keyDesc")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        singleTweak__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "single_tweak"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"singleTweak")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        doubleTweak__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "double_tweak"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"doubleTweak")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        witnessScript__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "witness_script"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"witnessScript")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        output__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "output"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TxOut)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'output")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        sighash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sighash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"sighash")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
        inputIndex__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "input_index"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"inputIndex")) ::
              Data.ProtoLens.FieldDescriptor SignDescriptor
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, keyDesc__field_descriptor),
           (Data.ProtoLens.Tag 2, singleTweak__field_descriptor),
           (Data.ProtoLens.Tag 3, doubleTweak__field_descriptor),
           (Data.ProtoLens.Tag 4, witnessScript__field_descriptor),
           (Data.ProtoLens.Tag 5, output__field_descriptor),
           (Data.ProtoLens.Tag 7, sighash__field_descriptor),
           (Data.ProtoLens.Tag 8, inputIndex__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SignDescriptor'_unknownFields
        (\ x__ y__ -> x__ {_SignDescriptor'_unknownFields = y__})
  defMessage
    = SignDescriptor'_constructor
        {_SignDescriptor'keyDesc = Prelude.Nothing,
         _SignDescriptor'singleTweak = Data.ProtoLens.fieldDefault,
         _SignDescriptor'doubleTweak = Data.ProtoLens.fieldDefault,
         _SignDescriptor'witnessScript = Data.ProtoLens.fieldDefault,
         _SignDescriptor'output = Prelude.Nothing,
         _SignDescriptor'sighash = Data.ProtoLens.fieldDefault,
         _SignDescriptor'inputIndex = Data.ProtoLens.fieldDefault,
         _SignDescriptor'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SignDescriptor
          -> Data.ProtoLens.Encoding.Bytes.Parser SignDescriptor
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key_desc"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"keyDesc") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "single_tweak"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"singleTweak") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "double_tweak"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"doubleTweak") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "witness_script"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"witnessScript") y x)
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "output"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"output") y x)
                        56
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sighash"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"sighash") y x)
                        64
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "input_index"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"inputIndex") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SignDescriptor"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'keyDesc") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"singleTweak") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"doubleTweak") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"witnessScript") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'output") _x
                          of
                            Prelude.Nothing -> Data.Monoid.mempty
                            (Prelude.Just _v)
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                   ((Prelude..)
                                      (\ bs
                                         -> (Data.Monoid.<>)
                                              (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 (Prelude.fromIntegral (Data.ByteString.length bs)))
                                              (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                      Data.ProtoLens.encodeMessage _v))
                         ((Data.Monoid.<>)
                            (let
                               _v = Lens.Family2.view (Data.ProtoLens.Field.field @"sighash") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 56)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                        _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"inputIndex") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 64)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral _v))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData SignDescriptor where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SignDescriptor'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SignDescriptor'keyDesc x__)
                (Control.DeepSeq.deepseq
                   (_SignDescriptor'singleTweak x__)
                   (Control.DeepSeq.deepseq
                      (_SignDescriptor'doubleTweak x__)
                      (Control.DeepSeq.deepseq
                         (_SignDescriptor'witnessScript x__)
                         (Control.DeepSeq.deepseq
                            (_SignDescriptor'output x__)
                            (Control.DeepSeq.deepseq
                               (_SignDescriptor'sighash x__)
                               (Control.DeepSeq.deepseq (_SignDescriptor'inputIndex x__) ())))))))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.msg' @:: Lens' SignMessageReq Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.keyLoc' @:: Lens' SignMessageReq KeyLocator@
         * 'Proto.Signrpc.Signer_Fields.maybe'keyLoc' @:: Lens' SignMessageReq (Prelude.Maybe KeyLocator)@
         * 'Proto.Signrpc.Signer_Fields.doubleHash' @:: Lens' SignMessageReq Prelude.Bool@
         * 'Proto.Signrpc.Signer_Fields.compactSig' @:: Lens' SignMessageReq Prelude.Bool@ -}
data SignMessageReq
  = SignMessageReq'_constructor {_SignMessageReq'msg :: !Data.ByteString.ByteString,
                                 _SignMessageReq'keyLoc :: !(Prelude.Maybe KeyLocator),
                                 _SignMessageReq'doubleHash :: !Prelude.Bool,
                                 _SignMessageReq'compactSig :: !Prelude.Bool,
                                 _SignMessageReq'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SignMessageReq where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SignMessageReq
instance Data.ProtoLens.Field.HasField SignMessageReq "msg" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageReq'msg (\ x__ y__ -> x__ {_SignMessageReq'msg = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignMessageReq "keyLoc" KeyLocator where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageReq'keyLoc
           (\ x__ y__ -> x__ {_SignMessageReq'keyLoc = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SignMessageReq "maybe'keyLoc" (Prelude.Maybe KeyLocator) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageReq'keyLoc
           (\ x__ y__ -> x__ {_SignMessageReq'keyLoc = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignMessageReq "doubleHash" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageReq'doubleHash
           (\ x__ y__ -> x__ {_SignMessageReq'doubleHash = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignMessageReq "compactSig" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageReq'compactSig
           (\ x__ y__ -> x__ {_SignMessageReq'compactSig = y__}))
        Prelude.id
instance Data.ProtoLens.Message SignMessageReq where
  messageName _ = Data.Text.pack "signrpc.SignMessageReq"
  packedMessageDescriptor _
    = "\n\
      \\SOSignMessageReq\DC2\DLE\n\
      \\ETXmsg\CAN\SOH \SOH(\fR\ETXmsg\DC2,\n\
      \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLoc\DC2\US\n\
      \\vdouble_hash\CAN\ETX \SOH(\bR\n\
      \doubleHash\DC2\US\n\
      \\vcompact_sig\CAN\EOT \SOH(\bR\n\
      \compactSig"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        msg__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "msg"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"msg")) ::
              Data.ProtoLens.FieldDescriptor SignMessageReq
        keyLoc__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key_loc"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor KeyLocator)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'keyLoc")) ::
              Data.ProtoLens.FieldDescriptor SignMessageReq
        doubleHash__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "double_hash"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"doubleHash")) ::
              Data.ProtoLens.FieldDescriptor SignMessageReq
        compactSig__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "compact_sig"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"compactSig")) ::
              Data.ProtoLens.FieldDescriptor SignMessageReq
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, msg__field_descriptor),
           (Data.ProtoLens.Tag 2, keyLoc__field_descriptor),
           (Data.ProtoLens.Tag 3, doubleHash__field_descriptor),
           (Data.ProtoLens.Tag 4, compactSig__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SignMessageReq'_unknownFields
        (\ x__ y__ -> x__ {_SignMessageReq'_unknownFields = y__})
  defMessage
    = SignMessageReq'_constructor
        {_SignMessageReq'msg = Data.ProtoLens.fieldDefault,
         _SignMessageReq'keyLoc = Prelude.Nothing,
         _SignMessageReq'doubleHash = Data.ProtoLens.fieldDefault,
         _SignMessageReq'compactSig = Data.ProtoLens.fieldDefault,
         _SignMessageReq'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SignMessageReq
          -> Data.ProtoLens.Encoding.Bytes.Parser SignMessageReq
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "msg"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"msg") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key_loc"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"keyLoc") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "double_hash"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"doubleHash") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "compact_sig"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"compactSig") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SignMessageReq"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"msg") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'keyLoc") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"doubleHash") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"compactSig") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0) _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData SignMessageReq where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SignMessageReq'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SignMessageReq'msg x__)
                (Control.DeepSeq.deepseq
                   (_SignMessageReq'keyLoc x__)
                   (Control.DeepSeq.deepseq
                      (_SignMessageReq'doubleHash x__)
                      (Control.DeepSeq.deepseq (_SignMessageReq'compactSig x__) ()))))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.signature' @:: Lens' SignMessageResp Data.ByteString.ByteString@ -}
data SignMessageResp
  = SignMessageResp'_constructor {_SignMessageResp'signature :: !Data.ByteString.ByteString,
                                  _SignMessageResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SignMessageResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SignMessageResp
instance Data.ProtoLens.Field.HasField SignMessageResp "signature" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignMessageResp'signature
           (\ x__ y__ -> x__ {_SignMessageResp'signature = y__}))
        Prelude.id
instance Data.ProtoLens.Message SignMessageResp where
  messageName _ = Data.Text.pack "signrpc.SignMessageResp"
  packedMessageDescriptor _
    = "\n\
      \\SISignMessageResp\DC2\FS\n\
      \\tsignature\CAN\SOH \SOH(\fR\tsignature"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        signature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "signature"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"signature")) ::
              Data.ProtoLens.FieldDescriptor SignMessageResp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, signature__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SignMessageResp'_unknownFields
        (\ x__ y__ -> x__ {_SignMessageResp'_unknownFields = y__})
  defMessage
    = SignMessageResp'_constructor
        {_SignMessageResp'signature = Data.ProtoLens.fieldDefault,
         _SignMessageResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SignMessageResp
          -> Data.ProtoLens.Encoding.Bytes.Parser SignMessageResp
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "signature"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"signature") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SignMessageResp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"signature") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SignMessageResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SignMessageResp'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SignMessageResp'signature x__) ())
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.rawTxBytes' @:: Lens' SignReq Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.signDescs' @:: Lens' SignReq [SignDescriptor]@
         * 'Proto.Signrpc.Signer_Fields.vec'signDescs' @:: Lens' SignReq (Data.Vector.Vector SignDescriptor)@ -}
data SignReq
  = SignReq'_constructor {_SignReq'rawTxBytes :: !Data.ByteString.ByteString,
                          _SignReq'signDescs :: !(Data.Vector.Vector SignDescriptor),
                          _SignReq'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SignReq where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SignReq
instance Data.ProtoLens.Field.HasField SignReq "rawTxBytes" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignReq'rawTxBytes (\ x__ y__ -> x__ {_SignReq'rawTxBytes = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SignReq "signDescs" [SignDescriptor] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignReq'signDescs (\ x__ y__ -> x__ {_SignReq'signDescs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SignReq "vec'signDescs" (Data.Vector.Vector SignDescriptor) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignReq'signDescs (\ x__ y__ -> x__ {_SignReq'signDescs = y__}))
        Prelude.id
instance Data.ProtoLens.Message SignReq where
  messageName _ = Data.Text.pack "signrpc.SignReq"
  packedMessageDescriptor _
    = "\n\
      \\aSignReq\DC2 \n\
      \\fraw_tx_bytes\CAN\SOH \SOH(\fR\n\
      \rawTxBytes\DC26\n\
      \\n\
      \sign_descs\CAN\STX \ETX(\v2\ETB.signrpc.SignDescriptorR\tsignDescs"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rawTxBytes__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_tx_bytes"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"rawTxBytes")) ::
              Data.ProtoLens.FieldDescriptor SignReq
        signDescs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sign_descs"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SignDescriptor)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"signDescs")) ::
              Data.ProtoLens.FieldDescriptor SignReq
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, rawTxBytes__field_descriptor),
           (Data.ProtoLens.Tag 2, signDescs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SignReq'_unknownFields
        (\ x__ y__ -> x__ {_SignReq'_unknownFields = y__})
  defMessage
    = SignReq'_constructor
        {_SignReq'rawTxBytes = Data.ProtoLens.fieldDefault,
         _SignReq'signDescs = Data.Vector.Generic.empty,
         _SignReq'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SignReq
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld SignDescriptor
             -> Data.ProtoLens.Encoding.Bytes.Parser SignReq
        loop x mutable'signDescs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'signDescs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'signDescs)
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
                              (Data.ProtoLens.Field.field @"vec'signDescs") frozen'signDescs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "raw_tx_bytes"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"rawTxBytes") y x)
                                  mutable'signDescs
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "sign_descs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'signDescs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'signDescs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'signDescs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'signDescs)
          "SignReq"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"rawTxBytes") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'signDescs") _x))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SignReq where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SignReq'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SignReq'rawTxBytes x__)
                (Control.DeepSeq.deepseq (_SignReq'signDescs x__) ()))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.rawSigs' @:: Lens' SignResp [Data.ByteString.ByteString]@
         * 'Proto.Signrpc.Signer_Fields.vec'rawSigs' @:: Lens' SignResp (Data.Vector.Vector Data.ByteString.ByteString)@ -}
data SignResp
  = SignResp'_constructor {_SignResp'rawSigs :: !(Data.Vector.Vector Data.ByteString.ByteString),
                           _SignResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show SignResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out SignResp
instance Data.ProtoLens.Field.HasField SignResp "rawSigs" [Data.ByteString.ByteString] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignResp'rawSigs (\ x__ y__ -> x__ {_SignResp'rawSigs = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SignResp "vec'rawSigs" (Data.Vector.Vector Data.ByteString.ByteString) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SignResp'rawSigs (\ x__ y__ -> x__ {_SignResp'rawSigs = y__}))
        Prelude.id
instance Data.ProtoLens.Message SignResp where
  messageName _ = Data.Text.pack "signrpc.SignResp"
  packedMessageDescriptor _
    = "\n\
      \\bSignResp\DC2\EM\n\
      \\braw_sigs\CAN\SOH \ETX(\fR\arawSigs"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        rawSigs__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "raw_sigs"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"rawSigs")) ::
              Data.ProtoLens.FieldDescriptor SignResp
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, rawSigs__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SignResp'_unknownFields
        (\ x__ y__ -> x__ {_SignResp'_unknownFields = y__})
  defMessage
    = SignResp'_constructor
        {_SignResp'rawSigs = Data.Vector.Generic.empty,
         _SignResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SignResp
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.ByteString.ByteString
             -> Data.ProtoLens.Encoding.Bytes.Parser SignResp
        loop x mutable'rawSigs
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'rawSigs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'rawSigs)
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
                              (Data.ProtoLens.Field.field @"vec'rawSigs") frozen'rawSigs x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.getBytes
                                              (Prelude.fromIntegral len))
                                        "raw_sigs"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'rawSigs y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'rawSigs
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'rawSigs <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'rawSigs)
          "SignResp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'rawSigs") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData SignResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SignResp'_unknownFields x__)
             (Control.DeepSeq.deepseq (_SignResp'rawSigs x__) ())
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.value' @:: Lens' TxOut Data.Int.Int64@
         * 'Proto.Signrpc.Signer_Fields.pkScript' @:: Lens' TxOut Data.ByteString.ByteString@ -}
data TxOut
  = TxOut'_constructor {_TxOut'value :: !Data.Int.Int64,
                        _TxOut'pkScript :: !Data.ByteString.ByteString,
                        _TxOut'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show TxOut where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out TxOut
instance Data.ProtoLens.Field.HasField TxOut "value" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxOut'value (\ x__ y__ -> x__ {_TxOut'value = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TxOut "pkScript" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TxOut'pkScript (\ x__ y__ -> x__ {_TxOut'pkScript = y__}))
        Prelude.id
instance Data.ProtoLens.Message TxOut where
  messageName _ = Data.Text.pack "signrpc.TxOut"
  packedMessageDescriptor _
    = "\n\
      \\ENQTxOut\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue\DC2\ESC\n\
      \\tpk_script\CAN\STX \SOH(\fR\bpkScript"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor TxOut
        pkScript__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pk_script"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"pkScript")) ::
              Data.ProtoLens.FieldDescriptor TxOut
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, value__field_descriptor),
           (Data.ProtoLens.Tag 2, pkScript__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TxOut'_unknownFields
        (\ x__ y__ -> x__ {_TxOut'_unknownFields = y__})
  defMessage
    = TxOut'_constructor
        {_TxOut'value = Data.ProtoLens.fieldDefault,
         _TxOut'pkScript = Data.ProtoLens.fieldDefault,
         _TxOut'_unknownFields = []}
  parseMessage
    = let
        loop :: TxOut -> Data.ProtoLens.Encoding.Bytes.Parser TxOut
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
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "pk_script"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"pkScript") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "TxOut"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"pkScript") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData TxOut where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TxOut'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TxOut'value x__)
                (Control.DeepSeq.deepseq (_TxOut'pkScript x__) ()))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.msg' @:: Lens' VerifyMessageReq Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.signature' @:: Lens' VerifyMessageReq Data.ByteString.ByteString@
         * 'Proto.Signrpc.Signer_Fields.pubkey' @:: Lens' VerifyMessageReq Data.ByteString.ByteString@ -}
data VerifyMessageReq
  = VerifyMessageReq'_constructor {_VerifyMessageReq'msg :: !Data.ByteString.ByteString,
                                   _VerifyMessageReq'signature :: !Data.ByteString.ByteString,
                                   _VerifyMessageReq'pubkey :: !Data.ByteString.ByteString,
                                   _VerifyMessageReq'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show VerifyMessageReq where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out VerifyMessageReq
instance Data.ProtoLens.Field.HasField VerifyMessageReq "msg" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VerifyMessageReq'msg
           (\ x__ y__ -> x__ {_VerifyMessageReq'msg = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField VerifyMessageReq "signature" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VerifyMessageReq'signature
           (\ x__ y__ -> x__ {_VerifyMessageReq'signature = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField VerifyMessageReq "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VerifyMessageReq'pubkey
           (\ x__ y__ -> x__ {_VerifyMessageReq'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Message VerifyMessageReq where
  messageName _ = Data.Text.pack "signrpc.VerifyMessageReq"
  packedMessageDescriptor _
    = "\n\
      \\DLEVerifyMessageReq\DC2\DLE\n\
      \\ETXmsg\CAN\SOH \SOH(\fR\ETXmsg\DC2\FS\n\
      \\tsignature\CAN\STX \SOH(\fR\tsignature\DC2\SYN\n\
      \\ACKpubkey\CAN\ETX \SOH(\fR\ACKpubkey"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        msg__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "msg"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"msg")) ::
              Data.ProtoLens.FieldDescriptor VerifyMessageReq
        signature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "signature"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"signature")) ::
              Data.ProtoLens.FieldDescriptor VerifyMessageReq
        pubkey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pubkey"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"pubkey")) ::
              Data.ProtoLens.FieldDescriptor VerifyMessageReq
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, msg__field_descriptor),
           (Data.ProtoLens.Tag 2, signature__field_descriptor),
           (Data.ProtoLens.Tag 3, pubkey__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _VerifyMessageReq'_unknownFields
        (\ x__ y__ -> x__ {_VerifyMessageReq'_unknownFields = y__})
  defMessage
    = VerifyMessageReq'_constructor
        {_VerifyMessageReq'msg = Data.ProtoLens.fieldDefault,
         _VerifyMessageReq'signature = Data.ProtoLens.fieldDefault,
         _VerifyMessageReq'pubkey = Data.ProtoLens.fieldDefault,
         _VerifyMessageReq'_unknownFields = []}
  parseMessage
    = let
        loop ::
          VerifyMessageReq
          -> Data.ProtoLens.Encoding.Bytes.Parser VerifyMessageReq
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
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "msg"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"msg") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "signature"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"signature") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "pubkey"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"pubkey") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "VerifyMessageReq"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"msg") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"signature") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"pubkey") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData VerifyMessageReq where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_VerifyMessageReq'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_VerifyMessageReq'msg x__)
                (Control.DeepSeq.deepseq
                   (_VerifyMessageReq'signature x__)
                   (Control.DeepSeq.deepseq (_VerifyMessageReq'pubkey x__) ())))
{- | Fields :
     
         * 'Proto.Signrpc.Signer_Fields.valid' @:: Lens' VerifyMessageResp Prelude.Bool@ -}
data VerifyMessageResp
  = VerifyMessageResp'_constructor {_VerifyMessageResp'valid :: !Prelude.Bool,
                                    _VerifyMessageResp'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show VerifyMessageResp where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out VerifyMessageResp
instance Data.ProtoLens.Field.HasField VerifyMessageResp "valid" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VerifyMessageResp'valid
           (\ x__ y__ -> x__ {_VerifyMessageResp'valid = y__}))
        Prelude.id
instance Data.ProtoLens.Message VerifyMessageResp where
  messageName _ = Data.Text.pack "signrpc.VerifyMessageResp"
  packedMessageDescriptor _
    = "\n\
      \\DC1VerifyMessageResp\DC2\DC4\n\
      \\ENQvalid\CAN\SOH \SOH(\bR\ENQvalid"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        valid__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "valid"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"valid")) ::
              Data.ProtoLens.FieldDescriptor VerifyMessageResp
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, valid__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _VerifyMessageResp'_unknownFields
        (\ x__ y__ -> x__ {_VerifyMessageResp'_unknownFields = y__})
  defMessage
    = VerifyMessageResp'_constructor
        {_VerifyMessageResp'valid = Data.ProtoLens.fieldDefault,
         _VerifyMessageResp'_unknownFields = []}
  parseMessage
    = let
        loop ::
          VerifyMessageResp
          -> Data.ProtoLens.Encoding.Bytes.Parser VerifyMessageResp
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
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "valid"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"valid") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "VerifyMessageResp"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"valid") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData VerifyMessageResp where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_VerifyMessageResp'_unknownFields x__)
             (Control.DeepSeq.deepseq (_VerifyMessageResp'valid x__) ())
data Signer = Signer {}
instance Data.ProtoLens.Service.Types.Service Signer where
  type ServiceName Signer = "Signer"
  type ServicePackage Signer = "signrpc"
  type ServiceMethods Signer = '["computeInputScript",
                                 "deriveSharedKey",
                                 "signMessage",
                                 "signOutputRaw",
                                 "verifyMessage"]
  packedServiceDescriptor _
    = "\n\
      \\ACKSigner\DC24\n\
      \\rSignOutputRaw\DC2\DLE.signrpc.SignReq\SUB\DC1.signrpc.SignResp\DC2@\n\
      \\DC2ComputeInputScript\DC2\DLE.signrpc.SignReq\SUB\CAN.signrpc.InputScriptResp\DC2@\n\
      \\vSignMessage\DC2\ETB.signrpc.SignMessageReq\SUB\CAN.signrpc.SignMessageResp\DC2F\n\
      \\rVerifyMessage\DC2\EM.signrpc.VerifyMessageReq\SUB\SUB.signrpc.VerifyMessageResp\DC2H\n\
      \\SIDeriveSharedKey\DC2\EM.signrpc.SharedKeyRequest\SUB\SUB.signrpc.SharedKeyResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl Signer "signOutputRaw" where
  type MethodName Signer "signOutputRaw" = "SignOutputRaw"
  type MethodInput Signer "signOutputRaw" = SignReq
  type MethodOutput Signer "signOutputRaw" = SignResp
  type MethodStreamingType Signer "signOutputRaw" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Signer "computeInputScript" where
  type MethodName Signer "computeInputScript" = "ComputeInputScript"
  type MethodInput Signer "computeInputScript" = SignReq
  type MethodOutput Signer "computeInputScript" = InputScriptResp
  type MethodStreamingType Signer "computeInputScript" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Signer "signMessage" where
  type MethodName Signer "signMessage" = "SignMessage"
  type MethodInput Signer "signMessage" = SignMessageReq
  type MethodOutput Signer "signMessage" = SignMessageResp
  type MethodStreamingType Signer "signMessage" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Signer "verifyMessage" where
  type MethodName Signer "verifyMessage" = "VerifyMessage"
  type MethodInput Signer "verifyMessage" = VerifyMessageReq
  type MethodOutput Signer "verifyMessage" = VerifyMessageResp
  type MethodStreamingType Signer "verifyMessage" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl Signer "deriveSharedKey" where
  type MethodName Signer "deriveSharedKey" = "DeriveSharedKey"
  type MethodInput Signer "deriveSharedKey" = SharedKeyRequest
  type MethodOutput Signer "deriveSharedKey" = SharedKeyResponse
  type MethodStreamingType Signer "deriveSharedKey" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC4signrpc/signer.proto\DC2\asignrpc\"H\n\
    \\n\
    \KeyLocator\DC2\GS\n\
    \\n\
    \key_family\CAN\SOH \SOH(\ENQR\tkeyFamily\DC2\ESC\n\
    \\tkey_index\CAN\STX \SOH(\ENQR\bkeyIndex\"a\n\
    \\rKeyDescriptor\DC2\"\n\
    \\rraw_key_bytes\CAN\SOH \SOH(\fR\vrawKeyBytes\DC2,\n\
    \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLoc\":\n\
    \\ENQTxOut\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue\DC2\ESC\n\
    \\tpk_script\CAN\STX \SOH(\fR\bpkScript\"\147\STX\n\
    \\SOSignDescriptor\DC21\n\
    \\bkey_desc\CAN\SOH \SOH(\v2\SYN.signrpc.KeyDescriptorR\akeyDesc\DC2!\n\
    \\fsingle_tweak\CAN\STX \SOH(\fR\vsingleTweak\DC2!\n\
    \\fdouble_tweak\CAN\ETX \SOH(\fR\vdoubleTweak\DC2%\n\
    \\SOwitness_script\CAN\EOT \SOH(\fR\rwitnessScript\DC2&\n\
    \\ACKoutput\CAN\ENQ \SOH(\v2\SO.signrpc.TxOutR\ACKoutput\DC2\CAN\n\
    \\asighash\CAN\a \SOH(\rR\asighash\DC2\US\n\
    \\vinput_index\CAN\b \SOH(\ENQR\n\
    \inputIndex\"c\n\
    \\aSignReq\DC2 \n\
    \\fraw_tx_bytes\CAN\SOH \SOH(\fR\n\
    \rawTxBytes\DC26\n\
    \\n\
    \sign_descs\CAN\STX \ETX(\v2\ETB.signrpc.SignDescriptorR\tsignDescs\"%\n\
    \\bSignResp\DC2\EM\n\
    \\braw_sigs\CAN\SOH \ETX(\fR\arawSigs\"F\n\
    \\vInputScript\DC2\CAN\n\
    \\awitness\CAN\SOH \ETX(\fR\awitness\DC2\GS\n\
    \\n\
    \sig_script\CAN\STX \SOH(\fR\tsigScript\"L\n\
    \\SIInputScriptResp\DC29\n\
    \\rinput_scripts\CAN\SOH \ETX(\v2\DC4.signrpc.InputScriptR\finputScripts\"\146\SOH\n\
    \\SOSignMessageReq\DC2\DLE\n\
    \\ETXmsg\CAN\SOH \SOH(\fR\ETXmsg\DC2,\n\
    \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLoc\DC2\US\n\
    \\vdouble_hash\CAN\ETX \SOH(\bR\n\
    \doubleHash\DC2\US\n\
    \\vcompact_sig\CAN\EOT \SOH(\bR\n\
    \compactSig\"/\n\
    \\SISignMessageResp\DC2\FS\n\
    \\tsignature\CAN\SOH \SOH(\fR\tsignature\"Z\n\
    \\DLEVerifyMessageReq\DC2\DLE\n\
    \\ETXmsg\CAN\SOH \SOH(\fR\ETXmsg\DC2\FS\n\
    \\tsignature\CAN\STX \SOH(\fR\tsignature\DC2\SYN\n\
    \\ACKpubkey\CAN\ETX \SOH(\fR\ACKpubkey\")\n\
    \\DC1VerifyMessageResp\DC2\DC4\n\
    \\ENQvalid\CAN\SOH \SOH(\bR\ENQvalid\"\162\SOH\n\
    \\DLESharedKeyRequest\DC2)\n\
    \\DLEephemeral_pubkey\CAN\SOH \SOH(\fR\SIephemeralPubkey\DC20\n\
    \\akey_loc\CAN\STX \SOH(\v2\DC3.signrpc.KeyLocatorR\ACKkeyLocB\STX\CAN\SOH\DC21\n\
    \\bkey_desc\CAN\ETX \SOH(\v2\SYN.signrpc.KeyDescriptorR\akeyDesc\"2\n\
    \\DC1SharedKeyResponse\DC2\GS\n\
    \\n\
    \shared_key\CAN\SOH \SOH(\fR\tsharedKey2\212\STX\n\
    \\ACKSigner\DC24\n\
    \\rSignOutputRaw\DC2\DLE.signrpc.SignReq\SUB\DC1.signrpc.SignResp\DC2@\n\
    \\DC2ComputeInputScript\DC2\DLE.signrpc.SignReq\SUB\CAN.signrpc.InputScriptResp\DC2@\n\
    \\vSignMessage\DC2\ETB.signrpc.SignMessageReq\SUB\CAN.signrpc.SignMessageResp\DC2F\n\
    \\rVerifyMessage\DC2\EM.signrpc.VerifyMessageReq\SUB\SUB.signrpc.VerifyMessageResp\DC2H\n\
    \\SIDeriveSharedKey\DC2\EM.signrpc.SharedKeyRequest\SUB\SUB.signrpc.SharedKeyResponseB/Z-github.com/lightningnetwork/lnd/lnrpc/signrpcJ\240@\n\
    \\a\DC2\ENQ\NUL\NUL\249\SOH\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\DLE\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULD\n\
    \i\n\
    \\STX\ACK\NUL\DC2\EOT\b\NUL@\SOH\SUB] Signer is a service that gives access to the signing functionality of the\n\
    \ daemon's wallet.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\b\b\SO\n\
    \\203\ETX\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\DC3\EOT3\SUB\189\ETX\n\
    \SignOutputRaw is a method that can be used to generated a signature for a\n\
    \set of inputs/outputs to a transaction. Each request specifies details\n\
    \concerning how the outputs should be signed, which keys they should be\n\
    \signed with, and also any optional tweaks. The return value is a fixed\n\
    \64-byte signature (the same format as we use on the wire in Lightning).\n\
    \\n\
    \If we are  unable to sign using the specified keys, then an error will be\n\
    \returned.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\DC3\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\DC3\ETB\RS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\DC3)1\n\
    \\155\EOT\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX!\EOT?\SUB\141\EOT\n\
    \ComputeInputScript generates a complete InputIndex for the passed\n\
    \transaction with the signature as defined within the passed SignDescriptor.\n\
    \This method should be capable of generating the proper input script for\n\
    \both regular p2wkh output and p2wkh outputs nested within a regular p2sh\n\
    \output.\n\
    \\n\
    \Note that when using this method to sign inputs belonging to the wallet,\n\
    \the only items of the SignDescriptor that need to be populated are pkScript\n\
    \in the TxOut field, the value in that same field, and finally the input\n\
    \index.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX!\b\SUB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX!\FS#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX!.=\n\
    \\164\STX\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX*\EOT?\SUB\150\STX\n\
    \SignMessage signs a message with the key specified in the key locator. The\n\
    \returned signature is fixed-size LN wire format encoded.\n\
    \\n\
    \The main difference to SignMessage in the main RPC is that a specific key is\n\
    \used to sign the message instead of the node identity private key.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX*\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX*\NAK#\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX*.=\n\
    \\176\STX\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX3\EOTE\SUB\162\STX\n\
    \VerifyMessage verifies a signature over a message using the public key\n\
    \provided. The signature must be fixed-size LN wire format encoded.\n\
    \\n\
    \The main difference to VerifyMessage in the main RPC is that the public key\n\
    \used to sign the message does not have to be a node known to the network.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX3\b\NAK\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX3\ETB'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX32C\n\
    \\143\EOT\n\
    \\EOT\ACK\NUL\STX\EOT\DC2\ETX?\EOTG\SUB\129\EOT\n\
    \DeriveSharedKey returns a shared secret key by performing Diffie-Hellman key\n\
    \derivation between the ephemeral public key in the request and the node's\n\
    \key specified in the key_desc parameter. Either a key locator or a raw\n\
    \public key is expected in the key_desc, if neither is supplied, defaults to\n\
    \the node's identity private key:\n\
    \P_shared = privKeyNode * ephemeralPubkey\n\
    \The resulting shared public key is serialized in the compressed format and\n\
    \hashed with sha256, resulting in the final key length of 256bit.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\SOH\DC2\ETX?\b\ETB\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\STX\DC2\ETX?\EM)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\ETX\DC2\ETX?4E\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOTB\NULH\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETXB\b\DC2\n\
    \2\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETXD\EOT\EM\SUB% The family of key being identified.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETXD\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETXD\n\
    \\DC4\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETXD\ETB\CAN\n\
    \=\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETXG\EOT\CAN\SUB0 The precise index of the key being identified.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETXG\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETXG\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETXG\SYN\ETB\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOTJ\NULV\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXJ\b\NAK\n\
    \\129\SOH\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETXO\EOT\FS\SUBt\n\
    \The raw bytes of the public key in the key pair being identified. Either\n\
    \this or the KeyLocator must be specified.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETXO\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETXO\n\
    \\ETB\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETXO\SUB\ESC\n\
    \\158\SOH\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXU\EOT\ESC\SUB\144\SOH\n\
    \The key locator that identifies which private key to use for signing.\n\
    \Either this or the raw bytes of the target public key must be specified.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETXU\EOT\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXU\SI\SYN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXU\EM\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOTX\NUL^\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETXX\b\r\n\
    \3\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETXZ\EOT\DC4\SUB& The value of the output being spent.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETXZ\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETXZ\n\
    \\SI\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETXZ\DC2\DC3\n\
    \4\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX]\EOT\CAN\SUB' The script of the output being spent.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX]\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX]\n\
    \\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX]\SYN\ETB\n\
    \\v\n\
    \\STX\EOT\ETX\DC2\ENQ`\NUL\152\SOH\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX`\b\SYN\n\
    \\151\ETX\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXj\EOT\US\SUB\137\ETX\n\
    \A descriptor that precisely describes *which* key to use for signing. This\n\
    \may provide the raw public key directly, or require the Signer to re-derive\n\
    \the key according to the populated derivation path.\n\
    \\n\
    \Note that if the key descriptor was obtained through walletrpc.DeriveKey,\n\
    \then the key locator MUST always be provided, since the derived keys are not\n\
    \persisted unlike with DeriveNextKey.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ACK\DC2\ETXj\EOT\DC1\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXj\DC2\SUB\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXj\GS\RS\n\
    \\166\STX\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETXs\EOT\ESC\SUB\152\STX\n\
    \A scalar value that will be added to the private key corresponding to the\n\
    \above public key to obtain the private key to be used to sign this input.\n\
    \This value is typically derived via the following computation:\n\
    \\n\
    \ derivedKey = privkey + sha256(perCommitmentPoint || pubKey) mod N\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\ETXs\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETXs\n\
    \\SYN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETXs\EM\SUB\n\
    \\131\EOT\n\
    \\EOT\EOT\ETX\STX\STX\DC2\EOT\128\SOH\EOT\ESC\SUB\244\ETX\n\
    \A private key that will be used in combination with its corresponding\n\
    \private key to derive the private key that is to be used to sign the target\n\
    \input. Within the Lightning protocol, this value is typically the\n\
    \commitment secret from a previously revoked commitment transaction. This\n\
    \value is in combination with two hash values, and the original private key\n\
    \to derive the private key to be used when signing.\n\
    \\n\
    \ k = (privKey*sha256(pubKey || tweakPub) +\n\
    \tweakPriv*sha256(tweakPub || pubKey)) mod N\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ENQ\DC2\EOT\128\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\EOT\128\SOH\n\
    \\SYN\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\EOT\128\SOH\EM\SUB\n\
    \\152\SOH\n\
    \\EOT\EOT\ETX\STX\ETX\DC2\EOT\134\SOH\EOT\GS\SUB\137\SOH\n\
    \The full script required to properly redeem the output.  This field will\n\
    \only be populated if a p2wsh or a p2sh output is being signed.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ENQ\DC2\EOT\134\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\SOH\DC2\EOT\134\SOH\n\
    \\CAN\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ETX\ETX\DC2\EOT\134\SOH\ESC\FS\n\
    \_\n\
    \\EOT\EOT\ETX\STX\EOT\DC2\EOT\140\SOH\EOT\NAK\SUBQ\n\
    \A description of the output being spent. The value and script MUST be\n\
    \provided.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\EOT\ACK\DC2\EOT\140\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\EOT\SOH\DC2\EOT\140\SOH\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\EOT\ETX\DC2\EOT\140\SOH\DC3\DC4\n\
    \m\n\
    \\EOT\EOT\ETX\STX\ENQ\DC2\EOT\146\SOH\EOT\ETB\SUB_\n\
    \The target sighash type that should be used when generating the final\n\
    \sighash, and signature.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ENQ\ENQ\DC2\EOT\146\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ENQ\SOH\DC2\EOT\146\SOH\v\DC2\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ENQ\ETX\DC2\EOT\146\SOH\NAK\SYN\n\
    \N\n\
    \\EOT\EOT\ETX\STX\ACK\DC2\EOT\151\SOH\EOT\SUB\SUB@\n\
    \The target input within the transaction that should be signed.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ACK\ENQ\DC2\EOT\151\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ACK\SOH\DC2\EOT\151\SOH\n\
    \\NAK\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\ACK\ETX\DC2\EOT\151\SOH\CAN\EM\n\
    \\f\n\
    \\STX\EOT\EOT\DC2\ACK\154\SOH\NUL\160\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\154\SOH\b\SI\n\
    \>\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\156\SOH\EOT\ESC\SUB0 The raw bytes of the transaction to be signed.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\156\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\156\SOH\n\
    \\SYN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\156\SOH\EM\SUB\n\
    \G\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\159\SOH\EOT+\SUB9 A set of sign descriptors, for each input to be signed.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\EOT\DC2\EOT\159\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\EOT\159\SOH\r\ESC\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\159\SOH\FS&\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\159\SOH)*\n\
    \\f\n\
    \\STX\EOT\ENQ\DC2\ACK\162\SOH\NUL\168\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\162\SOH\b\DLE\n\
    \h\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\EOT\167\SOH\EOT \SUBZ\n\
    \A set of signatures realized in a fixed 64-byte format ordered in ascending\n\
    \input order.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\EOT\DC2\EOT\167\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\EOT\167\SOH\r\DC2\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\EOT\167\SOH\DC3\ESC\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\EOT\167\SOH\RS\US\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\170\SOH\NUL\179\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\170\SOH\b\DC3\n\
    \E\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\172\SOH\EOT\US\SUB7 The serializes witness stack for the specified input.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\EOT\DC2\EOT\172\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\172\SOH\r\DC2\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\172\SOH\DC3\SUB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\172\SOH\GS\RS\n\
    \\145\SOH\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\178\SOH\EOT\EM\SUB\130\SOH\n\
    \The optional sig script for the specified witness that will only be set if\n\
    \the input specified is a nested p2sh witness program.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\178\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\178\SOH\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\178\SOH\ETB\CAN\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\181\SOH\NUL\184\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\181\SOH\b\ETB\n\
    \?\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\183\SOH\EOT+\SUB1 The set of fully valid input scripts requested.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\EOT\DC2\EOT\183\SOH\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ACK\DC2\EOT\183\SOH\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\183\SOH\EM&\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\183\SOH)*\n\
    \\f\n\
    \\STX\EOT\b\DC2\ACK\186\SOH\NUL\201\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\b\SOH\DC2\EOT\186\SOH\b\SYN\n\
    \)\n\
    \\EOT\EOT\b\STX\NUL\DC2\EOT\188\SOH\EOT\DC2\SUB\ESC The message to be signed.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\EOT\188\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\EOT\188\SOH\n\
    \\r\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\EOT\188\SOH\DLE\DC1\n\
    \M\n\
    \\EOT\EOT\b\STX\SOH\DC2\EOT\191\SOH\EOT\ESC\SUB? The key locator that identifies which key to use for signing.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ACK\DC2\EOT\191\SOH\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\SOH\DC2\EOT\191\SOH\SI\SYN\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ETX\DC2\EOT\191\SOH\EM\SUB\n\
    \L\n\
    \\EOT\EOT\b\STX\STX\DC2\EOT\194\SOH\EOT\EM\SUB> Double-SHA256 hash instead of just the default single round.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ENQ\DC2\EOT\194\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\SOH\DC2\EOT\194\SOH\t\DC4\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ETX\DC2\EOT\194\SOH\ETB\CAN\n\
    \]\n\
    \\EOT\EOT\b\STX\ETX\DC2\EOT\200\SOH\EOT\EM\SUBO\n\
    \Use the compact (pubkey recoverable) format instead of the raw lnwire\n\
    \format.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\ENQ\DC2\EOT\200\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\SOH\DC2\EOT\200\SOH\t\DC4\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\ETX\DC2\EOT\200\SOH\ETB\CAN\n\
    \\f\n\
    \\STX\EOT\t\DC2\ACK\202\SOH\NUL\207\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\202\SOH\b\ETB\n\
    \U\n\
    \\EOT\EOT\t\STX\NUL\DC2\EOT\206\SOH\EOT\CAN\SUBG\n\
    \The signature for the given message in the fixed-size LN wire format.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ENQ\DC2\EOT\206\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\EOT\206\SOH\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\EOT\206\SOH\SYN\ETB\n\
    \\f\n\
    \\STX\EOT\n\
    \\DC2\ACK\209\SOH\NUL\221\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\209\SOH\b\CAN\n\
    \G\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\211\SOH\EOT\DC2\SUB9 The message over which the signature is to be verified.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ENQ\DC2\EOT\211\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\211\SOH\n\
    \\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\211\SOH\DLE\DC1\n\
    \_\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\217\SOH\EOT\CAN\SUBQ\n\
    \The fixed-size LN wire encoded signature to be verified over the given\n\
    \message.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ENQ\DC2\EOT\217\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\217\SOH\n\
    \\DC3\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\217\SOH\SYN\ETB\n\
    \A\n\
    \\EOT\EOT\n\
    \\STX\STX\DC2\EOT\220\SOH\EOT\NAK\SUB3 The public key the signature has to be valid for.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ENQ\DC2\EOT\220\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\SOH\DC2\EOT\220\SOH\n\
    \\DLE\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ETX\DC2\EOT\220\SOH\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\v\DC2\ACK\222\SOH\NUL\225\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\222\SOH\b\EM\n\
    \G\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\224\SOH\EOT\DC3\SUB9 Whether the signature was valid over the given message.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ENQ\DC2\EOT\224\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\224\SOH\t\SO\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\224\SOH\DC1\DC2\n\
    \\f\n\
    \\STX\EOT\f\DC2\ACK\227\SOH\NUL\244\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\227\SOH\b\CAN\n\
    \J\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\229\SOH\EOT\US\SUB< The ephemeral public key to use for the DH key derivation.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\EOT\229\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\229\SOH\n\
    \\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\229\SOH\GS\RS\n\
    \\171\SOH\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\236\SOH\EOT/\SUB\156\SOH\n\
    \Deprecated. The optional key locator of the local key that should be used.\n\
    \If this parameter is not set then the node's identity private key will be\n\
    \used.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ACK\DC2\EOT\236\SOH\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\236\SOH\SI\SYN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\236\SOH\EM\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\b\DC2\EOT\236\SOH\ESC.\n\
    \\SO\n\
    \\ACK\EOT\f\STX\SOH\b\ETX\DC2\EOT\236\SOH\FS-\n\
    \\200\SOH\n\
    \\EOT\EOT\f\STX\STX\DC2\EOT\243\SOH\EOT\US\SUB\185\SOH\n\
    \A key descriptor describes the key used for performing ECDH. Either a key\n\
    \locator or a raw public key is expected, if neither is supplied, defaults to\n\
    \the node's identity private key.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ACK\DC2\EOT\243\SOH\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\SOH\DC2\EOT\243\SOH\DC2\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ETX\DC2\EOT\243\SOH\GS\RS\n\
    \\f\n\
    \\STX\EOT\r\DC2\ACK\246\SOH\NUL\249\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\r\SOH\DC2\EOT\246\SOH\b\EM\n\
    \:\n\
    \\EOT\EOT\r\STX\NUL\DC2\EOT\248\SOH\EOT\EM\SUB, The shared public key, hashed with sha256.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ENQ\DC2\EOT\248\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\EOT\248\SOH\n\
    \\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\EOT\248\SOH\ETB\CANb\ACKproto3"