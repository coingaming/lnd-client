{-# LANGUAGE FlexibleContexts #-}

module LndClient.Util
  ( retrySilent,
    retryKatip,
    safeFromIntegral,
    spawnLink,
    readTChanTimeout,
    maybeDeadlock,
    MicroSecondsDelay (..),
  )
where

import Control.Exception
import LndClient.Data.Type
import LndClient.Import.External

newtype MicroSecondsDelay = MicroSecondsDelay Int

retrySilent ::
  MonadIO m => m (Either LndError a) -> m (Either LndError a)
retrySilent = this 0
  where
    this (attempt0 :: Integer) f = do
      let attempt = attempt0 + 1
      res <- f
      case res of
        Left (LndError _) ->
          if attempt > 5
            then pure res
            else do
              liftIO $ delay 300000
              this attempt f
        _ ->
          pure res

retryKatip ::
  KatipContext m => m (Either LndError a) -> m (Either LndError a)
retryKatip = this 0
  where
    this (attempt0 :: Integer) f = do
      let attempt = attempt0 + 1
      res <- f
      case res of
        Left (LndError _) ->
          if attempt > 5
            then pure res
            else do
              liftIO $ delay 300000
              this attempt f
        _ ->
          pure res

safeFromIntegral ::
  forall a b. (Integral a, Integral b, Bounded b) => a -> Maybe b
safeFromIntegral x =
  if (intX >= intMin) && (intX <= intMax)
    then Just $ fromIntegral x
    else Nothing
  where
    intX = fromIntegral x :: Integer
    intMin = fromIntegral (minBound :: b) :: Integer
    intMax = fromIntegral (maxBound :: b) :: Integer

spawnLink :: (MonadUnliftIO m) => m a -> m (Async a)
spawnLink x =
  withRunInIO $ \run -> do
    pid <- async $ run x
    link pid
    return pid

readTChanTimeout ::
  MonadUnliftIO m => MicroSecondsDelay -> TChan a -> m (Maybe a)
readTChanTimeout t x = do
  t0 <- liftIO . registerDelay $ coerce t
  (join <$>) . maybeDeadlock . atomically $
    Just <$> readTChan x
      <|> Nothing <$ fini t0

maybeDeadlock :: MonadUnliftIO m => m a -> m (Maybe a)
maybeDeadlock x =
  withRunInIO $ \run ->
    (Just <$> run x)
      `catches` [ Handler $
                    \BlockedIndefinitelyOnSTM -> return Nothing
                ]

fini :: TVar Bool -> STM ()
fini = check <=< readTVar
