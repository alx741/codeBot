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
    if canStep'
        then position' >>= createBoard drop board
        else Nothing
  where
    position' = move position direction axis
    canStep' =
        case getCell board position of
            Just cell ->
                isJust $ canStep cell <$> (position' >>= getCell board)
            Nothing -> False
    createBoard drop board pos =
        if drop
            then Just (pos, dropTile board pos)
            else Just (pos, board)

canStep :: Cell -> Cell -> Bool
canStep _ cell =
    case cell of
        Tile 0 -> True
        Door Open -> True
        Socket _ SocketFull -> True
        otherwise -> False
-- canJump :: Position -> Position -> Board -> Bool
-- canJump position position' board =
--     case getCell board position' of
--         Just cell ->
--             case cell of
--                 Tile n ->
--                     if z position == (z position') + 1 ||
--                        z position == (z position') - 1
--                         then True
--                         else False
--                 otherwise -> False
--         Nothing -> False
