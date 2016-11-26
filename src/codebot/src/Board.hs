module Board where

type Board = [[Cell]]

data Position = Position
    { x :: Int
    , y :: Int
    } deriving (Show, Eq)

data Cell
    = Tile
    | Empty
    | Door DoorState
    | Obstacle
    | Object ObjectType
    | Socket ObjectType
             SocketState
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
    = Key
    | Square
    | Triangle
    | Circle
    | Star
    | Diamond
    deriving (Show, Eq)

readBoardFile :: FilePath -> Board
readBoardFile = undefined

board :: Board
board =
    [ [Tile, Tile, Tile, Tile, Tile, Object Triangle, Tile, Tile]
    , [Tile, Tile, Tile, Tile, Tile, Tile, Tile, Tile]
    , [Tile, Tile, Object Circle, Tile, Tile, Tile, Tile, Tile]
    , [Tile, Tile, Tile, Tile, Tile, Tile, Tile, Tile]
    , [Tile, Tile, Tile, Tile, Tile, Tile, Socket Triangle SocketEmpty, Tile]
    , [Tile, Tile, Socket Circle SocketEmpty, Tile, Tile, Tile, Tile, Tile]
    , [Tile, Tile, Tile, Tile, Door Close, Tile, Tile, Tile]
    , [Tile, Tile, Object Key, Tile, Tile, Tile, Tile, Tile]
    ]
