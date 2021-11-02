module LndClient.Import.External
  ( module Import,
    show,
    showStr,
  )
where

import Chronos as Import
  ( SubsecondPrecision (SubsecondPrecisionAuto),
    Timespan (..),
    encodeTimespan,
    stopwatch,
  )
import Control.Concurrent.Async as Import
  ( Async,
  )
import Control.Concurrent.STM as Import (check)
import Control.Concurrent.STM.TChan as Import
  ( TChan,
    dupTChan,
    newBroadcastTChan,
    readTChan,
    writeTChan,
  )
import Control.Monad.Extra as Import
  ( eitherM,
    fromMaybeM,
  )
import Data.Aeson as Import (FromJSON (..), ToJSON, fromJSON)
import Data.ByteString as Import (ByteString)
import Data.Coerce as Import (coerce)
import Data.List.Extra as Import (enumerate)
import Data.Text as Import (Text, pack, unpack)
--
-- TODO : use Snoyman bracket
--

import qualified Data.Text as T
import Data.Text.Lazy as Import (fromStrict, toStrict)
import qualified Data.Text.Lazy as TL
import Data.Word as Import (Word64)
import Database.Persist.Class as Import (PersistField)
import Database.Persist.Sql as Import (PersistFieldSql)
import Database.Persist.TH as Import (derivePersistField)
import GHC.Generics as Import (Generic, Rep (..))
import Katip as Import
  ( ColorStrategy (..),
    Katip (..),
    KatipContext (..),
    KatipContextT,
    LogContexts,
    LogEnv (..),
    Namespace,
    Severity (..),
    Verbosity (..),
    bracketFormat,
    closeScribes,
    defaultScribeSettings,
    initLogEnv,
    jsonFormat,
    katipAddContext,
    logStr,
    logTM,
    mkHandleScribeWithFormatter,
    permitItem,
    registerScribe,
    runKatipContextT,
    sl,
  )
import qualified Text.Pretty.Simple as PrettySimple
import qualified Text.PrettyPrint.Annotated as Pretty
import Text.PrettyPrint.GenericPretty as Import (Out (..))
import qualified Text.PrettyPrint.GenericPretty as PrettyGeneric
import Universum as Import hiding (Text, catch, finally, show)
import UnliftIO as Import
  ( Handler (..),
    MonadUnliftIO (..),
    UnliftIO (..),
    catch,
    catches,
    finally,
  )

show :: (Out a) => a -> T.Text
show =
  TL.toStrict
    . PrettySimple.pString
    . PrettyGeneric.prettyStyle
      Pretty.style
        { Pretty.mode = Pretty.OneLineMode
        }

showStr :: (Out a) => a -> String
showStr =
  T.unpack . show
