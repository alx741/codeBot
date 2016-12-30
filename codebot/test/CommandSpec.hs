module CommandSpec where

import Test.Hspec
import Test.QuickCheck

import Command

spec :: Spec
spec = do
    describe "isCommand" $ do
        it "returns True when the argument is a valid command" $ do
            (isCommand "Jump Forward X") `shouldBe` True
