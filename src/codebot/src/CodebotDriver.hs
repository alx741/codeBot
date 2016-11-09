module CodebotDriver
  ( Command(..)
  , Axis(..)
  , Direction(..)
  , command
  ) where

import Control.Monad
import Data.ByteString.Char8 as B
import System.Hardware.Serialport

data Direction
    = Forward
    | Backward

data Axis
    = X
    | Y
    | Servo

data Command
    = Command Axis
              Direction
    | Reset

type RawCommand = String

port = "/dev/ttyUSB1"

command :: Command -> IO ()
command = perfomeCommand . composeCommand

composeCommand :: Command -> RawCommand
composeCommand (Command X Forward) = "x:f;"
composeCommand (Command Y Forward) = "y:f;"
composeCommand (Command X Backward) = "x:b;"
composeCommand (Command Y Backward) = "y:b;"
composeCommand (Command Servo Forward) = "s:f;"
composeCommand (Command Servo Backward) = "s:b;"
composeCommand Reset = "r;"

perfomeCommand :: RawCommand -> IO ()
perfomeCommand command = do
    sp <-
        openSerial
            port
            defaultSerialSettings
            { commSpeed = CS9600
            }
    _ <- send sp $ B.pack command
    _ <- waitHardware sp
    return ()

waitHardware :: SerialPort -> IO ()
waitHardware sp = do
    char <- recv sp 1
    unless (B.pack ">" == char) $ waitHardware sp
