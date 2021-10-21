{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE TypeApplications #-}

module LndClient.Util
  ( retrySilent,
    retryKatip,
    safeFromIntegral,
    spawnLink,
    withSpawnLink,
    readTChanTimeout,
    catchAsync,
    txIdParser,
    MicroSecondsDelay (..),
    sleep,
  )
where

import qualified Control.Concurrent.Async as Async
import qualified Control.Concurrent.STM.TVar as TVar (registerDelay)
import qualified Control.Concurrent.Thread.Delay as Delay (delay)
import Control.Exception hiding (Handler, catches)
import qualified Data.ByteString as BS (reverse)
import qualified Data.ByteString.Base16 as B16 (decode)
import LndClient.Data.Type
import LndClient.Import.External

newtype MicroSecondsDelay = MicroSecondsDelay Int

txIdParser :: Text -> Either LndError ByteString
txIdParser xr =
  case B16.decode $ encodeUtf8 xr of
    Right x -> Right $ BS.reverse x
    Left {} -> Left $ FromGrpcError "TX_ID_NON_HEX_BYTES"

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
              sleep $ MicroSecondsDelay 300000
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
              sleep $ MicroSecondsDelay 300000
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
    pid <- Async.async $ run x
    Async.link pid
    pure pid

withSpawnLink :: (MonadUnliftIO m) => m a -> (Async a -> m b) -> m b
withSpawnLink action inner =
  withRunInIO $ \run ->
    Async.withAsync
      (run action)
      ( \pid -> do
          Async.link pid
          run $ inner pid
      )

readTChanTimeout ::
  MonadUnliftIO m => MicroSecondsDelay -> TChan a -> m (Maybe a)
readTChanTimeout t x = do
  t0 <-
    liftIO
      . TVar.registerDelay
      $ coerce t
  (join <$>)
    . (rightToMaybe <$>)
    . catchAsync
    . atomically
    $ Just <$> readTChan x
      <|> Nothing <$ fini t0

fini :: TVar Bool -> STM ()
fini = check <=< readTVar

catchAsync :: (MonadUnliftIO m) => m a -> m (Either Text a)
catchAsync x =
  (Right <$> x)
    `catches` [ Handler
                  ( \(_ :: BlockedIndefinitelyOnMVar) ->
                      pure $ Left "BlockedIndefinitelyOnMVar"
                  ),
                Handler
                  ( \(_ :: BlockedIndefinitelyOnSTM) ->
                      pure $ Left "BlockedIndefinitelyOnSTM"
                  )
              ]

sleep :: MonadIO m => MicroSecondsDelay -> m ()
sleep = liftIO . Delay.delay . fromIntegral @Int . coerce
