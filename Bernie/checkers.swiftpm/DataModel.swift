//
//  File.swift
//  checkers
//
//  Created by Bernie Zhang on 3/19/22.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var background : GridBackGround
    var chess : ChessItem
}

enum GridBackGround{
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

extension ChessItem{
    var isHidden:Bool{
        if self == .nothing{
        return true
        }
        return false
    }
    var nextChess: ChessItem{
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        default:
            return .white
        }
    }
}

extension GridBackGround{
    var color:Color{
        switch self{
        case .white:
            return .white
        case .black:
            return .brown
        }
    }
}
