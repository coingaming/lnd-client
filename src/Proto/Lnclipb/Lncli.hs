{- This file was auto-generated from lnclipb/lncli.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Lnclipb.Lncli (
        VersionResponse()
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
import qualified Proto.Verrpc.Verrpc
{- | Fields :
     
         * 'Proto.Lnclipb.Lncli_Fields.lncli' @:: Lens' VersionResponse Proto.Verrpc.Verrpc.Version@
         * 'Proto.Lnclipb.Lncli_Fields.maybe'lncli' @:: Lens' VersionResponse (Prelude.Maybe Proto.Verrpc.Verrpc.Version)@
         * 'Proto.Lnclipb.Lncli_Fields.lnd' @:: Lens' VersionResponse Proto.Verrpc.Verrpc.Version@
         * 'Proto.Lnclipb.Lncli_Fields.maybe'lnd' @:: Lens' VersionResponse (Prelude.Maybe Proto.Verrpc.Verrpc.Version)@ -}
data VersionResponse
  = VersionResponse'_constructor {_VersionResponse'lncli :: !(Prelude.Maybe Proto.Verrpc.Verrpc.Version),
                                  _VersionResponse'lnd :: !(Prelude.Maybe Proto.Verrpc.Verrpc.Version),
                                  _VersionResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show VersionResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out VersionResponse
instance Data.ProtoLens.Field.HasField VersionResponse "lncli" Proto.Verrpc.Verrpc.Version where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VersionResponse'lncli
           (\ x__ y__ -> x__ {_VersionResponse'lncli = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField VersionResponse "maybe'lncli" (Prelude.Maybe Proto.Verrpc.Verrpc.Version) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VersionResponse'lncli
           (\ x__ y__ -> x__ {_VersionResponse'lncli = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField VersionResponse "lnd" Proto.Verrpc.Verrpc.Version where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VersionResponse'lnd
           (\ x__ y__ -> x__ {_VersionResponse'lnd = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField VersionResponse "maybe'lnd" (Prelude.Maybe Proto.Verrpc.Verrpc.Version) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _VersionResponse'lnd
           (\ x__ y__ -> x__ {_VersionResponse'lnd = y__}))
        Prelude.id
instance Data.ProtoLens.Message VersionResponse where
  messageName _ = Data.Text.pack "lnclipb.VersionResponse"
  packedMessageDescriptor _
    = "\n\
      \\SIVersionResponse\DC2%\n\
      \\ENQlncli\CAN\SOH \SOH(\v2\SI.verrpc.VersionR\ENQlncli\DC2!\n\
      \\ETXlnd\CAN\STX \SOH(\v2\SI.verrpc.VersionR\ETXlnd"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        lncli__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lncli"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Verrpc.Verrpc.Version)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'lncli")) ::
              Data.ProtoLens.FieldDescriptor VersionResponse
        lnd__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lnd"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.Verrpc.Verrpc.Version)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'lnd")) ::
              Data.ProtoLens.FieldDescriptor VersionResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, lncli__field_descriptor),
           (Data.ProtoLens.Tag 2, lnd__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _VersionResponse'_unknownFields
        (\ x__ y__ -> x__ {_VersionResponse'_unknownFields = y__})
  defMessage
    = VersionResponse'_constructor
        {_VersionResponse'lncli = Prelude.Nothing,
         _VersionResponse'lnd = Prelude.Nothing,
         _VersionResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          VersionResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser VersionResponse
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
                                       "lncli"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"lncli") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "lnd"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"lnd") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "VersionResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'lncli") _x
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
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'lnd") _x
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
instance Control.DeepSeq.NFData VersionResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_VersionResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_VersionResponse'lncli x__)
                (Control.DeepSeq.deepseq (_VersionResponse'lnd x__) ()))
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\DC3lnclipb/lncli.proto\DC2\alnclipb\SUB\DC3verrpc/verrpc.proto\"[\n\
    \\SIVersionResponse\DC2%\n\
    \\ENQlncli\CAN\SOH \SOH(\v2\SI.verrpc.VersionR\ENQlncli\DC2!\n\
    \\ETXlnd\CAN\STX \SOH(\v2\SI.verrpc.VersionR\ETXlndB/Z-github.com/lightningnetwork/lnd/lnrpc/lnclipbJ\140\STX\n\
    \\ACK\DC2\EOT\NUL\NUL\SO\STX\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\STX\NUL\GS\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\EOT\NUL\DLE\n\
    \\b\n\
    \\SOH\b\DC2\ETX\ACK\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\ACK\NULD\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\b\NUL\SO\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\b\b\ETB\n\
    \1\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\n\
    \\EOT\GS\SUB$ The version information for lncli.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\n\
    \\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\n\
    \\DC3\CAN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\n\
    \\ESC\FS\n\
    \/\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\r\EOT\ESC\SUB\" The version information for lnd.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\r\EOT\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\r\DC3\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\r\EM\SUBb\ACKproto3"