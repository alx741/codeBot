module Main where

import CodebotDriver
import Command

main :: IO ()
main = do
    hardwareExecute (HardwareCommand X Forward)
    hardwareExecute (HardwareCommand X Backward)
    hardwareExecute (HardwareCommand Y Forward)
    hardwareExecute (HardwareCommand Y Backward)
