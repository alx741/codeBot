module ExecutionSpec where

import Test.Hspec
import Test.QuickCheck

import Execution
import Board
import Command

spec :: Spec
spec = do
    describe "step" $ do
        it "returns an updated Position and Board" $ do
            (step (Position 0 0 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 1 0 0, testBoard))

            (step (Position 3 4 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 4 4 0, testBoard))

            (step (Position 2 0 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 3 0 0, testBoard))

        context "when is imposible to step" $ do
            it "returns Nothing" $ do
                (step (Position 5 0 0, testBoard) Forward X False)
                    `shouldBe` (Nothing)

                (step (Position 4 7 0, testBoard) Backward Y False)
                    `shouldBe` (Nothing)

                (step (Position 1 5 0, testBoard) Forward Y False)
                    `shouldBe` (Just (Position 1 6 0, testBoard))

                (step (Position 3 6 0, testBoard) Forward Y False)
                    `shouldBe` (Nothing)

                (step (Position 7 0 0, testBoard) Forward X False)
                    `shouldBe` (Nothing)

                (step (Position 0 0 0, testBoard) Backward X False)
                    `shouldBe` (Nothing)

                (step (Position 0 7 0, testBoard) Forward Y False)
                    `shouldBe` (Nothing)

                (step (Position 0 0 0, testBoard) Backward Y False)
                    `shouldBe` (Nothing)


    describe "jump" $ do
        it "returns an updated Position and Board" $ do
            (jump (Position 0 0 0, testBoard) Forward X False)
                `shouldBe` (Nothing)

            (jump (Position 2 3 0, testBoard) Forward Y False)
                `shouldBe` (Just (Position 2 4 0, testBoard))

            (jump (Position 2 4 0, testBoard) Backward X False)
                `shouldBe` (Nothing)

            (jump (Position 2 4 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 3 4 0, testBoard))

            (jump (Position 4 4 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 5 4 0, testBoard))

            (jump (Position 6 4 0, testBoard) Forward X False)
                `shouldBe` (Just (Position 7 4 0, testBoard))

        context "when is imposible to jump" $ do
            it "returns Nothing" $ do
                (jump (Position 2 0 0, testBoard) Forward X False)
                    `shouldBe` (Nothing)

                (jump (Position 5 0 0, testBoard) Forward X False)
                    `shouldBe` (Nothing)

                (jump (Position 4 7 0, testBoard) Backward Y False)
                    `shouldBe` (Nothing)

                (jump (Position 1 5 0, testBoard) Forward Y False)
                    `shouldBe` (Nothing)

                (jump (Position 3 6 0, testBoard) Forward Y False)
                    `shouldBe` (Nothing)

                (jump (Position 7 0 0, testBoard) Forward X False)
                    `shouldBe` (Nothing)

                (jump (Position 0 0 0, testBoard) Backward X False)
                    `shouldBe` (Nothing)

                (jump (Position 0 7 0, testBoard) Forward Y False)
                    `shouldBe` (Nothing)

                (jump (Position 0 0 0, testBoard) Backward Y False)
                    `shouldBe` (Nothing)


    describe "openDoor" $ do
        it "returns an updated Position and Board" $ do
            (openDoor (Position 5 0 0, testBoard) Forward X)
                `shouldBe` (Just (Position 5 0 0, newBoard $ Position 6 0 0))

            (openDoor (Position 2 0 0, testBoard) Forward X)
                `shouldBe` (Nothing)
        where
            newBoard pos = replaceInBoard pos testBoard (Door Open)



testBoard =
    [ [ Tile 0
      , Tile 0
      , Tile 0
      , Door Open
      , Tile 0
      , Tile 0
      , Door Closed
      , Tile 0
      ]
    , [Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 0, Tile 0, Empty, Tile 0, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 1, Tile 1, Tile 2, Tile 2, Tile 1, Tile 1, Tile 0]
    , [Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [ Tile 0
      , Socket Square SocketFull
      , Tile 0
      , Tile 0
      , Obstacle
      , Tile 0
      , Tile 0
      , Tile 0
      ]
    , [ Tile 0
      , Tile 0
      , Tile 0
      , Socket Triangle SocketEmpty
      , Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      ]
    ]
