module Board where

import Command

type Board = [[Cell]]

data Position = Position
    { x :: Int
    , y :: Int
    , z :: Int
    } deriving (Show, Eq)

data Cell
    = Tile Int
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

getCell :: Position -> Board -> Maybe Cell
getCell position board =
    case isValidPosition position of
        Just position' -> Just (board !! x position' !! y position')
        Nothing -> Nothing

move :: Position -> Direction -> Axis -> Maybe Position
move pos Forward axis = applyMovement (+ 1) axis pos
move pos Backward axis = applyMovement (\x -> x - 1) axis pos

applyMovement :: (Int -> Int) -> Axis -> Position -> Maybe Position
applyMovement f X position = isValidPosition position'
  where
    position' =
        Position
        { x = f $ x position
        , y = y position
        , z = z position
        }
applyMovement f Y position = isValidPosition position'
  where
    position' =
        Position
        { x = x position
        , y = f $ y position
        , z = z position
        }

isValidPosition :: Position -> Maybe Position
isValidPosition position
    | validX && validY = Just position
    | otherwise = Nothing
  where
    validX = x position >= 0 && x position <= 7
    validY = y position >= 0 && y position <= 7

board :: Board
board =
    [ [ Tile 1
      , Tile 0
      , Tile 1
      , Tile 2
      , Tile 0
      , Object Triangle
      , Tile 0
      , Tile 0
      ]
    , [Door Close, Empty, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 0, Object Circle, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    , [ Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      , Socket Triangle SocketEmpty
      , Tile 0
      ]
    , [ Tile 0
      , Tile 0
      , Socket Circle SocketEmpty
      , Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      , Tile 0
      ]
    , [Tile 0, Tile 0, Tile 0, Tile 0, Door Close, Tile 0, Tile 0, Tile 0]
    , [Tile 0, Tile 0, Object Key, Tile 0, Tile 0, Tile 0, Tile 0, Tile 0]
    ]
