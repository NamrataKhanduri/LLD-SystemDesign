//
// Symbol.swift
// LLD
//
//
import Foundation

enum Symbol: CaseIterable {
    
    case cross
    case circle
    case empty
    
    var symbol: String {
        switch self {
        case .cross:  "❌"
        case .circle:  "⭕"
        case .empty:  "  "
        }
    }
    
}
