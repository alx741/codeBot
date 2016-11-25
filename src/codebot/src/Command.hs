module Command
  ( HardwareCommand(..)
  , Command(..)
  , Axis(..)
  , Direction(..)
  ) where

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

data HardwareCommand
    = HardwareCommand Axis
                      Direction
    | Reset
