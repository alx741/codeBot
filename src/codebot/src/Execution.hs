module Execution where

import Command
import Board
import Data.List
import Data.Maybe

isSafeCommand :: Command -> Position -> Board -> Bool
isSafeCommand = undefined

tryCommand :: Command -> Position -> Board -> Maybe (Position, Board)
tryCommand = undefined
