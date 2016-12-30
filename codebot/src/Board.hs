module Board where

import Command
import Control.Monad.Trans
import Control.Monad.Trans.Maybe
import Control.Monad
import Data.ByteString.Char8 (pack, unpack)
import Data.Yaml.YamlLight

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
    deriving (Show, Read, Eq)

data DoorState
    = Open
    | Closed
    deriving (Show, Read, Eq)

data SocketState
    = SocketFull
    | SocketEmpty
    deriving (Show, Read, Eq)

data ObjectType
    = Key
    | Square
    | Triangle
    | Circle
    | Star
    | Diamond
    deriving (Show, Read, Eq)

readBoardFile :: FilePath -> MaybeT IO [[Cell]]
readBoardFile fp = MaybeT $ do
    yam <- runMaybeT $ getYamlBoard fp
    return $ yam >>= unSeq >>= Just . map (map read . getStringBoard)
    where
        getYamlBoard :: FilePath -> MaybeT IO YamlLight
        getYamlBoard fp = MaybeT $ do
            ymap <- parseYamlFile fp
            return $ lookupYL (YStr $ pack "Board") ymap

        getStringBoard :: YamlLight -> [String]
        getStringBoard (YSeq []) = []
        getStringBoard (YSeq (YStr x:xs)) = unpack x : getStringBoard (YSeq xs)

boardDropTile :: Bool -> Board -> Position -> Board
boardDropTile False board _ = board
boardDropTile True board pos = dropTile board pos

dropTile :: Board -> Position -> Board
dropTile board position =
    case cell of
        Just (Tile _) -> board'
        _ -> board
  where
    cell = getCell board position
    board' = replaceInBoard position board Empty

replaceInBoard :: Position -> Board -> Cell -> Board
replaceInBoard (Position x y _) board cell =
    replaceNth y (replaceNth x cell (board !! y)) board

replaceNth :: Int -> a -> [a] -> [a]
replaceNth n elem (x:xs)
    | n == 0 = elem : xs
    | otherwise = x : replaceNth (n - 1) elem xs

getCell :: Board -> Position -> Maybe Cell
getCell board position =
    case isValidPosition position of
        Just position' -> Just (board !! y position' !! x position')
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

emptyBoard :: Board
emptyBoard = (make8 . make8) (Tile 0)
    where
        make8 = replicate 8
