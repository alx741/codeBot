module Board where

type Board = [[Cell]]

data Cell
    = Tile
    | Empty
    | Door DoorState
    | Obstacle
    | Object ObjectType
    | ObjectSocket ObjectType
                   SocketState
    | Key
    deriving (Show, Eq)

data DoorState
    = Open
    | Close
    deriving (Show, Eq)

data SocketState
    = SocketFull
    | SocketEmpty
    deriving (Show, Eq)

data ObjectType
    = Square
    | Triangle
    | Circle
    | Star
    | Diamond
    deriving (Show, Eq)
