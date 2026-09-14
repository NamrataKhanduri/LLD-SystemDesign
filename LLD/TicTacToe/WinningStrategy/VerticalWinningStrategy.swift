//
// VerticalWinningStrategy.swift
// LLD
//
    

struct VerticalWinningStrategy: WinningStrategy {
    func isWinning(on board: Board, last move: Move) -> Bool {
        
        let symbol = board.cells[move.row][move.column].symbol
        let size = board.cells.count
        return (0..<size).allSatisfy { board.cells[$0][move.column].symbol == symbol }
    }
}
