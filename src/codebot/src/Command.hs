module Command
  ( Command(..)
  , Axis(..)
  , Direction(..)
  , readCommandsFile
  ) where

import Safe

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

validCommands = ["Step", "Jump", "OpenDoor", "PickUp", "Drop", "Interact"]

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
readCommandsFile :: FilePath -> IO [Command]
readCommandsFile fp =
    readFile fp >>= return . map read . filter isCommand . lines

isCommand :: String -> Bool
isCommand str =
    case firstWord of
        Just word -> word `elem` validCommands
        Nothing -> False
  where
    firstWord = headMay . words $ str
