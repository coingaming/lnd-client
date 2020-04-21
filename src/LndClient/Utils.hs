{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}

module LndClient.Utils
  ( doExpBackOff,
    coerceLndResult,
    stdToJSON,
    stdParseJSON,
    LndResult (..),
  )
where

import Control.Exception (Handler (..), catches, throwIO)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Retry (exponentialBackoff, limitRetries, retrying)
import Data.Aeson
  ( GFromJSON,
    GToJSON,
    Value,
    Zero,
    genericParseJSON,
    genericToJSON,
    omitNothingFields,
  )
import Data.Aeson.Casing (aesonDrop, snakeCase)
import Data.Aeson.Types (Parser)
import GHC.Generics (Generic, Rep (..))
import Network.HTTP.Client (HttpException (..), queryString, requestHeaders)
import UnliftIO (MonadUnliftIO, toIO)

data LndResult a
  = LndSuccess a
  | LndFail a
  | LndHttpException HttpException
  deriving (Show)

stdToJSON :: (Generic a, GToJSON Zero (Rep a)) => a -> Value
stdToJSON =
  genericToJSON $ (aesonDrop 0 snakeCase) {omitNothingFields = True}

stdParseJSON :: (Generic a, GFromJSON Zero (Rep a)) => Value -> Parser a
stdParseJSON = genericParseJSON $ aesonDrop 0 snakeCase

coerceLndResult :: (Show a, MonadIO m) => LndResult a -> m a
coerceLndResult (LndSuccess x) = return x
coerceLndResult (LndFail x) = fail $ "got LndFail " <> show x
coerceLndResult (LndHttpException e) = liftIO $ throwIO e

doExpBackOff ::
  (MonadUnliftIO m) => Int -> (a -> Bool) -> m a -> m (LndResult a)
doExpBackOff lim cond expr =
  retrying policy when exprSafe
  where
    policy = exponentialBackoff 1000000 <> limitRetries lim
    --
    -- TODO: improvement
    --
    -- very boolean blind and not obvious implementation in Control.Retry
    -- library works, but it's good to make PR with better sum type
    -- something like "data WhatToDo = Retry | Halt"
    when _ x = return $ case x of
      LndSuccess _ -> False
      _ -> True
    exprSafe _ = do
      exprIO <- toIO expr
      liftIO $ resolve <$> catches (Right <$> exprIO) exHandlers
    resolve res =
      case res of
        Left e -> e
        Right x -> (if cond x then LndSuccess else LndFail) x
    exHandlers =
      [ Handler
          ( \(e :: HttpException) -> return $ Left $ LndHttpException $ case e of
              (InvalidUrlException _ _) -> e
              (HttpExceptionRequest re ex) ->
                HttpExceptionRequest
                  re
                    { requestHeaders =
                        (\(x, _) -> (x, "SECRET"))
                          <$> requestHeaders re,
                      queryString = "SECRET"
                    }
                  ex
          )
      ]
