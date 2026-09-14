//
// Board.swift
// LLD
//

    
import Foundation

class Board {
    
    
    var cells: [[Cell]]
    
    init(_ size: Int) {
        cells = (0..<size).map { _ in
            (0..<size).map { _ in
                Cell()
            }
        }
    }
    
    func isFull() -> Bool {
        cells.joined().allSatisfy(\.isFilled)
    }
    
    func reset() {
        cells.forEach { $0.forEach { $0.symbol = .empty } }
    }
}

