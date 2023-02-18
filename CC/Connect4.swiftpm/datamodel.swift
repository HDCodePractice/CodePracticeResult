//
//  File.swift
//  Connect4
//
//  Created by cc on 2022-04-03.
//

import Foundation

enum ChessItem:String{
    case white = "star.circle"
    case black = "star.circle.fill"
    case nothing = "circle"
}

extension ChessItem{
    var nextChess : ChessItem{
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        default:
            return .black
        }
    }
}

struct GrideItem: Identifiable,Hashable{
    let id = UUID()
    var chess : ChessItem

}

enum player:String{
    case white = "white"
    case black = "black"
}
extension player{
    var nextplayer:player{
        switch self {
        case .white:
            return .black
        case .black:
            return .white

        }
    }
}
