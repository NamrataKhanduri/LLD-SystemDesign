//
// HorizontalWinningStrategy.swift
// LLD
//
    

struct HorizontalWinningStrategy: WinningStrategy {
    func isWinning(on board: Board, last move: Move) -> Bool {
        let symbol = board.cells[move.row][move.column].symbol
        let size = board.cells.count
        return (0..<size).allSatisfy { board.cells[move.row][$0].symbol == symbol }
    }
}
