//
//  File.swift
//  connect4
//
//  Created by Bernie Zhang on 3/29/22.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var background : GridBackGround
    var connet4 : Connect4
}

enum GridBackGround{
    case gray
}

enum Connect4: String{
    
    case green = "circle"
    case greenWin = "star"
    case black = "circle.fill"
    case blackWin = "star.fill"
    case white 
    case nothing = ""
}

extension Connect4{
//    var isHidden: Bool{
//        if self == .nothing{
//        return true
//        }
//        return false
//    }
    var nextConnect4: Connect4{
        switch self{
        case .green:
            return .black
        case .black:
            return .greenWin
        case .greenWin:
            return .blackWin
        case .blackWin:
            return .nothing
        default:
            return .green
        }
    }
    var color:Color{
        switch self {
        case .green:
            return   .green
        case .greenWin:
            return   .green
        case .black:
            return   .black
        case .blackWin:
            return   .black
        case .white:
            return   .white
        case .nothing:
            return .clear
        }
    }
}

extension GridBackGround{
    var color:Color{
        switch self{
        case .gray:
            return .gray
        }
    }
}
