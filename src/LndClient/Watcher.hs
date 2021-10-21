{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

-- | Generic async worker to automate LND gRPC subscriptions.
-- It watches any amount of subscriptions of the same type,
-- and re-subscribes if subscription was not terminated properly.
-- The only way to terminate subscription is to apply `unWatch` or
-- `unWatchUnit` function.
module LndClient.Watcher
  ( Watcher,
    watch,
    watchUnit,
    unWatch,
    unWatchUnit,
    dupLndTChan,
    withWatcher,
    withWatcherUnit,
  )
where

import qualified Control.Concurrent.Async as Async
import qualified Data.Map as Map
import LndClient.Import hiding (newSev, spawnLink)

--
-- TODO : maybe pass OnSub | OnExit callbacks?
--

data Watcher req res
  = Watcher
      { watcherCmdChan :: TChan (Cmd req),
        watcherLndChan :: TChan (req, res),
        watcherProc :: Async ()
      }

--
-- TODO : introduce UnWatchAll
-- and use it in withEnv etc
--
data Cmd req
  = Watch req
  | UnWatch req
  | Terminate (Async ())

data Event req res
  = EventCmd (Cmd req)
  | EventLnd res
  | EventTask (req, Either LndError ())

data WatcherState req res m
  = WatcherState
      { watcherStateCmdChan :: TChan (Cmd req),
        watcherStateLndChan :: TChan (req, res),
        watcherStateSub :: req -> m (Either LndError ()),
        watcherStateHandler :: req -> Either LndError res -> m (),
        watcherStateTasks :: Map req (Async (req, Either LndError ())),
        watcherStateLndEnv :: LndEnv
      }

newSev :: WatcherState req res m -> Severity -> Severity
newSev w s = newSeverity (watcherStateLndEnv w) s Nothing Nothing

-- | Compute an action with given subscription watcher
-- with given arguments.
withWatcher ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  LndEnv ->
  (Maybe (TChan (req, res)) -> LndEnv -> req -> m (Either LndError ())) ->
  (Watcher req res -> req -> Either LndError res -> m ()) ->
  (Watcher req res -> m actionRes) ->
  m actionRes
withWatcher env sub handler action =
  withRunInIO $ \run -> do
    ( writeCmdChan,
      writeLndChan,
      readCmdChan,
      readLndChan
      ) <- atomically $ do
      writeCmdChan <- newBroadcastTChan
      writeLndChan <- newBroadcastTChan
      readCmdChan <- dupTChan writeCmdChan
      readLndChan <- dupTChan writeLndChan
      pure (writeCmdChan, writeLndChan, readCmdChan, readLndChan)
    let newWatcher proc =
          Watcher
            { watcherCmdChan = writeCmdChan,
              watcherLndChan = writeLndChan,
              watcherProc = proc
            }
    varPid <- newEmptyMVar
    withSpawnLink
      ( do
          --
          -- TODO : proper bi-directional link
          --
          -- TODO : atomically cancel all linked processes
          -- in case of root process crash/cancel (graceful cleanup)
          --
          pid <- takeMVar varPid
          run . loop $
            WatcherState
              { watcherStateCmdChan = readCmdChan,
                watcherStateLndChan = readLndChan,
                watcherStateSub = sub (Just writeLndChan) env,
                watcherStateHandler = handler $ newWatcher pid,
                watcherStateTasks = mempty,
                watcherStateLndEnv = env
              }
      )
      ( \pid -> do
          putMVar varPid pid
          run . action $ newWatcher pid
      )

-- | Compute an action with given subscription watcher
-- without arguments, for example `subscribeChannelEventsChan`.
withWatcherUnit ::
  (MonadUnliftIO m, KatipContext m) =>
  LndEnv ->
  (Maybe (TChan ((), res)) -> LndEnv -> m (Either LndError ())) ->
  (Watcher () res -> Either LndError res -> m ()) ->
  (Watcher () res -> m actionRes) ->
  m actionRes
withWatcherUnit env0 sub handler =
  withWatcher
    env0
    (\mChan env1 _ -> sub mChan env1)
    (\chan _ x -> handler chan x)

watch :: (MonadUnliftIO m) => Watcher req res -> req -> m ()
watch w = atomically . writeTChan (watcherCmdChan w) . Watch

watchUnit :: (MonadUnliftIO m) => Watcher () res -> m ()
watchUnit w = watch w ()

unWatch :: (MonadUnliftIO m) => Watcher req res -> req -> m ()
unWatch w = atomically . writeTChan (watcherCmdChan w) . UnWatch

unWatchUnit :: (MonadUnliftIO m) => Watcher () res -> m ()
unWatchUnit w = unWatch w ()

dupLndTChan :: (MonadIO m) => Watcher req res -> m (TChan (req, res))
dupLndTChan = atomically . dupTChan . watcherLndChan

loop ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  m ()
loop w = do
  -- Here is the trick. Async watcher task can be already
  -- terminated, and runtime detects that there are no any references
  -- to watcherStateLndChan anymore.
  -- This may cause `BlockedIndefinitelyOnSTM`
  -- async exception, because all alternative <|> expressions are
  -- evaluated independently. In this case we need to retry
  -- alternative computation but without reading from
  -- watcherStateLndChan.
  me <-
    catchAsync . atomically $
      if tasksEmpty
        then cmd <|> lnd
        else cmd <|> lnd <|> task
  event <- case me of
    Left _ ->
      atomically $
        if tasksEmpty
          then cmd
          else cmd <|> task
    Right x ->
      return x
  $(logTM) (newSev w InfoS) "Watcher - applying event"
  case event of
    EventCmd x -> applyCmd w x
    EventLnd x -> applyLnd w (second Right x)
    EventTask x -> applyTask w x
  where
    ts = Map.elems $ watcherStateTasks w
    tasksEmpty = null ts
    cmd = EventCmd <$> readTChan (watcherStateCmdChan w)
    lnd = EventLnd <$> readTChan (watcherStateLndChan w)
    task = EventTask . snd <$> Async.waitAnySTM ts

applyCmd ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  Cmd req ->
  m ()
applyCmd w = \case
  Watch x -> do
    $(logTM) (newSev w InfoS) "Watcher - applying Cmd Watch"
    if isJust $ Map.lookup x ts
      then loop w
      else do
        t <-
          withRunInIO $ \run -> do
            t <- Async.async . run $ (x,) <$> watcherStateSub w x
            Async.link t
            return t
        loop w {watcherStateTasks = Map.insert x t ts}
  UnWatch x -> do
    $(logTM) (newSev w InfoS) "Watcher - applying Cmd UnWatch"
    case Map.lookup x ts of
      Nothing -> loop w
      Just t -> do
        liftIO $ Async.cancel t
        loop w {watcherStateTasks = Map.delete x ts}
  Terminate x -> do
    $(logTM) (newSev w InfoS) $
      logStr
        ( "Watcher - applying Cmd Terminate "
            <> show (Async.asyncThreadId x) ::
            Text
        )
    liftIO $ do
      mapM_ Async.cancel $ Map.elems ts
      Async.cancel x
    loop w {watcherStateTasks = mempty}
  where
    ts = watcherStateTasks w

applyLnd ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  (req, Either LndError res) ->
  m ()
applyLnd w (x0, x1) = do
  $(logTM) (newSev w InfoS) "Watcher - applying Lnd"
  watcherStateHandler w x0 x1
  loop w

applyTask ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  (req, Either LndError ()) ->
  m ()
applyTask w0 (x, res) = do
  $(logTM) (newSev w0 InfoS) "Watcher - applying Task"
  case Map.lookup x ts of
    Nothing -> loop w0
    Just t -> do
      case res of
        Left (e :: LndError) -> watcherStateHandler w0 x $ Left e
        Right () -> liftIO $ Async.cancel t
      loop w1
  where
    ts = watcherStateTasks w0
    w1 = w0 {watcherStateTasks = Map.delete x ts}
