//
//  DataModel.swift
//  draughtSample
//
//  Created by sunny on 2022-03-20.
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

enum ChessItem:String{
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
}

extension GridBackGround{
    var color: Color{
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        }
    }
}
