{- This file was auto-generated from wallet_unlocker_grpc.proto by the proto-lens-protoc program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications#-}
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ChangePasswordRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ChangePasswordResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ChangePasswordResponse "adminMacaroon" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ChangePasswordResponse'adminMacaroon
           (\ x__ y__ -> x__ {_ChangePasswordResponse'adminMacaroon = y__}))
        Prelude.id
instance Data.ProtoLens.Message ChangePasswordResponse where
  messageName _ = Data.Text.pack "lnrpc.ChangePasswordResponse"
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GenSeedRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show GenSeedResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show InitWalletRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show InitWalletResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField InitWalletResponse "adminMacaroon" Data.ByteString.ByteString where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _InitWalletResponse'adminMacaroon
           (\ x__ y__ -> x__ {_InitWalletResponse'adminMacaroon = y__}))
        Prelude.id
instance Data.ProtoLens.Message InitWalletResponse where
  messageName _ = Data.Text.pack "lnrpc.InitWalletResponse"
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UnlockWalletRequest where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
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
  deriving (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UnlockWalletResponse where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message UnlockWalletResponse where
  messageName _ = Data.Text.pack "lnrpc.UnlockWalletResponse"
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