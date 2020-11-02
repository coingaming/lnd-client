{-# LANGUAGE FlexibleContexts #-}

module LndClient.Util
  ( safeFromIntegral,
    showB64BS,
    spawnLink,
    readTChanTimeout,
    MicroSecondsDelay (..),
  )
where

import qualified Data.ByteString.Base64 as B64 (encode)
import qualified Data.Text as TS
import LndClient.Import.External

newtype MicroSecondsDelay = MicroSecondsDelay Int

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

showB64BS :: ByteString -> String
showB64BS x =
  case decodeUtf8' $ "B64 " <> B64.encode x of
    Left _ -> "RAW " <> show x
    Right s -> TS.unpack s

spawnLink :: (MonadUnliftIO m) => m a -> m (Async a)
spawnLink x =
  withRunInIO $ \run -> do
    pid <- async $ run x
    link pid
    return pid

readTChanTimeout :: MonadIO m => MicroSecondsDelay -> TChan a -> m (Maybe a)
readTChanTimeout t x = do
  t0 <- liftIO . registerDelay $ coerce t
  atomically $
    Just <$> readTChan x
      <|> Nothing <$ fini t0

fini :: TVar Bool -> STM ()
fini = check <=< readTVar
