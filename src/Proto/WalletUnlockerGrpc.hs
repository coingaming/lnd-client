{- This file was auto-generated from wallet_unlocker_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies, DeriveGeneric#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.WalletUnlockerGrpc (
        WalletUnlocker(..), ChangePasswordRequest(),
        ChangePasswordResponse(), GenSeedRequest(), GenSeedResponse(),
        InitWalletRequest(), InitWalletResponse(), UnlockWalletRequest(),
        UnlockWalletResponse()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
import qualified LndClient.Orphan
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
import qualified Proto.LndGrpc
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.currentPassword' @:: Lens' ChangePasswordRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.newPassword' @:: Lens' ChangePasswordRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.statelessInit' @:: Lens' ChangePasswordRequest Prelude.Bool@
         * 'Proto.WalletUnlockerGrpc_Fields.newMacaroonRootKey' @:: Lens' ChangePasswordRequest Prelude.Bool@ -}
data ChangePasswordRequest
  = ChangePasswordRequest'_constructor {_ChangePasswordRequest'currentPassword :: !Data.ByteString.ByteString,
                                        _ChangePasswordRequest'newPassword :: !Data.ByteString.ByteString,
                                        _ChangePasswordRequest'statelessInit :: !Prelude.Bool,
                                        _ChangePasswordRequest'newMacaroonRootKey :: !Prelude.Bool,
                                        _ChangePasswordRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ChangePasswordRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ChangePasswordRequest
instance Data.ProtoLens.Field.HasField ChangePasswordRequest "currentPassword" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordRequest'currentPassword
           (\ x__ y__ -> x__ {_ChangePasswordRequest'currentPassword = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ChangePasswordRequest "newPassword" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordRequest'newPassword
           (\ x__ y__ -> x__ {_ChangePasswordRequest'newPassword = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ChangePasswordRequest "statelessInit" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordRequest'statelessInit
           (\ x__ y__ -> x__ {_ChangePasswordRequest'statelessInit = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ChangePasswordRequest "newMacaroonRootKey" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordRequest'newMacaroonRootKey
           (\ x__ y__
              -> x__ {_ChangePasswordRequest'newMacaroonRootKey = y__}))
        Prelude.id
instance Data.ProtoLens.Message ChangePasswordRequest where
  messageName _ = Data.Text.pack "lnrpc.ChangePasswordRequest"
  packedMessageDescriptor _
    = "\n\
      \\NAKChangePasswordRequest\DC2)\n\
      \\DLEcurrent_password\CAN\SOH \SOH(\fR\SIcurrentPassword\DC2!\n\
      \\fnew_password\CAN\STX \SOH(\fR\vnewPassword\DC2%\n\
      \\SOstateless_init\CAN\ETX \SOH(\bR\rstatelessInit\DC21\n\
      \\NAKnew_macaroon_root_key\CAN\EOT \SOH(\bR\DC2newMacaroonRootKey"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        currentPassword__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "current_password"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"currentPassword")) ::
              Data.ProtoLens.FieldDescriptor ChangePasswordRequest
        newPassword__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "new_password"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"newPassword")) ::
              Data.ProtoLens.FieldDescriptor ChangePasswordRequest
        statelessInit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "stateless_init"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"statelessInit")) ::
              Data.ProtoLens.FieldDescriptor ChangePasswordRequest
        newMacaroonRootKey__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "new_macaroon_root_key"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"newMacaroonRootKey")) ::
              Data.ProtoLens.FieldDescriptor ChangePasswordRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, currentPassword__field_descriptor),
           (Data.ProtoLens.Tag 2, newPassword__field_descriptor),
           (Data.ProtoLens.Tag 3, statelessInit__field_descriptor),
           (Data.ProtoLens.Tag 4, newMacaroonRootKey__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ChangePasswordRequest'_unknownFields
        (\ x__ y__ -> x__ {_ChangePasswordRequest'_unknownFields = y__})
  defMessage
    = ChangePasswordRequest'_constructor
        {_ChangePasswordRequest'currentPassword = Data.ProtoLens.fieldDefault,
         _ChangePasswordRequest'newPassword = Data.ProtoLens.fieldDefault,
         _ChangePasswordRequest'statelessInit = Data.ProtoLens.fieldDefault,
         _ChangePasswordRequest'newMacaroonRootKey = Data.ProtoLens.fieldDefault,
         _ChangePasswordRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ChangePasswordRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser ChangePasswordRequest
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
                                       "current_password"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"currentPassword") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "new_password"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"newPassword") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "stateless_init"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"statelessInit") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "new_macaroon_root_key"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"newMacaroonRootKey") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ChangePasswordRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"currentPassword") _x
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
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"newPassword") _x
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
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"statelessInit") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt
                               (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"newMacaroonRootKey") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0)
                                  _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ChangePasswordRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ChangePasswordRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ChangePasswordRequest'currentPassword x__)
                (Control.DeepSeq.deepseq
                   (_ChangePasswordRequest'newPassword x__)
                   (Control.DeepSeq.deepseq
                      (_ChangePasswordRequest'statelessInit x__)
                      (Control.DeepSeq.deepseq
                         (_ChangePasswordRequest'newMacaroonRootKey x__) ()))))
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.adminMacaroon' @:: Lens' ChangePasswordResponse Data.ByteString.ByteString@ -}
data ChangePasswordResponse
  = ChangePasswordResponse'_constructor {_ChangePasswordResponse'adminMacaroon :: !Data.ByteString.ByteString,
                                         _ChangePasswordResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show ChangePasswordResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out ChangePasswordResponse
instance Data.ProtoLens.Field.HasField ChangePasswordResponse "adminMacaroon" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordResponse'adminMacaroon
           (\ x__ y__ -> x__ {_ChangePasswordResponse'adminMacaroon = y__}))
        Prelude.id
instance Data.ProtoLens.Message ChangePasswordResponse where
  messageName _ = Data.Text.pack "lnrpc.ChangePasswordResponse"
  packedMessageDescriptor _
    = "\n\
      \\SYNChangePasswordResponse\DC2%\n\
      \\SOadmin_macaroon\CAN\SOH \SOH(\fR\radminMacaroon"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        adminMacaroon__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "admin_macaroon"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"adminMacaroon")) ::
              Data.ProtoLens.FieldDescriptor ChangePasswordResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, adminMacaroon__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ChangePasswordResponse'_unknownFields
        (\ x__ y__ -> x__ {_ChangePasswordResponse'_unknownFields = y__})
  defMessage
    = ChangePasswordResponse'_constructor
        {_ChangePasswordResponse'adminMacaroon = Data.ProtoLens.fieldDefault,
         _ChangePasswordResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ChangePasswordResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser ChangePasswordResponse
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
                                       "admin_macaroon"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"adminMacaroon") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ChangePasswordResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"adminMacaroon") _x
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
instance Control.DeepSeq.NFData ChangePasswordResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ChangePasswordResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ChangePasswordResponse'adminMacaroon x__) ())
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.aezeedPassphrase' @:: Lens' GenSeedRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.seedEntropy' @:: Lens' GenSeedRequest Data.ByteString.ByteString@ -}
data GenSeedRequest
  = GenSeedRequest'_constructor {_GenSeedRequest'aezeedPassphrase :: !Data.ByteString.ByteString,
                                 _GenSeedRequest'seedEntropy :: !Data.ByteString.ByteString,
                                 _GenSeedRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GenSeedRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GenSeedRequest
instance Data.ProtoLens.Field.HasField GenSeedRequest "aezeedPassphrase" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GenSeedRequest'aezeedPassphrase
           (\ x__ y__ -> x__ {_GenSeedRequest'aezeedPassphrase = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GenSeedRequest "seedEntropy" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GenSeedRequest'seedEntropy
           (\ x__ y__ -> x__ {_GenSeedRequest'seedEntropy = y__}))
        Prelude.id
instance Data.ProtoLens.Message GenSeedRequest where
  messageName _ = Data.Text.pack "lnrpc.GenSeedRequest"
  packedMessageDescriptor _
    = "\n\
      \\SOGenSeedRequest\DC2+\n\
      \\DC1aezeed_passphrase\CAN\SOH \SOH(\fR\DLEaezeedPassphrase\DC2!\n\
      \\fseed_entropy\CAN\STX \SOH(\fR\vseedEntropy"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        aezeedPassphrase__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "aezeed_passphrase"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"aezeedPassphrase")) ::
              Data.ProtoLens.FieldDescriptor GenSeedRequest
        seedEntropy__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "seed_entropy"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"seedEntropy")) ::
              Data.ProtoLens.FieldDescriptor GenSeedRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, aezeedPassphrase__field_descriptor),
           (Data.ProtoLens.Tag 2, seedEntropy__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GenSeedRequest'_unknownFields
        (\ x__ y__ -> x__ {_GenSeedRequest'_unknownFields = y__})
  defMessage
    = GenSeedRequest'_constructor
        {_GenSeedRequest'aezeedPassphrase = Data.ProtoLens.fieldDefault,
         _GenSeedRequest'seedEntropy = Data.ProtoLens.fieldDefault,
         _GenSeedRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GenSeedRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser GenSeedRequest
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
                                       "aezeed_passphrase"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"aezeedPassphrase") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "seed_entropy"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"seedEntropy") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "GenSeedRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"aezeedPassphrase") _x
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
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"seedEntropy") _x
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
instance Control.DeepSeq.NFData GenSeedRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GenSeedRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GenSeedRequest'aezeedPassphrase x__)
                (Control.DeepSeq.deepseq (_GenSeedRequest'seedEntropy x__) ()))
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.cipherSeedMnemonic' @:: Lens' GenSeedResponse [Data.Text.Text]@
         * 'Proto.WalletUnlockerGrpc_Fields.vec'cipherSeedMnemonic' @:: Lens' GenSeedResponse (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.WalletUnlockerGrpc_Fields.encipheredSeed' @:: Lens' GenSeedResponse Data.ByteString.ByteString@ -}
data GenSeedResponse
  = GenSeedResponse'_constructor {_GenSeedResponse'cipherSeedMnemonic :: !(Data.Vector.Vector Data.Text.Text),
                                  _GenSeedResponse'encipheredSeed :: !Data.ByteString.ByteString,
                                  _GenSeedResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show GenSeedResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out GenSeedResponse
instance Data.ProtoLens.Field.HasField GenSeedResponse "cipherSeedMnemonic" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GenSeedResponse'cipherSeedMnemonic
           (\ x__ y__ -> x__ {_GenSeedResponse'cipherSeedMnemonic = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField GenSeedResponse "vec'cipherSeedMnemonic" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GenSeedResponse'cipherSeedMnemonic
           (\ x__ y__ -> x__ {_GenSeedResponse'cipherSeedMnemonic = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField GenSeedResponse "encipheredSeed" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _GenSeedResponse'encipheredSeed
           (\ x__ y__ -> x__ {_GenSeedResponse'encipheredSeed = y__}))
        Prelude.id
instance Data.ProtoLens.Message GenSeedResponse where
  messageName _ = Data.Text.pack "lnrpc.GenSeedResponse"
  packedMessageDescriptor _
    = "\n\
      \\SIGenSeedResponse\DC20\n\
      \\DC4cipher_seed_mnemonic\CAN\SOH \ETX(\tR\DC2cipherSeedMnemonic\DC2'\n\
      \\SIenciphered_seed\CAN\STX \SOH(\fR\SOencipheredSeed"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        cipherSeedMnemonic__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cipher_seed_mnemonic"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"cipherSeedMnemonic")) ::
              Data.ProtoLens.FieldDescriptor GenSeedResponse
        encipheredSeed__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enciphered_seed"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"encipheredSeed")) ::
              Data.ProtoLens.FieldDescriptor GenSeedResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, cipherSeedMnemonic__field_descriptor),
           (Data.ProtoLens.Tag 2, encipheredSeed__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _GenSeedResponse'_unknownFields
        (\ x__ y__ -> x__ {_GenSeedResponse'_unknownFields = y__})
  defMessage
    = GenSeedResponse'_constructor
        {_GenSeedResponse'cipherSeedMnemonic = Data.Vector.Generic.empty,
         _GenSeedResponse'encipheredSeed = Data.ProtoLens.fieldDefault,
         _GenSeedResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          GenSeedResponse
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser GenSeedResponse
        loop x mutable'cipherSeedMnemonic
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'cipherSeedMnemonic <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                     (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                        mutable'cipherSeedMnemonic)
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
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'cipherSeedMnemonic")
                              frozen'cipherSeedMnemonic
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "cipher_seed_mnemonic"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'cipherSeedMnemonic y)
                                loop x v
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "enciphered_seed"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"encipheredSeed") y x)
                                  mutable'cipherSeedMnemonic
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'cipherSeedMnemonic
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'cipherSeedMnemonic <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'cipherSeedMnemonic)
          "GenSeedResponse"
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
                           Data.Text.Encoding.encodeUtf8
                           _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'cipherSeedMnemonic") _x))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"encipheredSeed") _x
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
instance Control.DeepSeq.NFData GenSeedResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_GenSeedResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_GenSeedResponse'cipherSeedMnemonic x__)
                (Control.DeepSeq.deepseq (_GenSeedResponse'encipheredSeed x__) ()))
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.walletPassword' @:: Lens' InitWalletRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.cipherSeedMnemonic' @:: Lens' InitWalletRequest [Data.Text.Text]@
         * 'Proto.WalletUnlockerGrpc_Fields.vec'cipherSeedMnemonic' @:: Lens' InitWalletRequest (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.WalletUnlockerGrpc_Fields.aezeedPassphrase' @:: Lens' InitWalletRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.recoveryWindow' @:: Lens' InitWalletRequest Data.Int.Int32@
         * 'Proto.WalletUnlockerGrpc_Fields.channelBackups' @:: Lens' InitWalletRequest Proto.LndGrpc.ChanBackupSnapshot@
         * 'Proto.WalletUnlockerGrpc_Fields.maybe'channelBackups' @:: Lens' InitWalletRequest (Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot)@
         * 'Proto.WalletUnlockerGrpc_Fields.statelessInit' @:: Lens' InitWalletRequest Prelude.Bool@ -}
data InitWalletRequest
  = InitWalletRequest'_constructor {_InitWalletRequest'walletPassword :: !Data.ByteString.ByteString,
                                    _InitWalletRequest'cipherSeedMnemonic :: !(Data.Vector.Vector Data.Text.Text),
                                    _InitWalletRequest'aezeedPassphrase :: !Data.ByteString.ByteString,
                                    _InitWalletRequest'recoveryWindow :: !Data.Int.Int32,
                                    _InitWalletRequest'channelBackups :: !(Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot),
                                    _InitWalletRequest'statelessInit :: !Prelude.Bool,
                                    _InitWalletRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show InitWalletRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out InitWalletRequest
instance Data.ProtoLens.Field.HasField InitWalletRequest "walletPassword" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'walletPassword
           (\ x__ y__ -> x__ {_InitWalletRequest'walletPassword = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InitWalletRequest "cipherSeedMnemonic" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'cipherSeedMnemonic
           (\ x__ y__ -> x__ {_InitWalletRequest'cipherSeedMnemonic = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField InitWalletRequest "vec'cipherSeedMnemonic" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'cipherSeedMnemonic
           (\ x__ y__ -> x__ {_InitWalletRequest'cipherSeedMnemonic = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InitWalletRequest "aezeedPassphrase" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'aezeedPassphrase
           (\ x__ y__ -> x__ {_InitWalletRequest'aezeedPassphrase = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InitWalletRequest "recoveryWindow" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'recoveryWindow
           (\ x__ y__ -> x__ {_InitWalletRequest'recoveryWindow = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InitWalletRequest "channelBackups" Proto.LndGrpc.ChanBackupSnapshot where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'channelBackups
           (\ x__ y__ -> x__ {_InitWalletRequest'channelBackups = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField InitWalletRequest "maybe'channelBackups" (Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'channelBackups
           (\ x__ y__ -> x__ {_InitWalletRequest'channelBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField InitWalletRequest "statelessInit" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletRequest'statelessInit
           (\ x__ y__ -> x__ {_InitWalletRequest'statelessInit = y__}))
        Prelude.id
instance Data.ProtoLens.Message InitWalletRequest where
  messageName _ = Data.Text.pack "lnrpc.InitWalletRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC1InitWalletRequest\DC2'\n\
      \\SIwallet_password\CAN\SOH \SOH(\fR\SOwalletPassword\DC20\n\
      \\DC4cipher_seed_mnemonic\CAN\STX \ETX(\tR\DC2cipherSeedMnemonic\DC2+\n\
      \\DC1aezeed_passphrase\CAN\ETX \SOH(\fR\DLEaezeedPassphrase\DC2'\n\
      \\SIrecovery_window\CAN\EOT \SOH(\ENQR\SOrecoveryWindow\DC2B\n\
      \\SIchannel_backups\CAN\ENQ \SOH(\v2\EM.lnrpc.ChanBackupSnapshotR\SOchannelBackups\DC2%\n\
      \\SOstateless_init\CAN\ACK \SOH(\bR\rstatelessInit"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        walletPassword__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wallet_password"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"walletPassword")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
        cipherSeedMnemonic__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cipher_seed_mnemonic"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"cipherSeedMnemonic")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
        aezeedPassphrase__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "aezeed_passphrase"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"aezeedPassphrase")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
        recoveryWindow__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "recovery_window"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"recoveryWindow")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
        channelBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "channel_backups"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.ChanBackupSnapshot)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'channelBackups")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
        statelessInit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "stateless_init"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"statelessInit")) ::
              Data.ProtoLens.FieldDescriptor InitWalletRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, walletPassword__field_descriptor),
           (Data.ProtoLens.Tag 2, cipherSeedMnemonic__field_descriptor),
           (Data.ProtoLens.Tag 3, aezeedPassphrase__field_descriptor),
           (Data.ProtoLens.Tag 4, recoveryWindow__field_descriptor),
           (Data.ProtoLens.Tag 5, channelBackups__field_descriptor),
           (Data.ProtoLens.Tag 6, statelessInit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _InitWalletRequest'_unknownFields
        (\ x__ y__ -> x__ {_InitWalletRequest'_unknownFields = y__})
  defMessage
    = InitWalletRequest'_constructor
        {_InitWalletRequest'walletPassword = Data.ProtoLens.fieldDefault,
         _InitWalletRequest'cipherSeedMnemonic = Data.Vector.Generic.empty,
         _InitWalletRequest'aezeedPassphrase = Data.ProtoLens.fieldDefault,
         _InitWalletRequest'recoveryWindow = Data.ProtoLens.fieldDefault,
         _InitWalletRequest'channelBackups = Prelude.Nothing,
         _InitWalletRequest'statelessInit = Data.ProtoLens.fieldDefault,
         _InitWalletRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          InitWalletRequest
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser InitWalletRequest
        loop x mutable'cipherSeedMnemonic
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'cipherSeedMnemonic <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                     (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                        mutable'cipherSeedMnemonic)
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
                           Data.ProtoLens.unknownFields
                           (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'cipherSeedMnemonic")
                              frozen'cipherSeedMnemonic
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "wallet_password"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"walletPassword") y x)
                                  mutable'cipherSeedMnemonic
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
                                        "cipher_seed_mnemonic"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'cipherSeedMnemonic y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.getBytes
                                             (Prelude.fromIntegral len))
                                       "aezeed_passphrase"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"aezeedPassphrase") y x)
                                  mutable'cipherSeedMnemonic
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "recovery_window"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"recoveryWindow") y x)
                                  mutable'cipherSeedMnemonic
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "channel_backups"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"channelBackups") y x)
                                  mutable'cipherSeedMnemonic
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "stateless_init"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"statelessInit") y x)
                                  mutable'cipherSeedMnemonic
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'cipherSeedMnemonic
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'cipherSeedMnemonic <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'cipherSeedMnemonic)
          "InitWalletRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"walletPassword") _x
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
                              Data.Text.Encoding.encodeUtf8
                              _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'cipherSeedMnemonic") _x))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"aezeedPassphrase") _x
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
                               (Data.ProtoLens.Field.field @"recoveryWindow") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                      ((Data.Monoid.<>)
                         (case
                              Lens.Family2.view
                                (Data.ProtoLens.Field.field @"maybe'channelBackups") _x
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
                                      Data.ProtoLens.encodeMessage
                                      _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"statelessInit") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (\ b -> if b then 1 else 0)
                                        _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData InitWalletRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_InitWalletRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_InitWalletRequest'walletPassword x__)
                (Control.DeepSeq.deepseq
                   (_InitWalletRequest'cipherSeedMnemonic x__)
                   (Control.DeepSeq.deepseq
                      (_InitWalletRequest'aezeedPassphrase x__)
                      (Control.DeepSeq.deepseq
                         (_InitWalletRequest'recoveryWindow x__)
                         (Control.DeepSeq.deepseq
                            (_InitWalletRequest'channelBackups x__)
                            (Control.DeepSeq.deepseq
                               (_InitWalletRequest'statelessInit x__) ()))))))
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.adminMacaroon' @:: Lens' InitWalletResponse Data.ByteString.ByteString@ -}
data InitWalletResponse
  = InitWalletResponse'_constructor {_InitWalletResponse'adminMacaroon :: !Data.ByteString.ByteString,
                                     _InitWalletResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show InitWalletResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out InitWalletResponse
instance Data.ProtoLens.Field.HasField InitWalletResponse "adminMacaroon" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletResponse'adminMacaroon
           (\ x__ y__ -> x__ {_InitWalletResponse'adminMacaroon = y__}))
        Prelude.id
instance Data.ProtoLens.Message InitWalletResponse where
  messageName _ = Data.Text.pack "lnrpc.InitWalletResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC2InitWalletResponse\DC2%\n\
      \\SOadmin_macaroon\CAN\SOH \SOH(\fR\radminMacaroon"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        adminMacaroon__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "admin_macaroon"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"adminMacaroon")) ::
              Data.ProtoLens.FieldDescriptor InitWalletResponse
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, adminMacaroon__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _InitWalletResponse'_unknownFields
        (\ x__ y__ -> x__ {_InitWalletResponse'_unknownFields = y__})
  defMessage
    = InitWalletResponse'_constructor
        {_InitWalletResponse'adminMacaroon = Data.ProtoLens.fieldDefault,
         _InitWalletResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          InitWalletResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser InitWalletResponse
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
                                       "admin_macaroon"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"adminMacaroon") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "InitWalletResponse"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"adminMacaroon") _x
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
instance Control.DeepSeq.NFData InitWalletResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_InitWalletResponse'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_InitWalletResponse'adminMacaroon x__) ())
{- | Fields :
     
         * 'Proto.WalletUnlockerGrpc_Fields.walletPassword' @:: Lens' UnlockWalletRequest Data.ByteString.ByteString@
         * 'Proto.WalletUnlockerGrpc_Fields.recoveryWindow' @:: Lens' UnlockWalletRequest Data.Int.Int32@
         * 'Proto.WalletUnlockerGrpc_Fields.channelBackups' @:: Lens' UnlockWalletRequest Proto.LndGrpc.ChanBackupSnapshot@
         * 'Proto.WalletUnlockerGrpc_Fields.maybe'channelBackups' @:: Lens' UnlockWalletRequest (Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot)@
         * 'Proto.WalletUnlockerGrpc_Fields.statelessInit' @:: Lens' UnlockWalletRequest Prelude.Bool@ -}
data UnlockWalletRequest
  = UnlockWalletRequest'_constructor {_UnlockWalletRequest'walletPassword :: !Data.ByteString.ByteString,
                                      _UnlockWalletRequest'recoveryWindow :: !Data.Int.Int32,
                                      _UnlockWalletRequest'channelBackups :: !(Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot),
                                      _UnlockWalletRequest'statelessInit :: !Prelude.Bool,
                                      _UnlockWalletRequest'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show UnlockWalletRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out UnlockWalletRequest
instance Data.ProtoLens.Field.HasField UnlockWalletRequest "walletPassword" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnlockWalletRequest'walletPassword
           (\ x__ y__ -> x__ {_UnlockWalletRequest'walletPassword = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UnlockWalletRequest "recoveryWindow" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnlockWalletRequest'recoveryWindow
           (\ x__ y__ -> x__ {_UnlockWalletRequest'recoveryWindow = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UnlockWalletRequest "channelBackups" Proto.LndGrpc.ChanBackupSnapshot where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnlockWalletRequest'channelBackups
           (\ x__ y__ -> x__ {_UnlockWalletRequest'channelBackups = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UnlockWalletRequest "maybe'channelBackups" (Prelude.Maybe Proto.LndGrpc.ChanBackupSnapshot) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnlockWalletRequest'channelBackups
           (\ x__ y__ -> x__ {_UnlockWalletRequest'channelBackups = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UnlockWalletRequest "statelessInit" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnlockWalletRequest'statelessInit
           (\ x__ y__ -> x__ {_UnlockWalletRequest'statelessInit = y__}))
        Prelude.id
instance Data.ProtoLens.Message UnlockWalletRequest where
  messageName _ = Data.Text.pack "lnrpc.UnlockWalletRequest"
  packedMessageDescriptor _
    = "\n\
      \\DC3UnlockWalletRequest\DC2'\n\
      \\SIwallet_password\CAN\SOH \SOH(\fR\SOwalletPassword\DC2'\n\
      \\SIrecovery_window\CAN\STX \SOH(\ENQR\SOrecoveryWindow\DC2B\n\
      \\SIchannel_backups\CAN\ETX \SOH(\v2\EM.lnrpc.ChanBackupSnapshotR\SOchannelBackups\DC2%\n\
      \\SOstateless_init\CAN\EOT \SOH(\bR\rstatelessInit"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        walletPassword__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "wallet_password"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BytesField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.ByteString.ByteString)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"walletPassword")) ::
              Data.ProtoLens.FieldDescriptor UnlockWalletRequest
        recoveryWindow__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "recovery_window"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"recoveryWindow")) ::
              Data.ProtoLens.FieldDescriptor UnlockWalletRequest
        channelBackups__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "channel_backups"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Proto.LndGrpc.ChanBackupSnapshot)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'channelBackups")) ::
              Data.ProtoLens.FieldDescriptor UnlockWalletRequest
        statelessInit__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "stateless_init"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"statelessInit")) ::
              Data.ProtoLens.FieldDescriptor UnlockWalletRequest
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, walletPassword__field_descriptor),
           (Data.ProtoLens.Tag 2, recoveryWindow__field_descriptor),
           (Data.ProtoLens.Tag 3, channelBackups__field_descriptor),
           (Data.ProtoLens.Tag 4, statelessInit__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UnlockWalletRequest'_unknownFields
        (\ x__ y__ -> x__ {_UnlockWalletRequest'_unknownFields = y__})
  defMessage
    = UnlockWalletRequest'_constructor
        {_UnlockWalletRequest'walletPassword = Data.ProtoLens.fieldDefault,
         _UnlockWalletRequest'recoveryWindow = Data.ProtoLens.fieldDefault,
         _UnlockWalletRequest'channelBackups = Prelude.Nothing,
         _UnlockWalletRequest'statelessInit = Data.ProtoLens.fieldDefault,
         _UnlockWalletRequest'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UnlockWalletRequest
          -> Data.ProtoLens.Encoding.Bytes.Parser UnlockWalletRequest
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
                                       "wallet_password"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"walletPassword") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "recovery_window"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"recoveryWindow") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "channel_backups"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"channelBackups") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "stateless_init"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"statelessInit") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UnlockWalletRequest"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v
                  = Lens.Family2.view
                      (Data.ProtoLens.Field.field @"walletPassword") _x
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
                         (Data.ProtoLens.Field.field @"recoveryWindow") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'channelBackups") _x
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
                                Data.ProtoLens.encodeMessage
                                _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"statelessInit") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0)
                                  _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData UnlockWalletRequest where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UnlockWalletRequest'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UnlockWalletRequest'walletPassword x__)
                (Control.DeepSeq.deepseq
                   (_UnlockWalletRequest'recoveryWindow x__)
                   (Control.DeepSeq.deepseq
                      (_UnlockWalletRequest'channelBackups x__)
                      (Control.DeepSeq.deepseq
                         (_UnlockWalletRequest'statelessInit x__) ()))))
{- | Fields :
      -}
data UnlockWalletResponse
  = UnlockWalletResponse'_constructor {_UnlockWalletResponse'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord, GHC.Generics.Generic)
instance Prelude.Show UnlockWalletResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Text.PrettyPrint.GenericPretty.Out UnlockWalletResponse
instance Data.ProtoLens.Message UnlockWalletResponse where
  messageName _ = Data.Text.pack "lnrpc.UnlockWalletResponse"
  packedMessageDescriptor _
    = "\n\
      \\DC4UnlockWalletResponse"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UnlockWalletResponse'_unknownFields
        (\ x__ y__ -> x__ {_UnlockWalletResponse'_unknownFields = y__})
  defMessage
    = UnlockWalletResponse'_constructor
        {_UnlockWalletResponse'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UnlockWalletResponse
          -> Data.ProtoLens.Encoding.Bytes.Parser UnlockWalletResponse
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
          (do loop Data.ProtoLens.defMessage) "UnlockWalletResponse"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData UnlockWalletResponse where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UnlockWalletResponse'_unknownFields x__) ()
data WalletUnlocker = WalletUnlocker {}
instance Data.ProtoLens.Service.Types.Service WalletUnlocker where
  type ServiceName WalletUnlocker = "WalletUnlocker"
  type ServicePackage WalletUnlocker = "lnrpc"
  type ServiceMethods WalletUnlocker = '["changePassword",
                                         "genSeed",
                                         "initWallet",
                                         "unlockWallet"]
  packedServiceDescriptor _
    = "\n\
      \\SOWalletUnlocker\DC28\n\
      \\aGenSeed\DC2\NAK.lnrpc.GenSeedRequest\SUB\SYN.lnrpc.GenSeedResponse\DC2A\n\
      \\n\
      \InitWallet\DC2\CAN.lnrpc.InitWalletRequest\SUB\EM.lnrpc.InitWalletResponse\DC2G\n\
      \\fUnlockWallet\DC2\SUB.lnrpc.UnlockWalletRequest\SUB\ESC.lnrpc.UnlockWalletResponse\DC2M\n\
      \\SOChangePassword\DC2\FS.lnrpc.ChangePasswordRequest\SUB\GS.lnrpc.ChangePasswordResponse"
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletUnlocker "genSeed" where
  type MethodName WalletUnlocker "genSeed" = "GenSeed"
  type MethodInput WalletUnlocker "genSeed" = GenSeedRequest
  type MethodOutput WalletUnlocker "genSeed" = GenSeedResponse
  type MethodStreamingType WalletUnlocker "genSeed" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletUnlocker "initWallet" where
  type MethodName WalletUnlocker "initWallet" = "InitWallet"
  type MethodInput WalletUnlocker "initWallet" = InitWalletRequest
  type MethodOutput WalletUnlocker "initWallet" = InitWalletResponse
  type MethodStreamingType WalletUnlocker "initWallet" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletUnlocker "unlockWallet" where
  type MethodName WalletUnlocker "unlockWallet" = "UnlockWallet"
  type MethodInput WalletUnlocker "unlockWallet" = UnlockWalletRequest
  type MethodOutput WalletUnlocker "unlockWallet" = UnlockWalletResponse
  type MethodStreamingType WalletUnlocker "unlockWallet" =  'Data.ProtoLens.Service.Types.NonStreaming
instance Data.ProtoLens.Service.Types.HasMethodImpl WalletUnlocker "changePassword" where
  type MethodName WalletUnlocker "changePassword" = "ChangePassword"
  type MethodInput WalletUnlocker "changePassword" = ChangePasswordRequest
  type MethodOutput WalletUnlocker "changePassword" = ChangePasswordResponse
  type MethodStreamingType WalletUnlocker "changePassword" =  'Data.ProtoLens.Service.Types.NonStreaming
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\SUBwallet_unlocker_grpc.proto\DC2\ENQlnrpc\SUB\SOlnd_grpc.proto\"`\n\
    \\SOGenSeedRequest\DC2+\n\
    \\DC1aezeed_passphrase\CAN\SOH \SOH(\fR\DLEaezeedPassphrase\DC2!\n\
    \\fseed_entropy\CAN\STX \SOH(\fR\vseedEntropy\"l\n\
    \\SIGenSeedResponse\DC20\n\
    \\DC4cipher_seed_mnemonic\CAN\SOH \ETX(\tR\DC2cipherSeedMnemonic\DC2'\n\
    \\SIenciphered_seed\CAN\STX \SOH(\fR\SOencipheredSeed\"\175\STX\n\
    \\DC1InitWalletRequest\DC2'\n\
    \\SIwallet_password\CAN\SOH \SOH(\fR\SOwalletPassword\DC20\n\
    \\DC4cipher_seed_mnemonic\CAN\STX \ETX(\tR\DC2cipherSeedMnemonic\DC2+\n\
    \\DC1aezeed_passphrase\CAN\ETX \SOH(\fR\DLEaezeedPassphrase\DC2'\n\
    \\SIrecovery_window\CAN\EOT \SOH(\ENQR\SOrecoveryWindow\DC2B\n\
    \\SIchannel_backups\CAN\ENQ \SOH(\v2\EM.lnrpc.ChanBackupSnapshotR\SOchannelBackups\DC2%\n\
    \\SOstateless_init\CAN\ACK \SOH(\bR\rstatelessInit\";\n\
    \\DC2InitWalletResponse\DC2%\n\
    \\SOadmin_macaroon\CAN\SOH \SOH(\fR\radminMacaroon\"\210\SOH\n\
    \\DC3UnlockWalletRequest\DC2'\n\
    \\SIwallet_password\CAN\SOH \SOH(\fR\SOwalletPassword\DC2'\n\
    \\SIrecovery_window\CAN\STX \SOH(\ENQR\SOrecoveryWindow\DC2B\n\
    \\SIchannel_backups\CAN\ETX \SOH(\v2\EM.lnrpc.ChanBackupSnapshotR\SOchannelBackups\DC2%\n\
    \\SOstateless_init\CAN\EOT \SOH(\bR\rstatelessInit\"\SYN\n\
    \\DC4UnlockWalletResponse\"\191\SOH\n\
    \\NAKChangePasswordRequest\DC2)\n\
    \\DLEcurrent_password\CAN\SOH \SOH(\fR\SIcurrentPassword\DC2!\n\
    \\fnew_password\CAN\STX \SOH(\fR\vnewPassword\DC2%\n\
    \\SOstateless_init\CAN\ETX \SOH(\bR\rstatelessInit\DC21\n\
    \\NAKnew_macaroon_root_key\CAN\EOT \SOH(\bR\DC2newMacaroonRootKey\"?\n\
    \\SYNChangePasswordResponse\DC2%\n\
    \\SOadmin_macaroon\CAN\SOH \SOH(\fR\radminMacaroon2\165\STX\n\
    \\SOWalletUnlocker\DC28\n\
    \\aGenSeed\DC2\NAK.lnrpc.GenSeedRequest\SUB\SYN.lnrpc.GenSeedResponse\DC2A\n\
    \\n\
    \InitWallet\DC2\CAN.lnrpc.InitWalletRequest\SUB\EM.lnrpc.InitWalletResponse\DC2G\n\
    \\fUnlockWallet\DC2\SUB.lnrpc.UnlockWalletRequest\SUB\ESC.lnrpc.UnlockWalletResponse\DC2M\n\
    \\SOChangePassword\DC2\FS.lnrpc.ChangePasswordRequest\SUB\GS.lnrpc.ChangePasswordResponseB'Z%github.com/lightningnetwork/lnd/lnrpcJ\193G\n\
    \\a\DC2\ENQ\STX\NUL\239\SOH\SOH\n\
    \\141\SOH\n\
    \\SOH\f\DC2\ETX\STX\NUL\DC22\130\SOHsource https://raw.githubusercontent.com/lightningnetwork/lnd/c733c139e95a6ef4e5f9ac88b43328ac96c333ef/lnrpc/walletunlocker.proto\n\
    \\n\
    \\t\n\
    \\STX\ETX\NUL\DC2\ETX\EOT\NUL\CAN\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\ACK\NUL\SO\n\
    \\b\n\
    \\SOH\b\DC2\ETX\b\NUL<\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\b\NUL<\n\
    \\187\ACK\n\
    \\STX\ACK\NUL\DC2\EOT\RS\NULF\SOH\SUB\136\SOH WalletUnlocker is a service that is used to set up a wallet password for\n\
    \ lnd at first startup, and unlock a previously set up wallet.\n\
    \2\163\ENQ\n\
    \ Comments in this file will be directly parsed into the API\n\
    \ Documentation as descriptions of the associated method, message, or field.\n\
    \ These descriptions should go right above the definition of the object, and\n\
    \ can be in either block or // comment format.\n\
    \\n\
    \ An RPC method can be matched to an lncli command by placing a line in the\n\
    \ beginning of the description in exactly the following format:\n\
    \ lncli: `methodname`\n\
    \\n\
    \ Failure to specify the exact name of the command will cause documentation\n\
    \ generation to fail.\n\
    \\n\
    \ More information on how exactly the gRPC documentation is generated from\n\
    \ this proto file can be found here:\n\
    \ https://github.com/lightninglabs/lightning-api\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ACK\NUL\SOH\DC2\ETX\RS\b\SYN\n\
    \\200\ETX\n\
    \\EOT\ACK\NUL\STX\NUL\DC2\ETX)\EOT;\SUB\186\ETX\n\
    \GenSeed is the first method that should be used to instantiate a new lnd\n\
    \instance. This method allows a caller to generate a new aezeed cipher seed\n\
    \given an optional passphrase. If provided, the passphrase will be necessary\n\
    \to decrypt the cipherseed to expose the internal wallet seed.\n\
    \\n\
    \Once the cipherseed is obtained and verified by the user, the InitWallet\n\
    \method should be used to commit the newly generated seed, and create the\n\
    \wallet.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\SOH\DC2\ETX)\b\SI\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\STX\DC2\ETX)\DC1\US\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\NUL\ETX\DC2\ETX)*9\n\
    \\133\ENQ\n\
    \\EOT\ACK\NUL\STX\SOH\DC2\ETX9\EOTD\SUB\247\EOT\n\
    \InitWallet is used when lnd is starting up for the first time to fully\n\
    \initialize the daemon and its internal wallet. At the very least a wallet\n\
    \password must be provided. This will be used to encrypt sensitive material\n\
    \on disk.\n\
    \\n\
    \In the case of a recovery scenario, the user can also specify their aezeed\n\
    \mnemonic and passphrase. If set, then the daemon will use this prior state\n\
    \to initialize its internal wallet.\n\
    \\n\
    \Alternatively, this can be used along with the GenSeed RPC to obtain a\n\
    \seed, then present it to the user. Once it has been verified by the user,\n\
    \the seed can be fed into this RPC in order to commit the new wallet.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\SOH\DC2\ETX9\b\DC2\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\STX\DC2\ETX9\DC4%\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\SOH\ETX\DC2\ETX90B\n\
    \z\n\
    \\EOT\ACK\NUL\STX\STX\DC2\ETX?\EOTJ\SUBm lncli: `unlock`\n\
    \UnlockWallet is used at startup of lnd to provide a password to unlock\n\
    \the wallet database.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\SOH\DC2\ETX?\b\DC4\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\STX\DC2\ETX?\SYN)\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\STX\ETX\DC2\ETX?4H\n\
    \\166\SOH\n\
    \\EOT\ACK\NUL\STX\ETX\DC2\ETXE\EOTP\SUB\152\SOH lncli: `changepassword`\n\
    \ChangePassword changes the password of the encrypted wallet. This will\n\
    \automatically unlock the wallet database if successful.\n\
    \\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\SOH\DC2\ETXE\b\SYN\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\STX\DC2\ETXE\CAN-\n\
    \\f\n\
    \\ENQ\ACK\NUL\STX\ETX\ETX\DC2\ETXE8N\n\
    \\n\
    \\n\
    \\STX\EOT\NUL\DC2\EOTH\NULV\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETXH\b\SYN\n\
    \\191\SOH\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETXN\EOT \SUB\177\SOH\n\
    \aezeed_passphrase is an optional user provided passphrase that will be used\n\
    \to encrypt the generated aezeed cipher seed. When using REST, this field\n\
    \must be encoded as base64.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ENQ\DC2\ETXN\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETXN\n\
    \\ESC\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETXN\RS\US\n\
    \\211\SOH\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETXU\EOT\ESC\SUB\197\SOH\n\
    \seed_entropy is an optional 16-bytes generated via CSPRNG. If not\n\
    \specified, then a fresh set of randomness will be used to create the seed.\n\
    \When using REST, this field must be encoded as base64.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ENQ\DC2\ETXU\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETXU\n\
    \\SYN\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETXU\EM\SUB\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOTW\NULf\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETXW\b\ETB\n\
    \\194\STX\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX_\EOT-\SUB\180\STX\n\
    \cipher_seed_mnemonic is a 24-word mnemonic that encodes a prior aezeed\n\
    \cipher seed obtained by the user. This field is optional, as if not\n\
    \provided, then the daemon will generate a new cipher seed for the user.\n\
    \Otherwise, then the daemon will attempt to recover the wallet state linked\n\
    \to this cipher seed.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\EOT\DC2\ETX_\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ENQ\DC2\ETX_\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX_\DC4(\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX_+,\n\
    \\146\SOH\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETXe\EOT\RS\SUB\132\SOH\n\
    \enciphered_seed are the raw aezeed cipher seed bytes. This is the raw\n\
    \cipher text before run through our mnemonic encoding scheme.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ENQ\DC2\ETXe\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETXe\n\
    \\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETXe\FS\GS\n\
    \\v\n\
    \\STX\EOT\STX\DC2\ENQh\NUL\153\SOH\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETXh\b\EM\n\
    \\252\SOH\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETXo\EOT\RS\SUB\238\SOH\n\
    \wallet_password is the passphrase that should be used to encrypt the\n\
    \wallet. This MUST be at least 8 chars in length. After creation, this\n\
    \password is required to unlock the daemon. When using REST, this field\n\
    \must be encoded as base64.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETXo\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETXo\n\
    \\EM\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETXo\FS\GS\n\
    \\196\SOH\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETXv\EOT-\SUB\182\SOH\n\
    \cipher_seed_mnemonic is a 24-word mnemonic that encodes a prior aezeed\n\
    \cipher seed obtained by the user. This may have been generated by the\n\
    \GenSeed method, or be an existing seed.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\EOT\DC2\ETXv\EOT\f\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETXv\r\DC3\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETXv\DC4(\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETXv+,\n\
    \\191\SOH\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETX}\EOT \SUB\177\SOH\n\
    \aezeed_passphrase is an optional user provided passphrase that will be used\n\
    \to encrypt the generated aezeed cipher seed. When using REST, this field\n\
    \must be encoded as base64.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETX}\EOT\t\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETX}\n\
    \\ESC\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETX}\RS\US\n\
    \\212\STX\n\
    \\EOT\EOT\STX\STX\ETX\DC2\EOT\134\SOH\EOT\RS\SUB\197\STX\n\
    \recovery_window is an optional argument specifying the address lookahead\n\
    \when restoring a wallet seed. The recovery window applies to each\n\
    \individual branch of the BIP44 derivation paths. Supplying a recovery\n\
    \window of zero indicates that no addresses should be recovered, such after\n\
    \the first initialization of the wallet.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ENQ\DC2\EOT\134\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\SOH\DC2\EOT\134\SOH\n\
    \\EM\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ETX\ETX\DC2\EOT\134\SOH\FS\GS\n\
    \\203\ETX\n\
    \\EOT\EOT\STX\STX\EOT\DC2\EOT\144\SOH\EOT+\SUB\188\ETX\n\
    \channel_backups is an optional argument that allows clients to recover the\n\
    \settled funds within a set of channels. This should be populated if the\n\
    \user was unable to close out all channels and sweep funds before partial or\n\
    \total data loss occurred. If specified, then after on-chain recovery of\n\
    \funds, lnd begin to carry out the data loss recovery protocol in order to\n\
    \recover the funds in each channel from a remote force closed transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ACK\DC2\EOT\144\SOH\EOT\SYN\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\SOH\DC2\EOT\144\SOH\ETB&\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\EOT\ETX\DC2\EOT\144\SOH)*\n\
    \\171\STX\n\
    \\EOT\EOT\STX\STX\ENQ\DC2\EOT\152\SOH\EOT\FS\SUB\156\STX\n\
    \stateless_init is an optional argument instructing the daemon NOT to create\n\
    \any *.macaroon files in its filesystem. If this parameter is set, then the\n\
    \admin macaroon returned in the response MUST be stored by the caller of the\n\
    \RPC as otherwise all access to the daemon will be lost!\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ENQ\DC2\EOT\152\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\SOH\DC2\EOT\152\SOH\t\ETB\n\
    \\r\n\
    \\ENQ\EOT\STX\STX\ENQ\ETX\DC2\EOT\152\SOH\SUB\ESC\n\
    \\f\n\
    \\STX\EOT\ETX\DC2\ACK\154\SOH\NUL\163\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ETX\SOH\DC2\EOT\154\SOH\b\SUB\n\
    \\229\STX\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\EOT\162\SOH\EOT\GS\SUB\214\STX\n\
    \The binary serialized admin macaroon that can be used to access the daemon\n\
    \after creating the wallet. If the stateless_init parameter was set to true,\n\
    \this is the ONLY copy of the macaroon and MUST be stored safely by the\n\
    \caller. Otherwise a copy of this macaroon is also persisted on disk by the\n\
    \daemon, together with other macaroon files.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\EOT\162\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\EOT\162\SOH\n\
    \\CAN\n\
    \\r\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\EOT\162\SOH\ESC\FS\n\
    \\f\n\
    \\STX\EOT\EOT\DC2\ACK\165\SOH\NUL\197\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\165\SOH\b\ESC\n\
    \\239\SOH\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\171\SOH\EOT\RS\SUB\224\SOH\n\
    \wallet_password should be the current valid passphrase for the daemon. This\n\
    \will be required to decrypt on-disk material that the daemon requires to\n\
    \function properly. When using REST, this field must be encoded as base64.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\171\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\171\SOH\n\
    \\EM\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\171\SOH\FS\GS\n\
    \\212\STX\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\180\SOH\EOT\RS\SUB\197\STX\n\
    \recovery_window is an optional argument specifying the address lookahead\n\
    \when restoring a wallet seed. The recovery window applies to each\n\
    \individual branch of the BIP44 derivation paths. Supplying a recovery\n\
    \window of zero indicates that no addresses should be recovered, such after\n\
    \the first initialization of the wallet.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ENQ\DC2\EOT\180\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\180\SOH\n\
    \\EM\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\180\SOH\FS\GS\n\
    \\203\ETX\n\
    \\EOT\EOT\EOT\STX\STX\DC2\EOT\190\SOH\EOT+\SUB\188\ETX\n\
    \channel_backups is an optional argument that allows clients to recover the\n\
    \settled funds within a set of channels. This should be populated if the\n\
    \user was unable to close out all channels and sweep funds before partial or\n\
    \total data loss occurred. If specified, then after on-chain recovery of\n\
    \funds, lnd begin to carry out the data loss recovery protocol in order to\n\
    \recover the funds in each channel from a remote force closed transaction.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ACK\DC2\EOT\190\SOH\EOT\SYN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\EOT\190\SOH\ETB&\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\EOT\190\SOH)*\n\
    \\132\SOH\n\
    \\EOT\EOT\EOT\STX\ETX\DC2\EOT\196\SOH\EOT\FS\SUBv\n\
    \stateless_init is an optional argument instructing the daemon NOT to create\n\
    \any *.macaroon files in its file system.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ENQ\DC2\EOT\196\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\SOH\DC2\EOT\196\SOH\t\ETB\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\ETX\ETX\DC2\EOT\196\SOH\SUB\ESC\n\
    \\f\n\
    \\STX\EOT\ENQ\DC2\ACK\198\SOH\NUL\199\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\198\SOH\b\FS\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\201\SOH\NUL\228\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\201\SOH\b\GS\n\
    \\154\SOH\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\206\SOH\EOT\US\SUB\139\SOH\n\
    \current_password should be the current valid passphrase used to unlock the\n\
    \daemon. When using REST, this field must be encoded as base64.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\206\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\206\SOH\n\
    \\SUB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\206\SOH\GS\RS\n\
    \\155\SOH\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\212\SOH\EOT\ESC\SUB\140\SOH\n\
    \new_password should be the new passphrase that will be needed to unlock the\n\
    \daemon. When using REST, this field must be encoded as base64.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\212\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\212\SOH\n\
    \\SYN\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\212\SOH\EM\SUB\n\
    \\171\STX\n\
    \\EOT\EOT\ACK\STX\STX\DC2\EOT\220\SOH\EOT\FS\SUB\156\STX\n\
    \stateless_init is an optional argument instructing the daemon NOT to create\n\
    \any *.macaroon files in its filesystem. If this parameter is set, then the\n\
    \admin macaroon returned in the response MUST be stored by the caller of the\n\
    \RPC as otherwise all access to the daemon will be lost!\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ENQ\DC2\EOT\220\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\EOT\220\SOH\t\ETB\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\EOT\220\SOH\SUB\ESC\n\
    \\192\SOH\n\
    \\EOT\EOT\ACK\STX\ETX\DC2\EOT\227\SOH\EOT#\SUB\177\SOH\n\
    \new_macaroon_root_key is an optional argument instructing the daemon to\n\
    \rotate the macaroon root key when set to true. This will invalidate all\n\
    \previously generated macaroons.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ENQ\DC2\EOT\227\SOH\EOT\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\SOH\DC2\EOT\227\SOH\t\RS\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\ETX\ETX\DC2\EOT\227\SOH!\"\n\
    \\f\n\
    \\STX\EOT\a\DC2\ACK\229\SOH\NUL\239\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\229\SOH\b\RS\n\
    \\183\ETX\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\238\SOH\EOT\GS\SUB\168\ETX\n\
    \The binary serialized admin macaroon that can be used to access the daemon\n\
    \after rotating the macaroon root key. If both the stateless_init and\n\
    \new_macaroon_root_key parameter were set to true, this is the ONLY copy of\n\
    \the macaroon that was created from the new root key and MUST be stored\n\
    \safely by the caller. Otherwise a copy of this macaroon is also persisted on\n\
    \disk by the daemon, together with other macaroon files.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\238\SOH\EOT\t\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\238\SOH\n\
    \\CAN\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\238\SOH\ESC\FSb\ACKproto3"