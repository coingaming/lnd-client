module LndClient.Data.ChannelBackup
  ( ChannelBackup (..),
    SingleChanBackupBlob (..),
  )
where

import Data.ProtoLens
import qualified LndClient.Data.ChannelPoint as Ch
import LndClient.Import
import qualified Proto.Lnrpc.Ln1 as Ln1
import qualified Proto.Lnrpc.Ln1_Fields as Ln1

data ChannelBackup = ChannelBackup
  { chanPoint :: Ch.ChannelPoint,
    chanBackup :: SingleChanBackupBlob
  }
  deriving stock
    ( Eq,
      Ord,
      Show,
      Generic
    )

instance Out ChannelBackup

newtype SingleChanBackupBlob = SingleChanBackupBlob
  { unSingleChanBackupBlob :: ByteString
  }
  deriving newtype
    ( Eq,
      Ord,
      Show,
      PersistField,
      PersistFieldSql
    )
  deriving stock
    ( Generic
    )

instance Out SingleChanBackupBlob

instance FromGrpc [ChannelBackup] Ln1.ChanBackupSnapshot where
  fromGrpc x =
    fromGrpc $
      x ^. Ln1.singleChanBackups . Ln1.chanBackups

instance FromGrpc ChannelBackup Ln1.ChannelBackup where
  fromGrpc x =
    ChannelBackup
      <$> fromGrpc (x ^. Ln1.chanPoint)
      <*> fromGrpc (x ^. Ln1.chanBackup)

instance ToGrpc ChannelBackup Ln1.ChannelBackup where
  toGrpc x =
    msg
      <$> toGrpc (chanPoint x)
      <*> toGrpc (chanBackup x)
    where
      msg cp bak =
        defMessage
          & Ln1.chanPoint .~ cp
          & Ln1.chanBackup .~ bak

instance FromGrpc SingleChanBackupBlob ByteString where
  fromGrpc x =
    if null x
      then
        Left
          . FromGrpcError
          $ "Cannot parse SingleChanBackupBlob from " <> inspectPlain x
      else
        Right $
          SingleChanBackupBlob x

instance ToGrpc SingleChanBackupBlob ByteString where
  toGrpc =
    Right . unSingleChanBackupBlob

instance ToGrpc [ChannelBackup] Ln1.RestoreChanBackupRequest where
  toGrpc xs0 = do
    xs <- mapM toGrpc xs0
    pure $
      defMessage
        & Ln1.chanBackups
          .~ ( defMessage
                 & Ln1.chanBackups .~ xs
             )
