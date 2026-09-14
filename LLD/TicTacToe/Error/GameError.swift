//
// GameError.swift
// LLD
//

enum GameError: Error {
    case invalidMove
    case maxPlayerReached
    case gameHasntStarted
    case gameIsFinished
    case PlayersMissing
    
    var description: String {
        switch self {
        case .invalidMove: "Invalid move"
        case .gameHasntStarted: "Game has not started"
        case .gameIsFinished: "Game is finished, Restart the game"
        case .maxPlayerReached: "Max player reached"
        case .PlayersMissing: "Players missing"
        }
    }
}
