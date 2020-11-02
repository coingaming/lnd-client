{-# LANGUAGE TupleSections #-}

-- | Generic async worker to automate LND gRPC subscriptions.
-- It watches any amount of subscriptions of the same type,
-- and re-subscribes if subscription was not terminated properly.
-- The only way to terminate subscription is to apply `unWatch` or
-- `unWatchUnit` function.
module LndClient.Watcher
  ( spawnLink,
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

data Cmd a
  = Watch a
  | UnWatch a

data Event a b
  = EventCmd (Cmd a)
  | EventLnd b
  | EventTask (a, Either LndError ())

data Watcher a b m
  = Watcher
      { watcherChanCmd :: TChan (Cmd a),
        watcherChanLnd :: TChan (a, b),
        watcherSub :: a -> m (Either LndError ()),
        watcherHandler :: a -> b -> m (),
        watcherTasks :: Map a (Async (a, Either LndError ()))
      }

-- Spawn watcher where subscription accepts argument
-- for example `subscribeInvoicesChan`
spawnLink ::
  (Ord a, MonadUnliftIO m) =>
  LndEnv ->
  (Maybe (TChan (a, b)) -> LndEnv -> a -> m (Either LndError ())) ->
  (TChan (Cmd a) -> a -> b -> m ()) ->
  m (Async (), TChan (Cmd a))
spawnLink env sub handler =
  withRunInIO $ \run -> do
    (cw, lw, cr, lr) <- atomically $ do
      cw <- newBroadcastTChan
      lw <- newBroadcastTChan
      cr <- dupTChan cw
      lr <- dupTChan lw
      return (cw, lw, cr, lr)
    t <-
      async . run . loop $
        Watcher
          { watcherChanCmd = cr,
            watcherChanLnd = lr,
            watcherSub = sub (Just lw) env,
            watcherHandler = handler cw,
            watcherTasks = mempty
          }
    link t
    return (t, cw)

-- Spawn watcher where subscription don't accept argument
-- for example `subscribeChannelEventsChan`
spawnLinkUnit ::
  (MonadUnliftIO m) =>
  LndEnv ->
  (Maybe (TChan ((), b)) -> LndEnv -> m (Either LndError ())) ->
  (TChan (Cmd ()) -> b -> m ()) ->
  m (Async (), TChan (Cmd ()))
spawnLinkUnit env0 sub handler =
  spawnLink
    env0
    (\mChan env1 _ -> sub mChan env1)
    (\chan _ x -> handler chan x)

watch :: (MonadUnliftIO m) => TChan (Cmd a) -> a -> m ()
watch cw = atomically . writeTChan cw . Watch

watchUnit :: (MonadUnliftIO m) => TChan (Cmd ()) -> m ()
watchUnit cw = watch cw ()

unWatch :: (MonadUnliftIO m) => TChan (Cmd a) -> a -> m ()
unWatch cw = atomically . writeTChan cw . UnWatch

unWatchUnit :: (MonadUnliftIO m) => TChan (Cmd ()) -> m ()
unWatchUnit cw = unWatch cw ()

loop :: (Ord a, MonadUnliftIO m) => Watcher a b m -> m ()
loop w = do
  event <-
    atomically $
      EventCmd <$> readTChan (watcherChanCmd w)
        <|> EventLnd <$> readTChan (watcherChanLnd w)
        <|> EventTask . snd <$> waitAnySTM (Map.elems $ watcherTasks w)
  case event of
    EventCmd x -> applyCmd w x
    EventLnd x -> applyLnd w x
    EventTask x -> applyTask w x

applyCmd :: (Ord a, MonadUnliftIO m) => Watcher a b m -> Cmd a -> m ()
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

applyLnd :: (Ord a, MonadUnliftIO m) => Watcher a b m -> (a, b) -> m ()
applyLnd w (x0, x1) = watcherHandler w x0 x1 >> loop w

applyTask ::
  (Ord a, MonadUnliftIO m) =>
  Watcher a b m ->
  (a, Either LndError ()) ->
  m ()
applyTask w0 (x, res) =
  case Map.lookup x ts of
    Nothing -> loop w0
    Just t ->
      if isLeft res
        then applyCmd w1 $ Watch x
        else do
          liftIO $ cancel t
          loop w1
  where
    ts = watcherTasks w0
    w1 = w0 {watcherTasks = Map.delete x ts}
