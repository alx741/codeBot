module Tests.Command where

import Test.Tasty
import Test.Tasty.HUnit

import Command

commands :: TestTree
commands = testGroup "Commands" [areCommands]

areCommands = testGroup "Execution"
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
