//
// GameEngine.swift
// LLD
//

class TicTacToeGameEngine {
    
    let boardsize  = 3
    var board: Board
    var players: [Player] = []
    var numberOfPlayers = 2
    var curenttPlayerIndex = 0
    var winningStrategy: [WinningStrategy] = []
    var state: GameState = .waitingToStart
    
    init() {
        board = Board(boardsize)
        winningStrategy = [DiagonalWinningStrategy(), HorizontalWinningStrategy(), VerticalWinningStrategy()]
    }
    
    func setPlayers(_ player: Player) throws {
        if players.count == numberOfPlayers {
            throw GameError.maxPlayerReached
        }
        player.symbol = players.count == 0 ? .cross : .circle
        players.append(player)
    }
    
    
    
    func currentPlayer() -> Player {
        players[curenttPlayerIndex]
    }
    private func setNextPlayer() {
        curenttPlayerIndex = (curenttPlayerIndex+1)%numberOfPlayers
    }
    
    fileprivate func checkIfPlayerWon(_ move: Move) {
        let currentPlayer = currentPlayer()
        for i in winningStrategy {
            if i.isWinning(on: board, last: move) {
                print("winner found", type(of: i))
                state = .finished(winner: currentPlayer)
                break
            }
        }
    }
    
    private func fillTheCell(_ move: Move) {
        let cell = board.cells[move.row][move.column]
        let currentPlayer = currentPlayer()
        cell.symbol = currentPlayer.symbol
    }
    
    func makeMove(_ move: Move) throws -> Player {
        switch state {
        case .finished, .draw: throw GameError.gameIsFinished
        case .waitingToStart: throw GameError.gameHasntStarted
        default: break
        }
        let currentPlayer = currentPlayer()
        try isValidMove(move)
        
        fillTheCell(move)
        checkIfPlayerWon(move)
        
        setNextPlayer()
        if board.isFull() {
            state = .draw
        }
        return currentPlayer
    }
    
    func setWinningStrategy(_ strategy: WinningStrategy) {
        winningStrategy.append(strategy)
    }
    
    func start() throws {
        if players.count < numberOfPlayers {
            throw GameError.PlayersMissing
        }
        state = .inProgress
        curenttPlayerIndex = 0
    }
    
    func reset() {
        players = []
        state = .waitingToStart
        curenttPlayerIndex = 0
        board.reset()
    }
    private func isValidMove(_ move: Move) throws {
        if move.row >= 0 && move.row < boardsize && move.column >= 0 && move.column < boardsize {
            if board.cells[move.row][move.column].isFilled {
                throw GameError.invalidMove
            }
        } else {
            throw GameError.invalidMove
        }
    }
}

