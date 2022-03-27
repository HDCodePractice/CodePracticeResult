//
//  File.swift
//  BenChessApp
//
//  Created by Lei Zhou on 3/20/22.
//

import Foundation
import SwiftUI

enum GridBackGround {
    case black
}

enum ChessItem: String{
    case white = "circle"
    case black = "circle.fill"
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
        case .black :
            return .white
        case .white :
            return .black
        default :
            return .white
        }
    }
    var isSwitch: Bool {
        switch self {
        case .black:
            return false
        case .white:
            return true
        default:
            return true
        }
    }
}

extension GridBackGround {
    var color: Color {
        switch self {
            case .black:
                return .brown
        }
        
    }
}
