module Execution
  ( readCommandsFile
  ) where

import Command
import Data.List
import Safe

validCommands = ["Step", "Jump", "OpenDoor", "PickUp", "Drop", "Interact"]

readCommandsFile :: FilePath -> IO [Command]
readCommandsFile fp =
    readFile fp >>= return . map read . filter isCommand . lines

isCommand :: String -> Bool
isCommand str =
    case firstWord of
        Just word -> word `elem` validCommands
        Nothing -> False
  where
    firstWord = headMay . words $ str
