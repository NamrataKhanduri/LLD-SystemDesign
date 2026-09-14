//
// WinningStrategy.swift
// LLD

    

protocol WinningStrategy {
    func isWinning(on board: Board, last move: Move) -> Bool
}
