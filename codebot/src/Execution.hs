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

jump :: (Position, Board)
     -> Direction
     -> Axis
     -> Bool
     -> Maybe (Position, Board)
jump (position, board) direction axis drop = do
    position' <- move position direction axis >>= actionFeasible canJump board position
    return (position', boardDropTile drop board position)

openDoor :: (Position, Board)
     -> Direction
     -> Axis
     -> Maybe (Position, Board)
openDoor (position, board) direction axis = do
    position' <- move position direction axis >>= actionFeasible canOpenDoor board position
    return (position, replaceInBoard position' board (Door Open))

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

canOpenDoor :: Cell -> Cell -> Bool
canOpenDoor _ cell' =
    case cell' of
        Door Closed -> True
        _ -> False
