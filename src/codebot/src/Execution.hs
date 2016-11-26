module Execution where

import Command
import Board
import Data.List
import Safe

validCommands = ["Step", "Jump", "OpenDoor", "PickUp", "Drop", "Interact"]

isSafeCommand :: Command -> Position -> Board -> Bool
isSafeCommand = undefined

tryCommand :: Command -> Position -> Board -> Maybe (Position, Board)
tryCommand = undefined

-- canStep :: Position -> Board -> Bool
-- canStep position board = undefined

-- tryCommand command =
--     case command of
--         Step direction axis -> applyMovement direction axis
applyMovement :: Direction -> Axis -> Position -> Maybe Position
applyMovement Forward axis position = moveForward axis position
applyMovement Backward axis position = moveBackward axis position

moveForward :: Axis -> Position -> Maybe Position
moveForward X position =
    case isValidPosition position' of
        True -> Just position'
        False -> Nothing
  where
    position' =
        Position
        { x = x position + 1
        , y = y position
        }
moveForward Y position =
    case isValidPosition position' of
        True -> Just position'
        False -> Nothing
  where
    position' =
        Position
        { x = x position
        , y = y position + 1
        }

moveBackward :: Axis -> Position -> Maybe Position
moveBackward X position =
    case isValidPosition position' of
        True -> Just position'
        False -> Nothing
  where
    position' =
        Position
        { x = x position - 1
        , y = y position
        }
moveBackward Y position =
    case isValidPosition position' of
        True -> Just position'
        False -> Nothing
  where
    position' =
        Position
        { x = x position
        , y = y position - 1
        }

isValidPosition :: Position -> Bool
isValidPosition position
    | validX && validY = True
    | otherwise = False
  where
    validX = x position >= 0 && x position <= 7
    validY = y position >= 0 && y position <= 7

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
