Requirement:

1. 3x3 tic tac toe
2. Player will win in case of same player symbol horizontally or vertically or diagonally
3. 2 Real Players will play at a time. (No computer)


Non-Functional Requirement:
1. SOLID, Open close principle
2. Scalable
3. Reusable Code
4. Error Handle


Entities:

Board
Cell
Player


Strategy Pattern:

<<Interface>> WinningStrategy
DiagonalWinningStrategy
HorizontalWinningStrategy
VerticalWinningStrategy


enum Error

class Board {
    +List<<Cell>> cells
    +int size
}

class Cell {
    +symbol
    +fill(symbol)
}

class Player {
    +name
    +symbol
}

enum Symbol {
    case cross
    case circle
    case empty
}

protocol WinningStrategy {
    +checkIfWin(cellRow, cellColumn) Bool
}

struct DiagonalWinningStrategy: WinningStrategy {}
struct HorizontalWinningStrategy: WinningStrategy {}
struct VerticalWinningStrategy: WinningStrategy {}


class PlayersList {
    +listOfPlayers
    +numberOfPlayers
    +setNumberOfPlayer(Int)
    +simpleLoopIterator: PlayerLoopIterator
}

protocol PlayerIterator {
    +next(PlayersList)
}

class SimpleLoopIterator: PlayerIterator {
    +next(PlayersList)
}

class GameEngine { // FACADE
    +playerList

    +setPlayer
    +makeMove(cellRow, cellColumn)
    +checkTheWinner Bool
    +setWinningStrategy
    +startGame
}

class Game { // USER Interact with this class
    +intialize
    +makeMove
}


WinningStrategy <|-- DiagonalWinningStrategy
WinningStrategy <|-- HorizontalWinningStrategy
WinningStrategy <|-- VerticalWinningStrategy


Player ---> Symbol

Cell *-- Symbol

Board *--  Cell

Board ---> Symbol

PlayersList ---> PlayerIterator

PlayerIterator <|-- SimpleLoopIterator

### Currently we only have simple game with two players, we can avoid iteration pattern for now, in future other type of player turn method comes we can have iteration pattern
### we can avoid Game class as well, if there is any UI or view model, then game class could be used
