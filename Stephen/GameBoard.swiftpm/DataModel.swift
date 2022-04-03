//
//  File.swift
//  GameBoard
//
//  Created by stephen on 20/3/2022.
//

import Foundation
import SwiftUI

struct GridItem:Identifiable, Hashable{
    let id = UUID()
    var background : GridBackGround
    var chess : ChessItem
}

enum GridBackGround{
    case white
    case black

}

enum ChessItem: String{
    var isHidden:Bool{
        if self == .nothing{
            return true
        }
        return false
    }
    
    case white = "circle"
    case black = "circle.fill"
    case whiteKing = "person"
    case blackKing = "person.fill"
    case nothing = ""
    
    var nextChess: ChessItem{
        switch self{
        case .black:
            return .white
        case .white:
            return .black
        case .whiteKing:
            return .blackKing
        case .blackKing:
            return .whiteKing
        default:
            return .white
        }
    }
}


extension GridBackGround{
    var color:Color{
      switch self {
      case .white:
          return .white
      case .black:
          return .brown
      }
  }
}
