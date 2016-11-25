module Command
  ( Command(..)
  , Axis(..)
  , Direction(..)
  ) where

data Axis
    = X
    | Y
    | Servo

data Direction
    = Forward
    | Backward

data Command
    = Command Axis
              Direction
    | Reset
