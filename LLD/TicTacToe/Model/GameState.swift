//
// State.swift
// LLD
//

    
enum GameState {
    case inProgress
    case finished(winner: Player)
    case waitingToStart
    case draw
}
