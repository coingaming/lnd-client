{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TupleSections #-}

-- | Generic async worker to automate LND gRPC subscriptions.
-- It watches any amount of subscriptions of the same type,
-- and re-subscribes if subscription was not terminated properly.
-- The only way to terminate subscription is to apply `unWatch` or
-- `unWatchUnit` function.
module LndClient.Watcher
  ( Watcher,
    LndResult (..),
    spawnLink,
    spawnLinkUnit,
    watch,
    watchUnit,
    unWatch,
    unWatchUnit,
    dupLndTChan,
    delete,
  )
where

import qualified Data.Map as Map
import LndClient.Import hiding (newSev, spawnLink)

--
-- TODO : maybe pass OnSub | OnExit callbacks?
--

data Watcher a b
  = Watcher
      { watcherCmdChan :: TChan (Cmd a),
        watcherLndChan :: TChan (a, b),
        watcherProc :: Async ()
      }

--
-- TODO : introduce UnWatchAll
-- and use it in withEnv etc
--
data Cmd a
  = Watch a
  | UnWatch a

data Event a b
  = EventCmd (Cmd a)
  | EventLnd b
  | EventTask (a, Either LndError ())

data WatcherState a b m
  = WatcherState
      { watcherStateCmdChan :: TChan (Cmd a),
        watcherStateLndChan :: TChan (a, b),
        watcherStateSub :: a -> m (Either LndError ()),
        watcherStateHandler :: a -> LndResult b -> m (),
        watcherStateTasks :: Map a (Async (a, Either LndError ())),
        watcherStateLndEnv :: LndEnv
      }

data LndResult a
  = Ok a
  | Error LndError
  deriving (Eq, Show)

newSev :: WatcherState a b m -> Severity -> Severity
newSev w s = newSeverity (watcherStateLndEnv w) s Nothing Nothing

-- Spawn watcher where subscription accepts argument
-- for example `subscribeInvoicesChan`
spawnLink ::
  (Ord a, MonadUnliftIO m, KatipContext m) =>
  LndEnv ->
  (Maybe (TChan (a, b)) -> LndEnv -> a -> m (Either LndError ())) ->
  (Watcher a b -> a -> LndResult b -> m ()) ->
  m (Watcher a b)
spawnLink env sub handler = do
  w <- withRunInIO $ \run -> do
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
    let w =
          Watcher
            { watcherCmdChan = writeCmdChan,
              watcherLndChan = writeLndChan,
              watcherProc = error "PARTIAL_WATCHER"
            }
    varProc <- newEmptyMVar
    proc <-
      async . run $ do
        proc <- takeMVar varProc
        loop $
          WatcherState
            { watcherStateCmdChan = readCmdChan,
              watcherStateLndChan = readLndChan,
              watcherStateSub = sub (Just writeLndChan) env,
              watcherStateHandler = handler $ w {watcherProc = proc},
              watcherStateTasks = mempty,
              watcherStateLndEnv = env
            }
    liftIO $ putMVar varProc proc
    pure $ w {watcherProc = proc}
  let proc = watcherProc w
  liftIO $ link proc
  $(logTM) (newSeverity env InfoS Nothing Nothing)
    $ logStr
    $ ("Watcher spawned as " :: Text)
      <> show (asyncThreadId proc)
  pure w

-- Spawn watcher where subscription don't accept argument
-- for example `subscribeChannelEventsChan`
spawnLinkUnit ::
  (MonadUnliftIO m, KatipContext m) =>
  LndEnv ->
  (Maybe (TChan ((), b)) -> LndEnv -> m (Either LndError ())) ->
  (Watcher () b -> LndResult b -> m ()) ->
  m (Watcher () b)
spawnLinkUnit env0 sub handler =
  spawnLink
    env0
    (\mChan env1 _ -> sub mChan env1)
    (\chan _ x -> handler chan x)

watch :: (MonadUnliftIO m) => Watcher a b -> a -> m ()
watch w = atomically . writeTChan (watcherCmdChan w) . Watch

watchUnit :: (MonadUnliftIO m) => Watcher () b -> m ()
watchUnit w = watch w ()

unWatch :: (MonadUnliftIO m) => Watcher a b -> a -> m ()
unWatch w = atomically . writeTChan (watcherCmdChan w) . UnWatch

unWatchUnit :: (MonadUnliftIO m) => Watcher () b -> m ()
unWatchUnit w = unWatch w ()

dupLndTChan :: (MonadIO m) => Watcher a b -> m (TChan (a, b))
dupLndTChan = atomically . dupTChan . watcherLndChan

--
-- TODO : atomically cancel all linked processes
--
delete :: (MonadUnliftIO m) => Watcher a b -> m ()
delete (Watcher _ _ proc) = liftIO $ cancel proc

loop ::
  (Ord a, MonadUnliftIO m, KatipContext m) =>
  WatcherState a b m ->
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
  me <- maybeDeadlock . atomically $ cmd <|> lnd <|> task
  event <- case me of
    Nothing -> atomically $ cmd <|> task
    Just x -> return x
  case event of
    EventCmd x -> applyCmd w x
    EventLnd x -> applyLnd w (second Ok x)
    EventTask x -> applyTask w x
  where
    cmd = EventCmd <$> readTChan (watcherStateCmdChan w)
    lnd = EventLnd <$> readTChan (watcherStateLndChan w)
    task =
      EventTask . snd
        <$> waitAnySTM (Map.elems $ watcherStateTasks w)

applyCmd ::
  (Ord a, MonadUnliftIO m, KatipContext m) =>
  WatcherState a b m ->
  Cmd a ->
  m ()
applyCmd w = \case
  Watch x -> do
    $(logTM) (newSev w InfoS) "Watcher - applying Cmd Watch"
    if isJust $ Map.lookup x ts
      then loop w
      else do
        t <-
          withRunInIO $ \run -> do
            t <- async . run $ (x,) <$> watcherStateSub w x
            link t
            return t
        loop w {watcherStateTasks = Map.insert x t ts}
  UnWatch x -> do
    $(logTM) (newSev w InfoS) "Watcher - applying Cmd UnWatch"
    case Map.lookup x ts of
      Nothing -> loop w
      Just t -> do
        liftIO $ cancel t
        loop w {watcherStateTasks = Map.delete x ts}
  where
    ts = watcherStateTasks w

applyLnd ::
  (Ord a, MonadUnliftIO m, KatipContext m) =>
  WatcherState a b m ->
  (a, LndResult b) ->
  m ()
applyLnd w (x0, x1) = do
  $(logTM) (newSev w InfoS) "Watcher - applying Lnd"
  watcherStateHandler w x0 x1
  loop w

applyTask ::
  (Ord a, MonadUnliftIO m, KatipContext m) =>
  WatcherState a b m ->
  (a, Either LndError ()) ->
  m ()
applyTask w0 (x, res) = do
  $(logTM) (newSev w0 InfoS) "Watcher - applying Task"
  case Map.lookup x ts of
    Nothing -> loop w0
    Just t -> do
      case res of
        Left (e :: LndError) -> watcherStateHandler w0 x $ Error e
        Right () -> liftIO $ cancel t
      loop w1
  where
    ts = watcherStateTasks w0
    w1 = w0 {watcherStateTasks = Map.delete x ts}
