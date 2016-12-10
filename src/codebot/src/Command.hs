module Command
  ( Command(..)
  , Axis(..)
  , Direction(..)
  , readCommandsFile
  ) where

import Safe

data Axis
    = X
    | Y
    | Servo
    deriving (Show, Read)

data Direction
    = Forward
    | Backward
    deriving (Show, Read)

data Command
    = Step Direction
           Axis
    | Jump Direction
           Axis
    | OpenDoor Direction
               Axis
    | PickUp
    | Drop
    | Interact
    deriving (Show, Read)

validCommands = ["Step", "Jump", "OpenDoor", "PickUp", "Drop", "Interact"]

readCommandsFile :: FilePath -> IO [Command]
readCommandsFile fp =
    readFile fp >>= return . map read . filter isCommand . lines

isCommand :: String -> Bool
isCommand str =
    maybe False (`elem` validCommands) firstWord
  where
    firstWord = headMay . words $ str
