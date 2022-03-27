//
//  File.swift
//  BenChessApp
//
//  Created by Lei Zhou on 3/20/22.
//

import Foundation
import SwiftUI

enum GridBackGround {
    case white
    case black
    
}

enum ChessItem: String{
    case white = "circle"
    case black = "circle.fill"
    case whiteKing = "person"
    case blackKing = "person.fill"
    case nothing = ""

}

struct GridItem: Identifiable,Hashable {
    let id = UUID()
    var background: GridBackGround
    var chess: ChessItem
}

extension ChessItem {
    var isHidden: Bool{
        if self == .nothing {
            return true
        } else {
            return false
        }
    }
    var nextChess : ChessItem {
        switch self {
        case .black:
            return .blackKing
        case .white:
            return .whiteKing
        case .whiteKing:
            return  .black
        case .blackKing:
            return  .white
        default:
            return .black
            
        }
    }
}

extension GridBackGround {
    var color: Color {
        switch self {
            case .white:
                return .white
            case .black:
                return .brown
        }
        
    }
}
