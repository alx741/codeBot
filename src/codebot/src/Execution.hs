module Execution where

import Command
import Board
import Data.List
import Data.Maybe

isSafeCommand :: Command -> Position -> Board -> Bool
isSafeCommand = undefined

tryCommand :: Command -> Position -> Board -> Maybe (Position, Board)
tryCommand = undefined

step :: (Position, Board)
     -> Direction
     -> Axis
     -> Bool
     -> Maybe (Position, Board)
step (position, board) direction axis drop =
    if isActionFeasible canStep position position' board
        then position' >>= (\x -> Just (x, boardDropTile drop board x))
        else Nothing
  where
    position' = move position direction axis

jump :: (Position, Board)
     -> Direction
     -> Axis
     -> Bool
     -> Maybe (Position, Board)
jump (position, board) direction axis drop =
    if isActionFeasible canJump position position' board
        then position' >>= (\x -> Just (x, boardDropTile drop board x))
        else Nothing
  where
    position' = move position direction axis

isActionFeasible :: (Cell -> Cell -> Bool)
                 -> Position
                 -> Maybe Position
                 -> Board
                 -> Bool
isActionFeasible canDo pos pos' board =
    case getCell board pos of
        Just cell -> isJust $ canDo cell <$> (pos' >>= getCell board)
        Nothing -> False

canStep :: Cell -> Cell -> Bool
canStep _ cell =
    case cell of
        Tile 0 -> True
        Door Open -> True
        Socket _ SocketFull -> True
        _ -> False

canJump :: Cell -> Cell -> Bool
canJump cell cell' =
    case cell of
        Tile n ->
            case cell' of
                Tile m -> n == m + 1 || n == m - 1
                _ -> False
        _ -> False
