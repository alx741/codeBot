import Test.Tasty
import Test.Tasty.HUnit

import Data.List
import Data.Ord
import Execution
import Command

main = defaultMain tests

tests :: TestTree
tests = testGroup "Execution" [commands]

commands =
    testGroup
        "Execution"
        [ testCase "Jump Forward X Is Command" $
          assertBool "Is a command" (isCommand "Jump Forward X")
        , testCase "OpenDoor Backward Y Is Command" $
          assertBool "Is a command" (isCommand "OpenDoor Backward Y")
        ]
