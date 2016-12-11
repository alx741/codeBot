module Tests.Execution where

import Test.Tasty
import Test.Tasty.HUnit

import Execution
import Board
import Command

execution :: TestTree
execution = testGroup "Execution" [stepping]

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

stepping = testGroup "Stepping"
        [ testCase "Step on Tile at level 0" $
          assertEqual ""
            (Just (Position 1 0 0, testBoard))
            (step (Position 0 0 0, testBoard) Forward X False)

        , testCase "Step on Tile at level 2" $
          assertEqual ""
            (Just (Position 4 4 0, testBoard))
            (step (Position 3 4 0, testBoard) Forward X False)

        , testCase "Step on Open Door" $
          assertEqual ""
            (Just (Position 3 0 0, testBoard))
            (step (Position 2 0 0, testBoard) Forward X False)

        , testCase "Step on Closed Door" $
          assertEqual ""
            (Nothing)
            (step (Position 5 0 0, testBoard) Forward X False)

        , testCase "Step on Obstacle" $
          assertEqual ""
            (Nothing)
            (step (Position 4 7 0, testBoard) Backward Y False)

        , testCase "Step on Full Socket" $
          assertEqual ""
            (Just (Position 1 6 0, testBoard))
            (step (Position 1 5 0, testBoard) Forward Y False)

        , testCase "Step on Empty Socket" $
          assertEqual ""
            (Nothing)
            (step (Position 3 6 0, testBoard) Forward Y False)

        , testCase "Step Outside the Board on X Forward" $
          assertEqual ""
            (Nothing)
            (step (Position 7 0 0, testBoard) Forward X False)

        , testCase "Step Outside the Board on X Backward" $
          assertEqual ""
            (Nothing)
            (step (Position 0 0 0, testBoard) Backward X False)

        , testCase "Step Outside the Board on Y Forward" $
          assertEqual ""
            (Nothing)
            (step (Position 0 7 0, testBoard) Forward Y False)

        , testCase "Step Outside the Board on Y Backward" $
          assertEqual ""
            (Nothing)
            (step (Position 0 0 0, testBoard) Backward Y False)
        ]
