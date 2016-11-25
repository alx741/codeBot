module Main where

import CodebotDriver
import Command

main :: IO ()
main = do
    hardwareExecute (Command X Forward)
    hardwareExecute (Command X Backward)
    hardwareExecute (Command Y Forward)
    hardwareExecute (Command Y Backward)
