//
// Cell.swift
// LLD

import Foundation
    
class Cell {
    var symbol: Symbol = .empty
    var isFilled: Bool { symbol != .empty }
}
