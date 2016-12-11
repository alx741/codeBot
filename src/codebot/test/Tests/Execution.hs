module Tests.Execution where

import Test.Tasty
import Test.Tasty.HUnit

import Execution

execution :: TestTree
execution = testGroup "Execution" [actions]

actions = testGroup "Action Commands"
        [ testCase "\"Jump Forward X\" Is Command" $
          assertBool "Is a command" (isCommand "Jump Forward X")
        , testCase "\"Jump Forward X\" Is Command" $
          assertBool "Is a command" (isCommand "Jump Forward X")
        , testCase "\"OpenDoor Backward Y\" Is Command" $
          assertBool "Is a command" (isCommand "OpenDoor Backward Y")
        , testCase "\"PickUp\" Is Command" $
          assertBool "Is a command" (isCommand "PickUp")
        , testCase "\"Drop\" Is Command" $
          assertBool "Is a command" (isCommand "Drop")
        , testCase "\"Interact\" Is Command" $
          assertBool "Is a command" (isCommand "Interact")
        ]
