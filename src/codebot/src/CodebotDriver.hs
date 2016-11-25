module CodebotDriver
  ( hardwareExecute
  ) where

import Command
import Control.Monad
import Data.ByteString.Char8 as B
import System.Hardware.Serialport

type RawCommand = String

port = "/dev/ttyUSB1"

hardwareExecute :: HardwareCommand -> IO ()
hardwareExecute = perfomeCommand . composeCommand

composeCommand :: HardwareCommand -> RawCommand
composeCommand (HardwareCommand X Forward) = "x:f;"
composeCommand (HardwareCommand Y Forward) = "y:f;"
composeCommand (HardwareCommand X Backward) = "x:b;"
composeCommand (HardwareCommand Y Backward) = "y:b;"
composeCommand (HardwareCommand Servo Forward) = "s:f;"
composeCommand (HardwareCommand Servo Backward) = "s:b;"
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
