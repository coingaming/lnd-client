{- This file was auto-generated from wtclientrpc/wtclient.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Wtclientrpc.Wtclient (
        WatchtowerClient(..), AddTowerRequest(), AddTowerResponse(),
        GetTowerInfoRequest(), ListTowersRequest(), ListTowersResponse(),
        PolicyRequest(), PolicyResponse(), PolicyType(..), PolicyType(),
        PolicyType'UnrecognizedValue, RemoveTowerRequest(),
        RemoveTowerResponse(), StatsRequest(), StatsResponse(), Tower(),
        TowerSession()
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
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.pubkey' @:: Lens' AddTowerRequest Data.ByteString.ByteString@
         * 'Proto.Wtclientrpc.Wtclient_Fields.address' @:: Lens' AddTowerRequest Data.Text.Text@ -}
data AddTowerRequest
  = AddTowerRequest'_constructor {_AddTowerRequest'pubkey :: !Data.ByteString.ByteString,
                                  _AddTowerRequest'address :: !Data.Text.Text,
                                  _AddTowerRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddTowerRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddTowerRequest
instance Data.ProtoLens.Field.HasField AddTowerRequest "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddTowerRequest'pubkey
           (\ x__ y__ -> x__ {_AddTowerRequest'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AddTowerRequest "address" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AddTowerRequest'address
           (\ x__ y__ -> x__ {_AddTowerRequest'address = y__}))
        Prelude.id
instance Data.ProtoLens.Message AddTowerRequest where
  messageName _ = Data.Text.pack "wtclientrpc.AddTowerRequest"
  packedMessageDescriptor _
    = "\n\
      \\SIAddTowerRequest\DC2\SYN\n\
      \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\CAN\n\
      \\aaddress\CAN\STX \SOH(\tR\aaddress"
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
              Data.ProtoLens.FieldDescriptor AddTowerRequest
        address__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"address")) ::
              Data.ProtoLens.FieldDescriptor AddTowerRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, address__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddTowerRequest'_unknownFields
        (\ x__ y__ -> x__ {_AddTowerRequest'_unknownFields = y__})
  defMessage
    = AddTowerRequest'_constructor
        {_AddTowerRequest'pubkey = Data.ProtoLens.fieldDefault,
         _AddTowerRequest'address = Data.ProtoLens.fieldDefault,
         _AddTowerRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddTowerRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser AddTowerRequest
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
                                       "pubkey"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"pubkey") y x)
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
                                       "address"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"address") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "AddTowerRequest"
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
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"address") _x
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
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData AddTowerRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddTowerRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AddTowerRequest'pubkey x__)
                (Control.DeepSeq.deepseq (_AddTowerRequest'address x__) ()))
{- | Fields :
      -}
data AddTowerResponse
  = AddTowerResponse'_constructor {_AddTowerResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show AddTowerResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out AddTowerResponse
instance Data.ProtoLens.Message AddTowerResponse where
  messageName _ = Data.Text.pack "wtclientrpc.AddTowerResponse"
  packedMessageDescriptor _
    = "\n\
      \\DLEAddTowerResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AddTowerResponse'_unknownFields
        (\ x__ y__ -> x__ {_AddTowerResponse'_unknownFields = y__})
  defMessage
    = AddTowerResponse'_constructor
        {_AddTowerResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AddTowerResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser AddTowerResponse
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
          (do loop Data.ProtoLens.defMessage) "AddTowerResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData AddTowerResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AddTowerResponse'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.pubkey' @:: Lens' GetTowerInfoRequest Data.ByteString.ByteString@
         * 'Proto.Wtclientrpc.Wtclient_Fields.includeSessions' @:: Lens' GetTowerInfoRequest Prelude.Bool@ -}
data GetTowerInfoRequest
  = GetTowerInfoRequest'_constructor {_GetTowerInfoRequest'pubkey :: !Data.ByteString.ByteString,
                                      _GetTowerInfoRequest'includeSessions :: !Prelude.Bool,
                                      _GetTowerInfoRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GetTowerInfoRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GetTowerInfoRequest
instance Data.ProtoLens.Field.HasField GetTowerInfoRequest "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetTowerInfoRequest'pubkey
           (\ x__ y__ -> x__ {_GetTowerInfoRequest'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GetTowerInfoRequest "includeSessions" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GetTowerInfoRequest'includeSessions
           (\ x__ y__ -> x__ {_GetTowerInfoRequest'includeSessions = y__}))
        Prelude.id
instance Data.ProtoLens.Message GetTowerInfoRequest where
  messageName _ = Data.Text.pack "wtclientrpc.GetTowerInfoRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3GetTowerInfoRequest\DC2\SYN\n\
      \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2)\n\
      \\DLEinclude_sessions\CAN\STX \SOH(\bR\SIincludeSessions"
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
              Data.ProtoLens.FieldDescriptor GetTowerInfoRequest
        includeSessions__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "include_sessions"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"includeSessions")) ::
              Data.ProtoLens.FieldDescriptor GetTowerInfoRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, includeSessions__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GetTowerInfoRequest'_unknownFields
        (\ x__ y__ -> x__ {_GetTowerInfoRequest'_unknownFields = y__})
  defMessage
    = GetTowerInfoRequest'_constructor
        {_GetTowerInfoRequest'pubkey = Data.ProtoLens.fieldDefault,
         _GetTowerInfoRequest'includeSessions = Data.ProtoLens.fieldDefault,
         _GetTowerInfoRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GetTowerInfoRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GetTowerInfoRequest
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
                                       "pubkey"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"pubkey") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "include_sessions"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"includeSessions") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GetTowerInfoRequest"
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
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"includeSessions") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData GetTowerInfoRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GetTowerInfoRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GetTowerInfoRequest'pubkey x__)
                (Control.DeepSeq.deepseq
                   (_GetTowerInfoRequest'includeSessions x__) ()))
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.includeSessions' @:: Lens' ListTowersRequest Prelude.Bool@ -}
data ListTowersRequest
  = ListTowersRequest'_constructor {_ListTowersRequest'includeSessions :: !Prelude.Bool,
                                    _ListTowersRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListTowersRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListTowersRequest
instance Data.ProtoLens.Field.HasField ListTowersRequest "includeSessions" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListTowersRequest'includeSessions
           (\ x__ y__ -> x__ {_ListTowersRequest'includeSessions = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListTowersRequest where
  messageName _ = Data.Text.pack "wtclientrpc.ListTowersRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC1ListTowersRequest\DC2)\n\
      \\DLEinclude_sessions\CAN\SOH \SOH(\bR\SIincludeSessions"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        includeSessions__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "include_sessions"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"includeSessions")) ::
              Data.ProtoLens.FieldDescriptor ListTowersRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, includeSessions__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListTowersRequest'_unknownFields
        (\ x__ y__ -> x__ {_ListTowersRequest'_unknownFields = y__})
  defMessage
    = ListTowersRequest'_constructor
        {_ListTowersRequest'includeSessions = Data.ProtoLens.fieldDefault,
         _ListTowersRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListTowersRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ListTowersRequest
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
                                       "include_sessions"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"includeSessions") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ListTowersRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"includeSessions") _x
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
instance Control.DeepSeq.NFData ListTowersRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListTowersRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ListTowersRequest'includeSessions x__) ())
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.towers' @:: Lens' ListTowersResponse [Tower]@
         * 'Proto.Wtclientrpc.Wtclient_Fields.vec'towers' @:: Lens' ListTowersResponse (Data.Vector.Vector Tower)@ -}
data ListTowersResponse
  = ListTowersResponse'_constructor {_ListTowersResponse'towers :: !(Data.Vector.Vector Tower),
                                     _ListTowersResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ListTowersResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ListTowersResponse
instance Data.ProtoLens.Field.HasField ListTowersResponse "towers" [Tower] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListTowersResponse'towers
           (\ x__ y__ -> x__ {_ListTowersResponse'towers = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ListTowersResponse "vec'towers" (Data.Vector.Vector Tower) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ListTowersResponse'towers
           (\ x__ y__ -> x__ {_ListTowersResponse'towers = y__}))
        Prelude.id
instance Data.ProtoLens.Message ListTowersResponse where
  messageName _ = Data.Text.pack "wtclientrpc.ListTowersResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC2ListTowersResponse\DC2*\n\
      \\ACKtowers\CAN\SOH \ETX(\v2\DC2.wtclientrpc.TowerR\ACKtowers"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        towers__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "towers"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Tower)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"towers")) ::
              Data.ProtoLens.FieldDescriptor ListTowersResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, towers__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ListTowersResponse'_unknownFields
        (\ x__ y__ -> x__ {_ListTowersResponse'_unknownFields = y__})
  defMessage
    = ListTowersResponse'_constructor
        {_ListTowersResponse'towers = Data.Vector.Generic.empty,
         _ListTowersResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ListTowersResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Tower
             -> Data.ProtoLens.Encoding.Bytes.Parser ListTowersResponse
        loop x mutable'towers
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'towers <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                            mutable'towers)
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
                              (Data.ProtoLens.Field.field @"vec'towers") frozen'towers x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "towers"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'towers y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'towers
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'towers <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                  Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'towers)
          "ListTowersResponse"
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
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'towers") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ListTowersResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ListTowersResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ListTowersResponse'towers x__) ())
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.policyType' @:: Lens' PolicyRequest PolicyType@ -}
data PolicyRequest
  = PolicyRequest'_constructor {_PolicyRequest'policyType :: !PolicyType,
                                _PolicyRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PolicyRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PolicyRequest
instance Data.ProtoLens.Field.HasField PolicyRequest "policyType" PolicyType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PolicyRequest'policyType
           (\ x__ y__ -> x__ {_PolicyRequest'policyType = y__}))
        Prelude.id
instance Data.ProtoLens.Message PolicyRequest where
  messageName _ = Data.Text.pack "wtclientrpc.PolicyRequest"
  packedMessageDescriptor _
    = "\n\
      \\rPolicyRequest\DC28\n\
      \\vpolicy_type\CAN\SOH \SOH(\SO2\ETB.wtclientrpc.PolicyTypeR\n\
      \policyType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        policyType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "policy_type"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor PolicyType)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"policyType")) ::
              Data.ProtoLens.FieldDescriptor PolicyRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, policyType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PolicyRequest'_unknownFields
        (\ x__ y__ -> x__ {_PolicyRequest'_unknownFields = y__})
  defMessage
    = PolicyRequest'_constructor
        {_PolicyRequest'policyType = Data.ProtoLens.fieldDefault,
         _PolicyRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PolicyRequest -> Data.ProtoLens.Encoding.Bytes.Parser PolicyRequest
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
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "policy_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"policyType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PolicyRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"policyType") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData PolicyRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PolicyRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq (_PolicyRequest'policyType x__) ())
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.maxUpdates' @:: Lens' PolicyResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.sweepSatPerByte' @:: Lens' PolicyResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.sweepSatPerVbyte' @:: Lens' PolicyResponse Data.Word.Word32@ -}
data PolicyResponse
  = PolicyResponse'_constructor {_PolicyResponse'maxUpdates :: !Data.Word.Word32,
                                 _PolicyResponse'sweepSatPerByte :: !Data.Word.Word32,
                                 _PolicyResponse'sweepSatPerVbyte :: !Data.Word.Word32,
                                 _PolicyResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show PolicyResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out PolicyResponse
instance Data.ProtoLens.Field.HasField PolicyResponse "maxUpdates" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PolicyResponse'maxUpdates
           (\ x__ y__ -> x__ {_PolicyResponse'maxUpdates = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PolicyResponse "sweepSatPerByte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PolicyResponse'sweepSatPerByte
           (\ x__ y__ -> x__ {_PolicyResponse'sweepSatPerByte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField PolicyResponse "sweepSatPerVbyte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _PolicyResponse'sweepSatPerVbyte
           (\ x__ y__ -> x__ {_PolicyResponse'sweepSatPerVbyte = y__}))
        Prelude.id
instance Data.ProtoLens.Message PolicyResponse where
  messageName _ = Data.Text.pack "wtclientrpc.PolicyResponse"
  packedMessageDescriptor _
    = "\n\
      \\SOPolicyResponse\DC2\US\n\
      \\vmax_updates\CAN\SOH \SOH(\rR\n\
      \maxUpdates\DC2/\n\
      \\DC2sweep_sat_per_byte\CAN\STX \SOH(\rR\SIsweepSatPerByteB\STX\CAN\SOH\DC2-\n\
      \\DC3sweep_sat_per_vbyte\CAN\ETX \SOH(\rR\DLEsweepSatPerVbyte"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        maxUpdates__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_updates"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maxUpdates")) ::
              Data.ProtoLens.FieldDescriptor PolicyResponse
        sweepSatPerByte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sweep_sat_per_byte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sweepSatPerByte")) ::
              Data.ProtoLens.FieldDescriptor PolicyResponse
        sweepSatPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sweep_sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sweepSatPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor PolicyResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, maxUpdates__field_descriptor),
           (Data.ProtoLens.Tag 2, sweepSatPerByte__field_descriptor),
           (Data.ProtoLens.Tag 3, sweepSatPerVbyte__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _PolicyResponse'_unknownFields
        (\ x__ y__ -> x__ {_PolicyResponse'_unknownFields = y__})
  defMessage
    = PolicyResponse'_constructor
        {_PolicyResponse'maxUpdates = Data.ProtoLens.fieldDefault,
         _PolicyResponse'sweepSatPerByte = Data.ProtoLens.fieldDefault,
         _PolicyResponse'sweepSatPerVbyte = Data.ProtoLens.fieldDefault,
         _PolicyResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          PolicyResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser PolicyResponse
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
                                       "max_updates"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"maxUpdates") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sweep_sat_per_byte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sweepSatPerByte") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sweep_sat_per_vbyte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sweepSatPerVbyte") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "PolicyResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"maxUpdates") _x
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
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"sweepSatPerByte") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"sweepSatPerVbyte") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData PolicyResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_PolicyResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_PolicyResponse'maxUpdates x__)
                (Control.DeepSeq.deepseq
                   (_PolicyResponse'sweepSatPerByte x__)
                   (Control.DeepSeq.deepseq
                      (_PolicyResponse'sweepSatPerVbyte x__) ())))
newtype PolicyType'UnrecognizedValue
  = PolicyType'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq,
                  Prelude.Ord,
                  Prelude.Show,
                  GHC.Generics.Generic)
instance Text.PrettyPrint.GenericPretty.Out PolicyType'UnrecognizedValue
data PolicyType
  = LEGACY |
    ANCHOR |
    PolicyType'Unrecognized !PolicyType'UnrecognizedValue
  deriving stock (Prelude.Show,
                  Prelude.Eq,
                  Prelude.Ord,
                  GHC.Generics.Generic)
instance Data.ProtoLens.MessageEnum PolicyType where
  maybeToEnum 0 = Prelude.Just LEGACY
  maybeToEnum 1 = Prelude.Just ANCHOR
  maybeToEnum k
    = Prelude.Just
        (PolicyType'Unrecognized
           (PolicyType'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum LEGACY = "LEGACY"
  showEnum ANCHOR = "ANCHOR"
  showEnum (PolicyType'Unrecognized (PolicyType'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "LEGACY" = Prelude.Just LEGACY
    | (Prelude.==) k "ANCHOR" = Prelude.Just ANCHOR
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded PolicyType where
  minBound = LEGACY
  maxBound = ANCHOR
instance Prelude.Enum PolicyType where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum PolicyType: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum LEGACY = 0
  fromEnum ANCHOR = 1
  fromEnum (PolicyType'Unrecognized (PolicyType'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ ANCHOR
    = Prelude.error
        "PolicyType.succ: bad argument ANCHOR. This value would be out of bounds."
  succ LEGACY = ANCHOR
  succ (PolicyType'Unrecognized _)
    = Prelude.error "PolicyType.succ: bad argument: unrecognized value"
  pred LEGACY
    = Prelude.error
        "PolicyType.pred: bad argument LEGACY. This value would be out of bounds."
  pred ANCHOR = LEGACY
  pred (PolicyType'Unrecognized _)
    = Prelude.error "PolicyType.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault PolicyType where
  fieldDefault = LEGACY
instance Control.DeepSeq.NFData PolicyType where
  rnf x__ = Prelude.seq x__ ()
instance Text.PrettyPrint.GenericPretty.Out PolicyType
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.pubkey' @:: Lens' RemoveTowerRequest Data.ByteString.ByteString@
         * 'Proto.Wtclientrpc.Wtclient_Fields.address' @:: Lens' RemoveTowerRequest Data.Text.Text@ -}
data RemoveTowerRequest
  = RemoveTowerRequest'_constructor {_RemoveTowerRequest'pubkey :: !Data.ByteString.ByteString,
                                     _RemoveTowerRequest'address :: !Data.Text.Text,
                                     _RemoveTowerRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show RemoveTowerRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out RemoveTowerRequest
instance Data.ProtoLens.Field.HasField RemoveTowerRequest "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RemoveTowerRequest'pubkey
           (\ x__ y__ -> x__ {_RemoveTowerRequest'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField RemoveTowerRequest "address" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RemoveTowerRequest'address
           (\ x__ y__ -> x__ {_RemoveTowerRequest'address = y__}))
        Prelude.id
instance Data.ProtoLens.Message RemoveTowerRequest where
  messageName _ = Data.Text.pack "wtclientrpc.RemoveTowerRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC2RemoveTowerRequest\DC2\SYN\n\
      \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\CAN\n\
      \\aaddress\CAN\STX \SOH(\tR\aaddress"
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
              Data.ProtoLens.FieldDescriptor RemoveTowerRequest
        address__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "address"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"address")) ::
              Data.ProtoLens.FieldDescriptor RemoveTowerRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, address__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RemoveTowerRequest'_unknownFields
        (\ x__ y__ -> x__ {_RemoveTowerRequest'_unknownFields = y__})
  defMessage
    = RemoveTowerRequest'_constructor
        {_RemoveTowerRequest'pubkey = Data.ProtoLens.fieldDefault,
         _RemoveTowerRequest'address = Data.ProtoLens.fieldDefault,
         _RemoveTowerRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RemoveTowerRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser RemoveTowerRequest
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
                                       "pubkey"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"pubkey") y x)
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
                                       "address"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"address") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RemoveTowerRequest"
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
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"address") _x
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
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData RemoveTowerRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RemoveTowerRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_RemoveTowerRequest'pubkey x__)
                (Control.DeepSeq.deepseq (_RemoveTowerRequest'address x__) ()))
{- | Fields :
      -}
data RemoveTowerResponse
  = RemoveTowerResponse'_constructor {_RemoveTowerResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show RemoveTowerResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out RemoveTowerResponse
instance Data.ProtoLens.Message RemoveTowerResponse where
  messageName _ = Data.Text.pack "wtclientrpc.RemoveTowerResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC3RemoveTowerResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RemoveTowerResponse'_unknownFields
        (\ x__ y__ -> x__ {_RemoveTowerResponse'_unknownFields = y__})
  defMessage
    = RemoveTowerResponse'_constructor
        {_RemoveTowerResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RemoveTowerResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser RemoveTowerResponse
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
          (do loop Data.ProtoLens.defMessage) "RemoveTowerResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData RemoveTowerResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RemoveTowerResponse'_unknownFields x__) ()
{- | Fields :
      -}
data StatsRequest
  = StatsRequest'_constructor {_StatsRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show StatsRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out StatsRequest
instance Data.ProtoLens.Message StatsRequest where
  messageName _ = Data.Text.pack "wtclientrpc.StatsRequest"
  packedMessageDescriptor _
    = "\n\
      \\fStatsRequest"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StatsRequest'_unknownFields
        (\ x__ y__ -> x__ {_StatsRequest'_unknownFields = y__})
  defMessage
    = StatsRequest'_constructor {_StatsRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StatsRequest -> Data.ProtoLens.Encoding.Bytes.Parser StatsRequest
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
          (do loop Data.ProtoLens.defMessage) "StatsRequest"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData StatsRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_StatsRequest'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.numBackups' @:: Lens' StatsResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numPendingBackups' @:: Lens' StatsResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numFailedBackups' @:: Lens' StatsResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numSessionsAcquired' @:: Lens' StatsResponse Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numSessionsExhausted' @:: Lens' StatsResponse Data.Word.Word32@ -}
data StatsResponse
  = StatsResponse'_constructor {_StatsResponse'numBackups :: !Data.Word.Word32,
                                _StatsResponse'numPendingBackups :: !Data.Word.Word32,
                                _StatsResponse'numFailedBackups :: !Data.Word.Word32,
                                _StatsResponse'numSessionsAcquired :: !Data.Word.Word32,
                                _StatsResponse'numSessionsExhausted :: !Data.Word.Word32,
                                _StatsResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show StatsResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out StatsResponse
instance Data.ProtoLens.Field.HasField StatsResponse "numBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatsResponse'numBackups
           (\ x__ y__ -> x__ {_StatsResponse'numBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField StatsResponse "numPendingBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatsResponse'numPendingBackups
           (\ x__ y__ -> x__ {_StatsResponse'numPendingBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField StatsResponse "numFailedBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatsResponse'numFailedBackups
           (\ x__ y__ -> x__ {_StatsResponse'numFailedBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField StatsResponse "numSessionsAcquired" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatsResponse'numSessionsAcquired
           (\ x__ y__ -> x__ {_StatsResponse'numSessionsAcquired = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField StatsResponse "numSessionsExhausted" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StatsResponse'numSessionsExhausted
           (\ x__ y__ -> x__ {_StatsResponse'numSessionsExhausted = y__}))
        Prelude.id
instance Data.ProtoLens.Message StatsResponse where
  messageName _ = Data.Text.pack "wtclientrpc.StatsResponse"
  packedMessageDescriptor _
    = "\n\
      \\rStatsResponse\DC2\US\n\
      \\vnum_backups\CAN\SOH \SOH(\rR\n\
      \numBackups\DC2.\n\
      \\DC3num_pending_backups\CAN\STX \SOH(\rR\DC1numPendingBackups\DC2,\n\
      \\DC2num_failed_backups\CAN\ETX \SOH(\rR\DLEnumFailedBackups\DC22\n\
      \\NAKnum_sessions_acquired\CAN\EOT \SOH(\rR\DC3numSessionsAcquired\DC24\n\
      \\SYNnum_sessions_exhausted\CAN\ENQ \SOH(\rR\DC4numSessionsExhausted"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        numBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numBackups")) ::
              Data.ProtoLens.FieldDescriptor StatsResponse
        numPendingBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_pending_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numPendingBackups")) ::
              Data.ProtoLens.FieldDescriptor StatsResponse
        numFailedBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_failed_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numFailedBackups")) ::
              Data.ProtoLens.FieldDescriptor StatsResponse
        numSessionsAcquired__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_sessions_acquired"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numSessionsAcquired")) ::
              Data.ProtoLens.FieldDescriptor StatsResponse
        numSessionsExhausted__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_sessions_exhausted"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numSessionsExhausted")) ::
              Data.ProtoLens.FieldDescriptor StatsResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, numBackups__field_descriptor),
           (Data.ProtoLens.Tag 2, numPendingBackups__field_descriptor),
           (Data.ProtoLens.Tag 3, numFailedBackups__field_descriptor),
           (Data.ProtoLens.Tag 4, numSessionsAcquired__field_descriptor),
           (Data.ProtoLens.Tag 5, numSessionsExhausted__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StatsResponse'_unknownFields
        (\ x__ y__ -> x__ {_StatsResponse'_unknownFields = y__})
  defMessage
    = StatsResponse'_constructor
        {_StatsResponse'numBackups = Data.ProtoLens.fieldDefault,
         _StatsResponse'numPendingBackups = Data.ProtoLens.fieldDefault,
         _StatsResponse'numFailedBackups = Data.ProtoLens.fieldDefault,
         _StatsResponse'numSessionsAcquired = Data.ProtoLens.fieldDefault,
         _StatsResponse'numSessionsExhausted = Data.ProtoLens.fieldDefault,
         _StatsResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StatsResponse -> Data.ProtoLens.Encoding.Bytes.Parser StatsResponse
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
                                       "num_backups"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"numBackups") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_pending_backups"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"numPendingBackups") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_failed_backups"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"numFailedBackups") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_sessions_acquired"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"numSessionsAcquired") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_sessions_exhausted"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"numSessionsExhausted") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "StatsResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"numBackups") _x
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
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"numPendingBackups") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"numFailedBackups") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"numSessionsAcquired") _x
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
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"numSessionsExhausted") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData StatsResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_StatsResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_StatsResponse'numBackups x__)
                (Control.DeepSeq.deepseq
                   (_StatsResponse'numPendingBackups x__)
                   (Control.DeepSeq.deepseq
                      (_StatsResponse'numFailedBackups x__)
                      (Control.DeepSeq.deepseq
                         (_StatsResponse'numSessionsAcquired x__)
                         (Control.DeepSeq.deepseq
                            (_StatsResponse'numSessionsExhausted x__) ())))))
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.pubkey' @:: Lens' Tower Data.ByteString.ByteString@
         * 'Proto.Wtclientrpc.Wtclient_Fields.addresses' @:: Lens' Tower [Data.Text.Text]@
         * 'Proto.Wtclientrpc.Wtclient_Fields.vec'addresses' @:: Lens' Tower (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Wtclientrpc.Wtclient_Fields.activeSessionCandidate' @:: Lens' Tower Prelude.Bool@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numSessions' @:: Lens' Tower Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.sessions' @:: Lens' Tower [TowerSession]@
         * 'Proto.Wtclientrpc.Wtclient_Fields.vec'sessions' @:: Lens' Tower (Data.Vector.Vector TowerSession)@ -}
data Tower
  = Tower'_constructor {_Tower'pubkey :: !Data.ByteString.ByteString,
                        _Tower'addresses :: !(Data.Vector.Vector Data.Text.Text),
                        _Tower'activeSessionCandidate :: !Prelude.Bool,
                        _Tower'numSessions :: !Data.Word.Word32,
                        _Tower'sessions :: !(Data.Vector.Vector TowerSession),
                        _Tower'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show Tower where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out Tower
instance Data.ProtoLens.Field.HasField Tower "pubkey" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'pubkey (\ x__ y__ -> x__ {_Tower'pubkey = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Tower "addresses" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'addresses (\ x__ y__ -> x__ {_Tower'addresses = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Tower "vec'addresses" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'addresses (\ x__ y__ -> x__ {_Tower'addresses = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Tower "activeSessionCandidate" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'activeSessionCandidate
           (\ x__ y__ -> x__ {_Tower'activeSessionCandidate = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Tower "numSessions" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'numSessions (\ x__ y__ -> x__ {_Tower'numSessions = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Tower "sessions" [TowerSession] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'sessions (\ x__ y__ -> x__ {_Tower'sessions = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Tower "vec'sessions" (Data.Vector.Vector TowerSession) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Tower'sessions (\ x__ y__ -> x__ {_Tower'sessions = y__}))
        Prelude.id
instance Data.ProtoLens.Message Tower where
  messageName _ = Data.Text.pack "wtclientrpc.Tower"
  packedMessageDescriptor _
    = "\n\
      \\ENQTower\DC2\SYN\n\
      \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\FS\n\
      \\taddresses\CAN\STX \ETX(\tR\taddresses\DC28\n\
      \\CANactive_session_candidate\CAN\ETX \SOH(\bR\SYNactiveSessionCandidate\DC2!\n\
      \\fnum_sessions\CAN\EOT \SOH(\rR\vnumSessions\DC25\n\
      \\bsessions\CAN\ENQ \ETX(\v2\EM.wtclientrpc.TowerSessionR\bsessions"
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
              Data.ProtoLens.FieldDescriptor Tower
        addresses__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "addresses"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"addresses")) ::
              Data.ProtoLens.FieldDescriptor Tower
        activeSessionCandidate__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "active_session_candidate"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"activeSessionCandidate")) ::
              Data.ProtoLens.FieldDescriptor Tower
        numSessions__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_sessions"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numSessions")) ::
              Data.ProtoLens.FieldDescriptor Tower
        sessions__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sessions"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TowerSession)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"sessions")) ::
              Data.ProtoLens.FieldDescriptor Tower
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, pubkey__field_descriptor),
           (Data.ProtoLens.Tag 2, addresses__field_descriptor),
           (Data.ProtoLens.Tag 3, activeSessionCandidate__field_descriptor),
           (Data.ProtoLens.Tag 4, numSessions__field_descriptor),
           (Data.ProtoLens.Tag 5, sessions__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Tower'_unknownFields
        (\ x__ y__ -> x__ {_Tower'_unknownFields = y__})
  defMessage
    = Tower'_constructor
        {_Tower'pubkey = Data.ProtoLens.fieldDefault,
         _Tower'addresses = Data.Vector.Generic.empty,
         _Tower'activeSessionCandidate = Data.ProtoLens.fieldDefault,
         _Tower'numSessions = Data.ProtoLens.fieldDefault,
         _Tower'sessions = Data.Vector.Generic.empty,
         _Tower'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Tower
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld TowerSession
                -> Data.ProtoLens.Encoding.Bytes.Parser Tower
        loop x mutable'addresses mutable'sessions
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'addresses <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'addresses)
                      frozen'sessions <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'sessions)
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
                              (Data.ProtoLens.Field.field @"vec'addresses") frozen'addresses
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'sessions") frozen'sessions x)))
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
                                  mutable'addresses mutable'sessions
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
                                        "addresses"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'addresses y)
                                loop x v mutable'sessions
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "active_session_candidate"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"activeSessionCandidate") y x)
                                  mutable'addresses mutable'sessions
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_sessions"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"numSessions") y x)
                                  mutable'addresses mutable'sessions
                        42
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "sessions"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'sessions y)
                                loop x mutable'addresses v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'addresses mutable'sessions
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'addresses <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'sessions <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'addresses mutable'sessions)
          "Tower"
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
                      (Data.ProtoLens.Field.field @"vec'addresses") _x))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"activeSessionCandidate") _x
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
                           = Lens.Family2.view (Data.ProtoLens.Field.field @"numSessions") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                            (\ _v
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                    ((Prelude..)
                                       (\ bs
                                          -> (Data.Monoid.<>)
                                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                  (Prelude.fromIntegral
                                                     (Data.ByteString.length bs)))
                                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                       Data.ProtoLens.encodeMessage _v))
                            (Lens.Family2.view
                               (Data.ProtoLens.Field.field @"vec'sessions") _x))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Tower where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Tower'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Tower'pubkey x__)
                (Control.DeepSeq.deepseq
                   (_Tower'addresses x__)
                   (Control.DeepSeq.deepseq
                      (_Tower'activeSessionCandidate x__)
                      (Control.DeepSeq.deepseq
                         (_Tower'numSessions x__)
                         (Control.DeepSeq.deepseq (_Tower'sessions x__) ())))))
{- | Fields :
     
         * 'Proto.Wtclientrpc.Wtclient_Fields.numBackups' @:: Lens' TowerSession Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.numPendingBackups' @:: Lens' TowerSession Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.maxBackups' @:: Lens' TowerSession Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.sweepSatPerByte' @:: Lens' TowerSession Data.Word.Word32@
         * 'Proto.Wtclientrpc.Wtclient_Fields.sweepSatPerVbyte' @:: Lens' TowerSession Data.Word.Word32@ -}
data TowerSession
  = TowerSession'_constructor {_TowerSession'numBackups :: !Data.Word.Word32,
                               _TowerSession'numPendingBackups :: !Data.Word.Word32,
                               _TowerSession'maxBackups :: !Data.Word.Word32,
                               _TowerSession'sweepSatPerByte :: !Data.Word.Word32,
                               _TowerSession'sweepSatPerVbyte :: !Data.Word.Word32,
                               _TowerSession'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show TowerSession where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out TowerSession
instance Data.ProtoLens.Field.HasField TowerSession "numBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TowerSession'numBackups
           (\ x__ y__ -> x__ {_TowerSession'numBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TowerSession "numPendingBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TowerSession'numPendingBackups
           (\ x__ y__ -> x__ {_TowerSession'numPendingBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TowerSession "maxBackups" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TowerSession'maxBackups
           (\ x__ y__ -> x__ {_TowerSession'maxBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TowerSession "sweepSatPerByte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TowerSession'sweepSatPerByte
           (\ x__ y__ -> x__ {_TowerSession'sweepSatPerByte = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TowerSession "sweepSatPerVbyte" Data.Word.Word32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TowerSession'sweepSatPerVbyte
           (\ x__ y__ -> x__ {_TowerSession'sweepSatPerVbyte = y__}))
        Prelude.id
instance Data.ProtoLens.Message TowerSession where
  messageName _ = Data.Text.pack "wtclientrpc.TowerSession"
  packedMessageDescriptor _
    = "\n\
      \\fTowerSession\DC2\US\n\
      \\vnum_backups\CAN\SOH \SOH(\rR\n\
      \numBackups\DC2.\n\
      \\DC3num_pending_backups\CAN\STX \SOH(\rR\DC1numPendingBackups\DC2\US\n\
      \\vmax_backups\CAN\ETX \SOH(\rR\n\
      \maxBackups\DC2/\n\
      \\DC2sweep_sat_per_byte\CAN\EOT \SOH(\rR\SIsweepSatPerByteB\STX\CAN\SOH\DC2-\n\
      \\DC3sweep_sat_per_vbyte\CAN\ENQ \SOH(\rR\DLEsweepSatPerVbyte"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        numBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numBackups")) ::
              Data.ProtoLens.FieldDescriptor TowerSession
        numPendingBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "num_pending_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"numPendingBackups")) ::
              Data.ProtoLens.FieldDescriptor TowerSession
        maxBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "max_backups"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"maxBackups")) ::
              Data.ProtoLens.FieldDescriptor TowerSession
        sweepSatPerByte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sweep_sat_per_byte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sweepSatPerByte")) ::
              Data.ProtoLens.FieldDescriptor TowerSession
        sweepSatPerVbyte__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "sweep_sat_per_vbyte"
              (Data.ProtoLens.ScalarField Data.ProtoLens.UInt32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Word.Word32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"sweepSatPerVbyte")) ::
              Data.ProtoLens.FieldDescriptor TowerSession
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, numBackups__field_descriptor),
           (Data.ProtoLens.Tag 2, numPendingBackups__field_descriptor),
           (Data.ProtoLens.Tag 3, maxBackups__field_descriptor),
           (Data.ProtoLens.Tag 4, sweepSatPerByte__field_descriptor),
           (Data.ProtoLens.Tag 5, sweepSatPerVbyte__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TowerSession'_unknownFields
        (\ x__ y__ -> x__ {_TowerSession'_unknownFields = y__})
  defMessage
    = TowerSession'_constructor
        {_TowerSession'numBackups = Data.ProtoLens.fieldDefault,
         _TowerSession'numPendingBackups = Data.ProtoLens.fieldDefault,
         _TowerSession'maxBackups = Data.ProtoLens.fieldDefault,
         _TowerSession'sweepSatPerByte = Data.ProtoLens.fieldDefault,
         _TowerSession'sweepSatPerVbyte = Data.ProtoLens.fieldDefault,
         _TowerSession'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TowerSession -> Data.ProtoLens.Encoding.Bytes.Parser TowerSession
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
                                       "num_backups"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"numBackups") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "num_pending_backups"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"numPendingBackups") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "max_backups"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"maxBackups") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sweep_sat_per_byte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sweepSatPerByte") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "sweep_sat_per_vbyte"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"sweepSatPerVbyte") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "TowerSession"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view (Data.ProtoLens.Field.field @"numBackups") _x
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
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"numPendingBackups") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"maxBackups") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"sweepSatPerByte") _x
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
                            _v
                              = Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"sweepSatPerVbyte") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral
                                     _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData TowerSession where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TowerSession'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TowerSession'numBackups x__)
                (Control.DeepSeq.deepseq
                   (_TowerSession'numPendingBackups x__)
                   (Control.DeepSeq.deepseq
                      (_TowerSession'maxBackups x__)
                      (Control.DeepSeq.deepseq
                         (_TowerSession'sweepSatPerByte x__)
                         (Control.DeepSeq.deepseq
                            (_TowerSession'sweepSatPerVbyte x__) ())))))
data WatchtowerClient = WatchtowerClient {}
instance Data.ProtoLens.Service.Types.Service WatchtowerClient where
  type ServiceName WatchtowerClient = "WatchtowerClient"
  type ServicePackage WatchtowerClient = "wtclientrpc"
  type ServiceMethods WatchtowerClient = '["addTower",
                                           "getTowerInfo",
                                           "listTowers",
                                           "policy",
                                           "removeTower",
                                           "stats"]
  packedServiceDescriptor _
    = "\n\
      \\DLEWatchtowerClient\DC2G\n\
      \\bAddTower\DC2\FS.wtclientrpc.AddTowerRequest\SUB\GS.wtclientrpc.AddTowerResponse\DC2P\n\
      \\vRemoveTower\DC2\US.wtclientrpc.RemoveTowerRequest\SUB .wtclientrpc.RemoveTowerResponse\DC2M\n\
      \\n\
      \ListTowers\DC2\RS.wtclientrpc.ListTowersRequest\SUB\US.wtclientrpc.ListTowersResponse\DC2D\n\
      \\fGetTowerInfo\DC2 .wtclientrpc.GetTowerInfoRequest\SUB\DC2.wtclientrpc.Tower\DC2>\n\
      \\ENQStats\DC2\EM.wtclientrpc.StatsRequest\SUB\SUB.wtclientrpc.StatsResponse\DC2A\n\
      \\ACKPolicy\DC2\SUB.wtclientrpc.PolicyRequest\SUB\ESC.wtclientrpc.PolicyResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "addTower" where
  type MethodName WatchtowerClient "addTower" = "AddTower"
  type MethodInput WatchtowerClient "addTower" = AddTowerRequest
  type MethodOutput WatchtowerClient "addTower" = AddTowerResponse
  type MethodStreamingType WatchtowerClient "addTower" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "removeTower" where
  type MethodName WatchtowerClient "removeTower" = "RemoveTower"
  type MethodInput WatchtowerClient "removeTower" = RemoveTowerRequest
  type MethodOutput WatchtowerClient "removeTower" = RemoveTowerResponse
  type MethodStreamingType WatchtowerClient "removeTower" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "listTowers" where
  type MethodName WatchtowerClient "listTowers" = "ListTowers"
  type MethodInput WatchtowerClient "listTowers" = ListTowersRequest
  type MethodOutput WatchtowerClient "listTowers" = ListTowersResponse
  type MethodStreamingType WatchtowerClient "listTowers" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "getTowerInfo" where
  type MethodName WatchtowerClient "getTowerInfo" = "GetTowerInfo"
  type MethodInput WatchtowerClient "getTowerInfo" = GetTowerInfoRequest
  type MethodOutput WatchtowerClient "getTowerInfo" = Tower
  type MethodStreamingType WatchtowerClient "getTowerInfo" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "stats" where
  type MethodName WatchtowerClient "stats" = "Stats"
  type MethodInput WatchtowerClient "stats" = StatsRequest
  type MethodOutput WatchtowerClient "stats" = StatsResponse
  type MethodStreamingType WatchtowerClient "stats" = 'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WatchtowerClient "policy" where
  type MethodName WatchtowerClient "policy" = "Policy"
  type MethodInput WatchtowerClient "policy" = PolicyRequest
  type MethodOutput WatchtowerClient "policy" = PolicyResponse
  type MethodStreamingType WatchtowerClient "policy" = 'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SUBwtclientrpc/wtclient.proto\DC2\vwtclientrpc\"C\n\
    \\SIAddTowerRequest\DC2\SYN\n\
    \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\CAN\n\
    \\aaddress\CAN\STX \SOH(\tR\aaddress\"\DC2\n\
    \\DLEAddTowerResponse\"F\n\
    \\DC2RemoveTowerRequest\DC2\SYN\n\
    \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\CAN\n\
    \\aaddress\CAN\STX \SOH(\tR\aaddress\"\NAK\n\
    \\DC3RemoveTowerResponse\"X\n\
    \\DC3GetTowerInfoRequest\DC2\SYN\n\
    \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2)\n\
    \\DLEinclude_sessions\CAN\STX \SOH(\bR\SIincludeSessions\"\224\SOH\n\
    \\fTowerSession\DC2\US\n\
    \\vnum_backups\CAN\SOH \SOH(\rR\n\
    \numBackups\DC2.\n\
    \\DC3num_pending_backups\CAN\STX \SOH(\rR\DC1numPendingBackups\DC2\US\n\
    \\vmax_backups\CAN\ETX \SOH(\rR\n\
    \maxBackups\DC2/\n\
    \\DC2sweep_sat_per_byte\CAN\EOT \SOH(\rR\SIsweepSatPerByteB\STX\CAN\SOH\DC2-\n\
    \\DC3sweep_sat_per_vbyte\CAN\ENQ \SOH(\rR\DLEsweepSatPerVbyte\"\209\SOH\n\
    \\ENQTower\DC2\SYN\n\
    \\ACKpubkey\CAN\SOH \SOH(\fR\ACKpubkey\DC2\FS\n\
    \\taddresses\CAN\STX \ETX(\tR\taddresses\DC28\n\
    \\CANactive_session_candidate\CAN\ETX \SOH(\bR\SYNactiveSessionCandidate\DC2!\n\
    \\fnum_sessions\CAN\EOT \SOH(\rR\vnumSessions\DC25\n\
    \\bsessions\CAN\ENQ \ETX(\v2\EM.wtclientrpc.TowerSessionR\bsessions\">\n\
    \\DC1ListTowersRequest\DC2)\n\
    \\DLEinclude_sessions\CAN\SOH \SOH(\bR\SIincludeSessions\"@\n\
    \\DC2ListTowersResponse\DC2*\n\
    \\ACKtowers\CAN\SOH \ETX(\v2\DC2.wtclientrpc.TowerR\ACKtowers\"\SO\n\
    \\fStatsRequest\"\248\SOH\n\
    \\rStatsResponse\DC2\US\n\
    \\vnum_backups\CAN\SOH \SOH(\rR\n\
    \numBackups\DC2.\n\
    \\DC3num_pending_backups\CAN\STX \SOH(\rR\DC1numPendingBackups\DC2,\n\
    \\DC2num_failed_backups\CAN\ETX \SOH(\rR\DLEnumFailedBackups\DC22\n\
    \\NAKnum_sessions_acquired\CAN\EOT \SOH(\rR\DC3numSessionsAcquired\DC24\n\
    \\SYNnum_sessions_exhausted\CAN\ENQ \SOH(\rR\DC4numSessionsExhausted\"I\n\
    \\rPolicyRequest\DC28\n\
    \\vpolicy_type\CAN\SOH \SOH(\SO2\ETB.wtclientrpc.PolicyTypeR\n\
    \policyType\"\145\SOH\n\
    \\SOPolicyResponse\DC2\US\n\
    \\vmax_updates\CAN\SOH \SOH(\rR\n\
    \maxUpdates\DC2/\n\
    \\DC2sweep_sat_per_byte\CAN\STX \SOH(\rR\SIsweepSatPerByteB\STX\CAN\SOH\DC2-\n\
    \\DC3sweep_sat_per_vbyte\CAN\ETX \SOH(\rR\DLEsweepSatPerVbyte*$\n\
    \\n\
    \PolicyType\DC2\n\
    \\n\
    \\ACKLEGACY\DLE\NUL\DC2\n\
    \\n\
    \\ACKANCHOR\DLE\SOH2\197\ETX\n\
    \\DLEWatchtowerClient\DC2G\n\
    \\bAddTower\DC2\FS.wtclientrpc.AddTowerRequest\SUB\GS.wtclientrpc.AddTowerResponse\DC2P\n\
    \\vRemoveTower\DC2\US.wtclientrpc.RemoveTowerRequest\SUB .wtclientrpc.RemoveTowerResponse\DC2M\n\
    \\n\
    \ListTowers\DC2\RS.wtclientrpc.ListTowersRequest\SUB\US.wtclientrpc.ListTowersResponse\DC2D\n\
    \\fGetTowerInfo\DC2 .wtclientrpc.GetTowerInfoRequest\SUB\DC2.wtclientrpc.Tower\DC2>\n\
    \\ENQStats\DC2\EM.wtclientrpc.StatsRequest\SUB\SUB.wtclientrpc.StatsResponse\DC2A\n\
    \\ACKPolicy\DC2\SUB.wtclientrpc.PolicyRequest\SUB\ESC.wtclientrpc.PolicyResponseB3Z1github.com/lightningnetwork/lnd/lnrpc/wtclientrpcJ\160.\n\
    \\a\DC2\ENQ\NUL\NUL\192\SOH\SOH\n\
    \\b\n\
    \\SOH\f\DC2\ETX\NUL\NUL\DC2\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\STX\NUL\DC4\n\
    \\b\n\
    \\SOH\b\DC2\ETX\EOT\NULH\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\EOT\NULH\n\
    \u\n\
    \\STX\ACK\NUL\DC2\EOT\b\NUL$\SOH\SUBi WatchtowerClient is a service that grants access to the watchtower client\n\
    \ functionality of the daemon.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\b\b\CAN\n\
    \\251\SOH\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX\SI\EOT>\SUB\237\SOH\n\
    \AddTower adds a new watchtower reachable at the given address and\n\
    \considers it for new sessions. If the watchtower already exists, then\n\
    \any new addresses included will be considered when dialing it for\n\
    \session negotiations and backups.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX\SI\b\DLE\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX\SI\DC2!\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX\SI,<\n\
    \\160\STX\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX\ETB\EOTG\SUB\146\STX\n\
    \RemoveTower removes a watchtower from being considered for future session\n\
    \negotiations and from being used for any subsequent backups until it's added\n\
    \again. If an address is provided, then this RPC only serves as a way of\n\
    \removing the address from the watchtower instead.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX\ETB\b\DC3\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX\ETB\NAK'\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX\ETB2E\n\
    \U\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX\SUB\EOTD\SUBH ListTowers returns the list of watchtowers registered with the client.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX\SUB\b\DC2\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX\SUB\DC4%\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX\SUB0B\n\
    \N\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETX\GS\EOT;\SUBA GetTowerInfo retrieves information for a registered watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETX\GS\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETX\GS\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETX\GS49\n\
    \R\n\
    \\EOT\ACK\NUL\STX\EOT\DC2\ETX \EOT5\SUBE Stats returns the in-memory statistics of the client since startup.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\SOH\DC2\ETX \b\r\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\STX\DC2\ETX \SI\ESC\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\EOT\ETX\DC2\ETX &3\n\
    \P\n\
    \\EOT\ACK\NUL\STX\ENQ\DC2\ETX#\EOT8\SUBC Policy returns the active watchtower client policy configuration.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\SOH\DC2\ETX#\b\SO\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\STX\DC2\ETX#\DLE\GS\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ENQ\ETX\DC2\ETX#(6\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOT&\NUL,\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX&\b\ETB\n\
    \C\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX(\EOT\NAK\SUB6 The identifying public key of the watchtower to add.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETX(\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX(\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX(\DC3\DC4\n\
    \B\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX+\EOT\ETB\SUB5 A network address the watchtower is reachable over.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETX+\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX+\v\DC2\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX+\NAK\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT.\NUL/\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX.\b\CAN\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT1\NUL;\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX1\b\SUB\n\
    \F\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX3\EOT\NAK\SUB9 The identifying public key of the watchtower to remove.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX3\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX3\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX3\DC3\DC4\n\
    \\196\SOH\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETX:\EOT\ETB\SUB\182\SOH\n\
    \If set, then the record for this address will be removed, indicating that is\n\
    \is stale. Otherwise, the watchtower will no longer be used for future\n\
    \session negotiations and backups.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETX:\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETX:\v\DC2\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETX:\NAK\SYN\n\
    \\n\
    \\n\
    \\STX\EOT\ETX\DC2\EOT=\NUL>\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETX=\b\ESC\n\
    \\n\
    \\n\
    \\STX\EOT\EOT\DC2\EOT@\NULF\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\EOT\SOH\DC2\ETX@\b\ESC\n\
    \X\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\ETXB\EOT\NAK\SUBK The identifying public key of the watchtower to retrieve information for.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\ETXB\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\ETXB\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\ETXB\DC3\DC4\n\
    \V\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\ETXE\EOT\RS\SUBI Whether we should include sessions with the watchtower in the response.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\ETXE\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\ETXE\t\EM\n\
    \\f\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\ETXE\FS\GS\n\
    \\n\
    \\n\
    \\STX\EOT\ENQ\DC2\EOTH\NULd\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ENQ\SOH\DC2\ETXH\b\DC4\n\
    \d\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\ETXM\EOT\ESC\SUBW\n\
    \The total number of successful backups that have been made to the\n\
    \watchtower session.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\ETXM\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\ETXM\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\ETXM\EM\SUB\n\
    \z\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\ETXS\EOT#\SUBm\n\
    \The total number of backups in the session that are currently pending to be\n\
    \acknowledged by the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\ETXS\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\ETXS\v\RS\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\ETXS!\"\n\
    \O\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\ETXV\EOT\ESC\SUBB The maximum number of backups allowed by the watchtower session.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ENQ\DC2\ETXV\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\ETXV\v\SYN\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\ETXV\EM\SUB\n\
    \\187\SOH\n\
    \\EOT\EOT\ENQ\STX\ETX\DC2\ETX]\EOT6\SUB\173\SOH\n\
    \Deprecated, use sweep_sat_per_vbyte.\n\
    \The fee rate, in satoshis per vbyte, that will be used by the watchtower for\n\
    \the justice transaction in the event of a channel breach.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\ETX\ENQ\DC2\ETX]\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\ETX\SOH\DC2\ETX]\v\GS\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\ETX\ETX\DC2\ETX] !\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\ETX\b\DC2\ETX]\"5\n\
    \\r\n\
    \\ACK\EOT\ENQ\STX\ETX\b\ETX\DC2\ETX]#4\n\
    \\150\SOH\n\
    \\EOT\EOT\ENQ\STX\EOT\DC2\ETXc\EOT#\SUB\136\SOH\n\
    \The fee rate, in satoshis per vbyte, that will be used by the watchtower for\n\
    \the justice transaction in the event of a channel breach.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\EOT\ENQ\DC2\ETXc\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\EOT\SOH\DC2\ETXc\v\RS\n\
    \\f\n\
    \\ENQ\EOT\ENQ\STX\EOT\ETX\DC2\ETXc!\"\n\
    \\n\
    \\n\
    \\STX\EOT\ACK\DC2\EOTf\NULu\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\ACK\SOH\DC2\ETXf\b\r\n\
    \<\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\ETXh\EOT\NAK\SUB/ The identifying public key of the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\ETXh\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\ETXh\n\
    \\DLE\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\ETXh\DC3\DC4\n\
    \F\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\ETXk\EOT\"\SUB9 The list of addresses the watchtower is reachable over.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\EOT\DC2\ETXk\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\ETXk\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\ETXk\DC4\GS\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\ETXk !\n\
    \P\n\
    \\EOT\EOT\ACK\STX\STX\DC2\ETXn\EOT&\SUBC Whether the watchtower is currently a candidate for new sessions.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\ENQ\DC2\ETXn\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\ETXn\t!\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\ETXn$%\n\
    \T\n\
    \\EOT\EOT\ACK\STX\ETX\DC2\ETXq\EOT\FS\SUBG The number of sessions that have been negotiated with the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\ENQ\DC2\ETXq\EOT\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\SOH\DC2\ETXq\v\ETB\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\ETX\ETX\DC2\ETXq\SUB\ESC\n\
    \R\n\
    \\EOT\EOT\ACK\STX\EOT\DC2\ETXt\EOT'\SUBE The list of sessions that have been negotiated with the watchtower.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\EOT\DC2\ETXt\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\ACK\DC2\ETXt\r\EM\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\SOH\DC2\ETXt\SUB\"\n\
    \\f\n\
    \\ENQ\EOT\ACK\STX\EOT\ETX\DC2\ETXt%&\n\
    \\n\
    \\n\
    \\STX\EOT\a\DC2\EOTw\NULz\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\a\SOH\DC2\ETXw\b\EM\n\
    \V\n\
    \\EOT\EOT\a\STX\NUL\DC2\ETXy\EOT\RS\SUBI Whether we should include sessions with the watchtower in the response.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\ETXy\EOT\b\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\ETXy\t\EM\n\
    \\f\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\ETXy\FS\GS\n\
    \\n\
    \\n\
    \\STX\EOT\b\DC2\EOT|\NUL\DEL\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\b\SOH\DC2\ETX|\b\SUB\n\
    \A\n\
    \\EOT\EOT\b\STX\NUL\DC2\ETX~\EOT\RS\SUB4 The list of watchtowers available for new backups.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\EOT\DC2\ETX~\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ACK\DC2\ETX~\r\DC2\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\ETX~\DC3\EM\n\
    \\f\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\ETX~\FS\GS\n\
    \\f\n\
    \\STX\EOT\t\DC2\ACK\129\SOH\NUL\130\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\129\SOH\b\DC4\n\
    \\f\n\
    \\STX\EOT\n\
    \\DC2\ACK\132\SOH\NUL\156\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\132\SOH\b\NAK\n\
    \a\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\137\SOH\EOT\ESC\SUBS\n\
    \The total number of backups made to all active and exhausted watchtower\n\
    \sessions.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ENQ\DC2\EOT\137\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\137\SOH\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\137\SOH\EM\SUB\n\
    \\128\SOH\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\143\SOH\EOT#\SUBr\n\
    \The total number of backups that are pending to be acknowledged by all\n\
    \active and exhausted watchtower sessions.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ENQ\DC2\EOT\143\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\143\SOH\v\RS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\143\SOH!\"\n\
    \y\n\
    \\EOT\EOT\n\
    \\STX\STX\DC2\EOT\149\SOH\EOT\"\SUBk\n\
    \The total number of backups that all active and exhausted watchtower\n\
    \sessions have failed to acknowledge.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ENQ\DC2\EOT\149\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\SOH\DC2\EOT\149\SOH\v\GS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ETX\DC2\EOT\149\SOH !\n\
    \E\n\
    \\EOT\EOT\n\
    \\STX\ETX\DC2\EOT\152\SOH\EOT%\SUB7 The total number of new sessions made to watchtowers.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ENQ\DC2\EOT\152\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\SOH\DC2\EOT\152\SOH\v \n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ETX\DC2\EOT\152\SOH#$\n\
    \Q\n\
    \\EOT\EOT\n\
    \\STX\EOT\DC2\EOT\155\SOH\EOT&\SUBC The total number of watchtower sessions that have been exhausted.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ENQ\DC2\EOT\155\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\SOH\DC2\EOT\155\SOH\v!\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ETX\DC2\EOT\155\SOH$%\n\
    \\f\n\
    \\STX\ENQ\NUL\DC2\ACK\158\SOH\NUL\164\SOH\SOH\n\
    \\v\n\
    \\ETX\ENQ\NUL\SOH\DC2\EOT\158\SOH\ENQ\SI\n\
    \@\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\EOT\160\SOH\EOT\SI\SUB2 Selects the policy from the legacy tower client.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\EOT\160\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\EOT\160\SOH\r\SO\n\
    \@\n\
    \\EOT\ENQ\NUL\STX\SOH\DC2\EOT\163\SOH\EOT\SI\SUB2 Selects the policy from the anchor tower client.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\SOH\DC2\EOT\163\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\NUL\STX\SOH\STX\DC2\EOT\163\SOH\r\SO\n\
    \\f\n\
    \\STX\EOT\v\DC2\ACK\166\SOH\NUL\171\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\166\SOH\b\NAK\n\
    \R\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\170\SOH\EOT\US\SUBD\n\
    \The client type from which to retrieve the active offering policy.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ACK\DC2\EOT\170\SOH\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\170\SOH\SI\SUB\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\170\SOH\GS\RS\n\
    \\f\n\
    \\STX\EOT\f\DC2\ACK\173\SOH\NUL\192\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\173\SOH\b\SYN\n\
    \f\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\178\SOH\EOT\ESC\SUBX\n\
    \The maximum number of updates each session we negotiate with watchtowers\n\
    \should allow.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\EOT\178\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\178\SOH\v\SYN\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\178\SOH\EM\SUB\n\
    \\181\SOH\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\185\SOH\EOT6\SUB\166\SOH\n\
    \Deprecated, use sweep_sat_per_vbyte.\n\
    \The fee rate, in satoshis per vbyte, that will be used by watchtowers for\n\
    \justice transactions in response to channel breaches.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ENQ\DC2\EOT\185\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\185\SOH\v\GS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\185\SOH !\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\b\DC2\EOT\185\SOH\"5\n\
    \\SO\n\
    \\ACK\EOT\f\STX\SOH\b\ETX\DC2\EOT\185\SOH#4\n\
    \\144\SOH\n\
    \\EOT\EOT\f\STX\STX\DC2\EOT\191\SOH\EOT#\SUB\129\SOH\n\
    \The fee rate, in satoshis per vbyte, that will be used by watchtowers for\n\
    \justice transactions in response to channel breaches.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ENQ\DC2\EOT\191\SOH\EOT\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\SOH\DC2\EOT\191\SOH\v\RS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\STX\ETX\DC2\EOT\191\SOH!\"b\ACKproto3"