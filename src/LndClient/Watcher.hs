{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

-- | Generic async worker to automate LND gRPC subscriptions.
-- It watches any amount of subscriptions of the same type,
-- and re-subscribes if subscription was not terminated properly.
-- The only way to terminate subscription is to apply `unWatch`,
-- `unWatchUnit` or `unWatchAll` function.
module LndClient.Watcher
  ( Watcher,
    watch,
    watchUnit,
    unWatch,
    unWatchUnit,
    unWatchAll,
    dupLndTChan,
    withWatcher,
    withWatcherUnit,
  )
where

import qualified Control.Concurrent.Async as Async
import qualified Data.Map as Map
import LndClient.Import hiding (newSev, spawnLink)

newtype WatcherPid = WatcherPid
  { unWatcherPid :: Async ()
  }

newtype TaskPid req = TaskPid
  { unTaskPid ::
      Async
        ( Either
            (KilledTask req)
            (req, Maybe LndError)
        )
  }

data Watcher req res = Watcher
  { watcherCmdChan :: TChan (Cmd req),
    watcherLndChan :: TChan (req, res),
    watcherPid :: WatcherPid
  }

data KillSignal
  = KillSignal
  deriving stock (Eq, Ord, Show)

newtype KilledTask req = KilledTask req
  deriving newtype (Eq, Ord, Show)

data Cmd req
  = Watch WatcherPid req
  | UnWatch req
  | UnWatchAll

data Event req res
  = EventCmd (Cmd req)
  | EventLnd res
  | EventTask (Either (KilledTask req) (req, Maybe LndError))

data WatcherState req res m = WatcherState
  { watcherStateCmdChan :: TChan (Cmd req),
    watcherStateLndChan :: TChan (req, res),
    watcherStateSub :: req -> m (Maybe LndError),
    watcherStateHandler :: req -> Either LndError res -> m (),
    watcherStateTasks :: Map req (TaskPid req),
    watcherStateLndEnv :: LndEnv,
    watcherStateKillChan :: TChan KillSignal
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
    ( writeKillChan,
      writeCmdChan,
      writeLndChan,
      readCmdChan,
      readLndChan
      ) <- atomically $ do
      writeKillChan <- newBroadcastTChan
      writeCmdChan <- newBroadcastTChan
      writeLndChan <- newBroadcastTChan
      readCmdChan <- dupTChan writeCmdChan
      readLndChan <- dupTChan writeLndChan
      pure
        ( writeKillChan,
          writeCmdChan,
          writeLndChan,
          readCmdChan,
          readLndChan
        )
    let newWatcher proc =
          Watcher
            { watcherCmdChan = writeCmdChan,
              watcherLndChan = writeLndChan,
              watcherPid = proc
            }
    varWatchPid <- newEmptyMVar
    finally
      ( withSpawnLink
          ( do
              watchPid <- takeMVar varWatchPid
              run . loop $
                WatcherState
                  { watcherStateCmdChan = readCmdChan,
                    watcherStateLndChan = readLndChan,
                    watcherStateSub =
                      eitherM
                        (pure . Just)
                        (\() -> pure Nothing)
                        . sub (Just writeLndChan) env,
                    watcherStateHandler = handler $ newWatcher watchPid,
                    watcherStateTasks = mempty,
                    watcherStateLndEnv = env,
                    watcherStateKillChan = writeKillChan
                  }
          )
          ( \pid0 -> do
              let pid1 = WatcherPid pid0
              putMVar varWatchPid pid1
              run . action $ newWatcher pid1
          )
      )
      ( do
          atomically $ writeTChan writeKillChan KillSignal
          run . $(logTM) DebugS $ "Watcher terminated"
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
watch w =
  atomically
    . writeTChan (watcherCmdChan w)
    . Watch (watcherPid w)

watchUnit :: (MonadUnliftIO m) => Watcher () res -> m ()
watchUnit w = watch w ()

unWatch :: (MonadUnliftIO m) => Watcher req res -> req -> m ()
unWatch w = atomically . writeTChan (watcherCmdChan w) . UnWatch

unWatchUnit :: (MonadUnliftIO m) => Watcher () res -> m ()
unWatchUnit w = unWatch w ()

unWatchAll :: (MonadUnliftIO m) => Watcher req res -> m ()
unWatchAll w = atomically $ writeTChan (watcherCmdChan w) UnWatchAll

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
  $(logTM) (newSev w DebugS) "Watcher - applying event"
  case event of
    EventCmd x -> applyCmd w x
    EventLnd x -> applyLnd w (second Right x)
    EventTask (Left (KilledTask x)) ->
      loop $
        w
          { watcherStateTasks =
              Map.delete x $ watcherStateTasks w
          }
    EventTask (Right x) -> applyTask w x
  where
    ts = unTaskPid <$> Map.elems (watcherStateTasks w)
    tasksEmpty = null ts
    cmd = EventCmd <$> readTChan (watcherStateCmdChan w)
    lnd = EventLnd <$> readTChan (watcherStateLndChan w)
    task = EventTask . snd <$> Async.waitAnySTM ts

applyCmd ::
  forall req res m.
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  Cmd req ->
  m ()
applyCmd w = \case
  Watch watchPid x -> do
    $(logTM) (newSev w DebugS) "Watcher - applying Cmd Watch"
    if isJust $ Map.lookup x ts
      then loop w
      else do
        t <-
          withRunInIO $ \run -> do
            readKillChan <- atomically $ dupTChan writeKillChan
            let rcvKill :: IO (KilledTask req) = do
                  KillSignal <- atomically $ readTChan readKillChan
                  pure $ KilledTask x
            let runExpr =
                  run $ (x,) <$> watcherStateSub w x
            t <- Async.async $ do
              Async.linkOnly (const True) $ unWatcherPid watchPid
              Async.race rcvKill runExpr
            Async.link t
            pure $ TaskPid t
        loop w {watcherStateTasks = Map.insert x t ts}
  UnWatch x -> do
    $(logTM) (newSev w DebugS) "Watcher - applying Cmd UnWatch"
    case Map.lookup x ts of
      Nothing -> loop w
      Just t -> do
        liftIO . Async.cancel $ unTaskPid t
        loop w {watcherStateTasks = Map.delete x ts}
  UnWatchAll -> do
    $(logTM) (newSev w DebugS) "Watcher - applying Cmd UnWatchAll"
    liftIO $ do
      atomically $ writeTChan writeKillChan KillSignal
      mapM_ (Async.cancel . unTaskPid) $ Map.elems ts
    loop w {watcherStateTasks = mempty}
  where
    writeKillChan = watcherStateKillChan w
    ts = watcherStateTasks w

applyLnd ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  (req, Either LndError res) ->
  m ()
applyLnd w (x0, x1) = do
  $(logTM) (newSev w DebugS) "Watcher - applying Lnd"
  watcherStateHandler w x0 x1
  loop w

applyTask ::
  (Ord req, MonadUnliftIO m, KatipContext m) =>
  WatcherState req res m ->
  (req, Maybe LndError) ->
  m ()
applyTask w0 (x, res) = do
  $(logTM) (newSev w0 DebugS) "Watcher - applying Task"
  case Map.lookup x ts of
    Nothing -> loop w0
    Just t -> do
      case res of
        Just (e :: LndError) -> watcherStateHandler w0 x $ Left e
        Nothing -> liftIO . Async.cancel $ unTaskPid t
      loop w1
  where
    ts = watcherStateTasks w0
    w1 = w0 {watcherStateTasks = Map.delete x ts}
