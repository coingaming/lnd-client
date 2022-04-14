{- This file was auto-generated from watchtowerrpc/watchtower.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Watchtowerrpc.Watchtower (
        Watchtower(..), GetInfoRequest(), GetInfoResponse()
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
      -}
data GetInfoRequest
  = GetInfoRequest'_constructor {_GetInfoRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GetInfoRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GetInfoRequest
instance Data.ProtoLens.Message GetInfoRequest where
  messageName _ = Data.Text.pack "watchtowerrpc.GetInfoRequest"
  packedMessageDescriptor _
    = "\n\
      \\SOGetInfoRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetInfoRequest'_unknownFields
        (\ x__ y__ -> x__ {_GetInfoRequest'_unknownFields = y__})
  defMessage
    = GetInfoRequest'_constructor {_GetInfoRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetInfoRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetInfoRequest
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
          (do loop Data.ProtoLens.defMessage) "GetInfoRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData GetInfoRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_GetInfoRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Watchtowerrpc.Watchtower_Fields.pubkey' @:: Lens' GetInfoResponse Data.ByteString.ByteString@
         * 'Proto.Watchtowerrpc.Watchtower_Fields.listeners' @:: Lens' GetInfoResponse [Data.Text.Text]@
         * 'Proto.Watchtowerrpc.Watchtower_Fields.vec'listeners' @:: Lens' GetInfoResponse (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Watchtowerrpc.Watchtower_Fields.uris' @:: Lens' GetInfoResponse [Data.Text.Text]@
         * 'Proto.Watchtowerrpc.Watchtower_Fields.vec'uris' @:: Lens' GetInfoResponse (Data.Vector.Vector Data.Text.Text)@ -}
data GetInfoResponse
  = GetInfoResponse'_constructor {_GetInfoResponse'pubkey :: !Data.ByteString.ByteString,
                                  _GetInfoResponse'listeners :: !(Data.Vector.Vector Data.Text.Text),
                                  _GetInfoResponse'uris :: !(Data.Vector.Vector Data.Text.Text),
                                  _GetInfoResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GetInfoResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GetInfoResponse
instance Data.ProtoLens.Field.HasField GetInfoResponse "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetInfoResponse'pubkey
           (\ x__ y__ -> x__ {_GetInfoResponse'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GetInfoResponse "listeners" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetInfoResponse'listeners
           (\ x__ y__ -> x__ {_GetInfoResponse'listeners = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GetInfoResponse "vec'listeners" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetInfoResponse'listeners
           (\ x__ y__ -> x__ {_GetInfoResponse'listeners = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GetInfoResponse "uris" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetInfoResponse'uris
           (\ x__ y__ -> x__ {_GetInfoResponse'uris = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GetInfoResponse "vec'uris" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetInfoResponse'uris
           (\ x__ y__ -> x__ {_GetInfoResponse'uris = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetInfoResponse where
  messageName _ = Data.Text.pack "watchtowerrpc.GetInfoResponse"
  packedMessageDescriptor _
    = "\n\
      \\SIGetInfoResponse\DC2\SYN\n\
      \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\FS\n\
      \\tlisteners\CAN\STX \ETX(\tR\tlisteners\DC2\DC2\n\
      \\EOTuris\CAN\ETX \ETX(\tR\EOTuris"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        pubkey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "pubkey"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"pubkey")) ::
              Data.ProtoLens.FieldDescriptor GetInfoResponse
        listeners__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "listeners"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"listeners")) ::
              Data.ProtoLens.FieldDescriptor GetInfoResponse
        uris__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "uris"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"uris")) ::
              Data.ProtoLens.FieldDescriptor GetInfoResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, listeners__field_descriptor),
           (Data.ProtoLens.Tag 3, uris__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetInfoResponse'_unknownFields
        (\ x__ y__ -> x__ {_GetInfoResponse'_unknownFields = y__})
  defMessage
    = GetInfoResponse'_constructor
        {_GetInfoResponse'pubkey = Data.ProtoLens.fieldDefault,
         _GetInfoResponse'listeners = Data.Vector.Generic.empty,
         _GetInfoResponse'uris = Data.Vector.Generic.empty,
         _GetInfoResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetInfoResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Bytes.Parser GetInfoResponse
        loop x mutable'listeners mutable'uris
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'listeners <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'listeners)
                      frozen'uris <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'uris)
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
                              (Data.ProtoLens.Field.field @"vec'listeners") frozen'listeners
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'uris") frozen'uris x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "pubkey"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"pubkey") y x)
                                  mutable'listeners mutable'uris
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "listeners"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'listeners y)
                                loop x v mutable'uris
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "uris"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'uris y)
                                loop x mutable'listeners v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'listeners mutable'uris
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'listeners <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'uris <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'listeners mutable'uris)
          "GetInfoResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"pubkey") _x
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
                              Data.Text.Encoding.encodeUtf8 _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'listeners") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.Text.Encoding.encodeUtf8 _v))
                      (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'uris") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData GetInfoResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetInfoResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GetInfoResponse'pubkey x__)
                (Control.DeepSeq.deepseq
                   (_GetInfoResponse'listeners x__)
                   (Control.DeepSeq.deepseq (_GetInfoResponse'uris x__) ())))
data Watchtower = Watchtower {}
instance Data.ProtoLens.Service.Types.Service Watchtower where
  type ServiceName Watchtower = "Watchtower"
  type ServicePackage Watchtower = "watchtowerrpc"
  type ServiceMethods Watchtower = '["getInfo"]
  packedServiceDescriptor _
    = "\n\
      \\n\
      \Watchtower\DC2H\n\
      \\aGetInfo\DC2\GS.watchtowerrpc.GetInfoRequest\SUB\RS.watchtowerrpc.GetInfoResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl Watchtower "getInfo" where
  type MethodName Watchtower "getInfo" = "GetInfo"
  type MethodInput Watchtower "getInfo" = GetInfoRequest
  type MethodOutput Watchtower "getInfo" = GetInfoResponse
  type MethodStreamingType Watchtower "getInfo" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\RSwatchtowerrpc/watchtower.proto\DC2\rwatchtowerrpc\"\DLE\n\
    \\SOGetInfoRequest\"[\n\
    \\SIGetInfoResponse\DC2\SYN\n\
    \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\FS\n\
    \\tlisteners\CAN\STX \ETX(\tR\tlisteners\DC2\DC2\n\
    \\EOTuris\CAN\ETX \ETX(\tR\EOTuris2V\n\
    \\n\
    \Watchtower\DC2H\n\
    \\aGetInfo\DC2\GS.watchtowerrpc.GetInfoRequest\SUB\RS.watchtowerrpc.GetInfoResponseB5Z3github.com/lightningnetwork/lnd/lnrpc/watchtowerrpcJ\254\ENQ\n\
    \\ACK\DC2\EOT\NUL\NUL\GS\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\SYN\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULJ\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULJ\n\
    \o\n\
    \\STX\ACK\NUL\DC2\EOT\b\NUL\SI\SOH\SUBc Watchtower is a service that grants access to the watchtower server\n\
    \ functionality of the daemon.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\b\b\DC2\n\
    \\192\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\SO\EOT;\SUB\178\SOH lncli: tower info\n\
    \GetInfo returns general information concerning the companion watchtower\n\
    \including its public key and URIs where the server is currently\n\
    \listening for clients.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\SO\b\SI\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\SO\DC1\US\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\SO*9\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT\DC1\NUL\DC2\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\DC1\b\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT\DC4\NUL\GS\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX\DC4\b\ETB\n\
    \0\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX\SYN\EOT\NAK\SUB# The public key of the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX\SYN\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX\SYN\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX\SYN\DC3\DC4\n\
    \9\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX\EM\EOT\"\SUB, The listening addresses of the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\EOT\DC2\ETX\EM\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETX\EM\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX\EM\DC4\GS\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX\EM !\n\
    \*\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX\FS\EOT\GS\SUB\GS The URIs of the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\EOT\DC2\ETX\FS\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX\FS\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX\FS\DC4\CAN\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX\FS\ESC\FSb\ACKproto3"