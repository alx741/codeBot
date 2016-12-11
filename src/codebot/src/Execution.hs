module Execution where

import Board
import Command
import Data.List
import Data.Maybe
import Debug.Trace

isSafeCommand :: Command -> Position -> Board -> Bool
isSafeCommand = undefined

tryCommand :: Command -> Position -> Board -> Maybe (Position, Board)
tryCommand = undefined

step :: (Position, Board)
     -> Direction
     -> Axis
     -> Bool
     -> Maybe (Position, Board)
step (position, board) direction axis drop = do
    position' <- move position direction axis >>= actionFeasible canStep board position
    return (position', boardDropTile drop board position)

actionFeasible :: (Cell -> Cell -> Bool)
                 -> Board
                 -> Position
                 -> Position
                 -> Maybe Position
actionFeasible canDo board pos pos' = do
    cell <- getCell board pos
    cell' <- getCell board pos'
    if pos /= pos' && canDo cell cell'
        then return pos'
        else Nothing

canStep :: Cell -> Cell -> Bool
canStep cell cell' =
    case cell' of
        Tile n ->
            case cell of
                Tile m -> n == m
                _ -> False
        Door Open -> True
        Object _ -> True
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
