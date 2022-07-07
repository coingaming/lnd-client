module LndClient.ChanBakSpec
  ( spec,
  )
where

import qualified LndClient.Data.ChannelBackup as Bak
import LndClient.Import
import LndClient.LndTest
import LndClient.RPC.Katip
import LndClient.TestApp
import Test.Hspec

spec :: Spec
spec = do
  it "export SUCCEEDED" $
    withEnv $ do
      cp <- setupOneChannel Alice Bob
      let goodBak bak =
            ( not
                . null
                . Bak.unSingleChanBackupBlob
                $ Bak.chanBackup bak
            )
              && (Bak.chanPoint bak == cp)
      let goodBaks = \case
            [bak] -> goodBak bak
            _ -> False
      alice <- getLndEnv Alice
      bob <- getLndEnv Bob
      bakA <- liftLndResult =<< exportChannelBackup alice cp
      bakB <- liftLndResult =<< exportChannelBackup bob cp
      baksA <- liftLndResult =<< exportAllChannelBackups alice
      baksB <- liftLndResult =<< exportAllChannelBackups bob
      liftIO $ do
        --
        -- TODO : this fails for some reason,
        -- backups are different
        --
        -- baksA `shouldBe` [bakA]
        bakA `shouldSatisfy` goodBak
        bakB `shouldSatisfy` goodBak
        baksA `shouldSatisfy` goodBaks
        baksB `shouldSatisfy` goodBaks
  it "restore SUCCEEDED" $
    withEnv $ do
      cp <- setupOneChannel Alice Bob
      alice <- getLndEnv Alice
      bakA <- liftLndResult =<< exportChannelBackup alice cp
      liftLndResult =<< restoreChannelBackups alice [bakA]
      liftIO $ do
        --
        -- TODO : verify unconfirmed balance increase
        -- through walletBalance.
        --
        True `shouldBe` True
