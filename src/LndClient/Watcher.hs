{-# LANGUAGE StrictData #-}
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
  )
where

import Data.Map as Map
import LndClient.Import hiding (spawnLink)

--
-- TODO : maybe pass OnSub | OnExit callbacks?
--

newtype Watcher a b
  = Watcher (TChan (Cmd a))

data Cmd a
  = Watch a
  | UnWatch a

data Event a b
  = EventCmd (Cmd a)
  | EventLnd b
  | EventTask (a, Either LndError ())

data WatcherState a b m
  = WatcherState
      { watcherChanCmd :: TChan (Cmd a),
        watcherChanLnd :: TChan (a, b),
        watcherSub :: a -> m (Either LndError ()),
        watcherHandler :: a -> LndResult b -> m (),
        watcherTasks :: Map a (Async (a, Either LndError ()))
      }

data LndResult a
  = Ok a
  | Error LndError
  deriving (Eq, Show)

-- Spawn watcher where subscription accepts argument
-- for example `subscribeInvoicesChan`
spawnLink ::
  (Ord a, MonadUnliftIO m) =>
  LndEnv ->
  (Maybe (TChan (a, b)) -> LndEnv -> a -> m (Either LndError ())) ->
  (Watcher a b -> a -> LndResult b -> m ()) ->
  m (Async (), Watcher a b)
spawnLink env sub handler =
  withRunInIO $ \run -> do
    (cw, lw, cr, lr) <- atomically $ do
      cw <- newBroadcastTChan
      lw <- newBroadcastTChan
      cr <- dupTChan cw
      lr <- dupTChan lw
      return (cw, lw, cr, lr)
    let w = Watcher cw
    t <-
      async . run . loop $
        WatcherState
          { watcherChanCmd = cr,
            watcherChanLnd = lr,
            watcherSub = sub (Just lw) env,
            watcherHandler = handler w,
            watcherTasks = mempty
          }
    link t
    return (t, w)

-- Spawn watcher where subscription don't accept argument
-- for example `subscribeChannelEventsChan`
spawnLinkUnit ::
  (MonadUnliftIO m) =>
  LndEnv ->
  (Maybe (TChan ((), b)) -> LndEnv -> m (Either LndError ())) ->
  (Watcher () b -> LndResult b -> m ()) ->
  m (Async (), Watcher () b)
spawnLinkUnit env0 sub handler =
  spawnLink
    env0
    (\mChan env1 _ -> sub mChan env1)
    (\chan _ x -> handler chan x)

watch :: (MonadUnliftIO m) => Watcher a b -> a -> m ()
watch (Watcher cw) = atomically . writeTChan cw . Watch

watchUnit :: (MonadUnliftIO m) => Watcher () b -> m ()
watchUnit cw = watch cw ()

unWatch :: (MonadUnliftIO m) => Watcher a b -> a -> m ()
unWatch (Watcher cw) = atomically . writeTChan cw . UnWatch

unWatchUnit :: (MonadUnliftIO m) => Watcher () b -> m ()
unWatchUnit cw = unWatch cw ()

loop :: (Ord a, MonadUnliftIO m) => WatcherState a b m -> m ()
loop w = do
  -- Here is the trick. Async watcher task can be already
  -- terminated, and runtime detects that there are no any references
  -- to watcherChanLnd anymore. This may cause `BlockedIndefinitelyOnSTM`
  -- async exception, because all alternative <|> expressions are
  -- evaluated independently. In this case we need to retry
  -- alternative computation but without reading from watcherChanLnd.
  me <- maybeDeadlock . atomically $ cmd <|> lnd <|> task
  event <- case me of
    Nothing -> atomically $ cmd <|> task
    Just x -> return x
  case event of
    EventCmd x -> applyCmd w x
    EventLnd x -> applyLnd w (second Ok x)
    EventTask x -> applyTask w x
  where
    cmd = EventCmd <$> readTChan (watcherChanCmd w)
    lnd = EventLnd <$> readTChan (watcherChanLnd w)
    task = EventTask . snd <$> waitAnySTM (Map.elems $ watcherTasks w)

applyCmd :: (Ord a, MonadUnliftIO m) => WatcherState a b m -> Cmd a -> m ()
applyCmd w = \case
  Watch x ->
    if isJust $ Map.lookup x ts
      then loop w
      else do
        t <-
          withRunInIO $ \run -> do
            t <- async . run $ (x,) <$> watcherSub w x
            link t
            return t
        loop w {watcherTasks = Map.insert x t ts}
  UnWatch x ->
    case Map.lookup x ts of
      Nothing -> loop w
      Just t -> do
        liftIO $ cancel t
        loop w {watcherTasks = Map.delete x ts}
  where
    ts = watcherTasks w

applyLnd :: (Ord a, MonadUnliftIO m) => WatcherState a b m -> (a, LndResult b) -> m ()
applyLnd w (x0, x1) = watcherHandler w x0 x1 >> loop w

applyTask ::
  (Ord a, MonadUnliftIO m) =>
  WatcherState a b m ->
  (a, Either LndError ()) ->
  m ()
applyTask w0 (x, res) =
  case Map.lookup x ts of
    Nothing -> loop w0
    Just t -> do
      case res of
        Left (e :: LndError) -> watcherHandler w0 x $ Error e
        Right () -> liftIO $ cancel t
      loop w1
  where
    ts = watcherTasks w0
    w1 = w0 {watcherTasks = Map.delete x ts}
