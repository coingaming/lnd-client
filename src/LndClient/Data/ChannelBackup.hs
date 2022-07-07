module LndClient.Data.ChannelBackup
  ( ChannelBackup (..),
    SingleChanBackupBlob (..),
  )
where

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

instance FromGrpc SingleChanBackupBlob ByteString where
  fromGrpc x =
    if null x
      then
        Left
          . FromGrpcError
          $ "Cannot parse SingleChanBackupBlob from " <> inspect x
      else
        Right $
          SingleChanBackupBlob x
