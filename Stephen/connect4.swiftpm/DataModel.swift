//
//  DataModel.swift
//  connect4
//
//  Created by stephen on 3/4/2022.
//

import Foundation
import SwiftUI

struct GridItem:Identifiable, Hashable{
    let id = UUID()
    var background: Background
    var connect4: Connect4
}


enum Connect4:String{
 case green
 case black
 case greenWin
 case blackWin
 case nothing
}

enum Background{
    case bottomLeft
    case bottomRight
    case mid
    case topLeft
    case topRight
}

extension Background{
    var name: String{
        switch self {
        case .bottomLeft:
            return "bottomLeft"
        case .bottomRight:
            return "bottomRight"
        case .mid:
            return "mid"
        case .topLeft:
            return "topLeft"
        case .topRight:
            return "topRight"
        }
    }
    
}

extension Connect4{
    var color:Color{
        switch self {
        case .green:
            return .green
        case .black:
            return .black
        case .nothing:
            return .clear
        case .greenWin:
            return .brown
        case .blackWin:
            return .gray
        }
    }
}

extension Connect4{
    var nextMove: Connect4{
        switch self {
        case .green:
            return .green
        case .black:
            return .black
        case .nothing:
            return .green
        case .greenWin:
            return .green
        case .blackWin:
            return .black
        }
    }
}
