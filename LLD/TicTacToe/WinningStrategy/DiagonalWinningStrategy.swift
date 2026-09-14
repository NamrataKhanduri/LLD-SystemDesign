//
// DiagonalWinningStrategy.swift
// LLD
//

    

struct DiagonalWinningStrategy: WinningStrategy {
    func isWinning(on board: Board, last move: Move) -> Bool {
        let size = board.cells.count
        let symbol  = board.cells[move.row][move.column].symbol
        if symbol == .empty {
            return false
        }
        var diagonalAllSameSymbol = true
        for i in 0..<size {
            if board.cells[i][i].symbol != symbol {
                diagonalAllSameSymbol = false
            }
        }
        if diagonalAllSameSymbol {
            return true
        }
        diagonalAllSameSymbol = true
        
        for i in 0..<size {
            if board.cells[i][size - 1 - i].symbol != symbol {
                diagonalAllSameSymbol = false
            }
        }
        return diagonalAllSameSymbol
    }
}
