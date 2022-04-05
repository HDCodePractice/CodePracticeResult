//
//  datamodel.swift
//  weiqi
//
//  Created by cc on 2022-03-26.
//

import Foundation

enum ChessItem:String{
    case white = "white"
    case black = "black"
    case nothing = ""
}

extension ChessItem{

    var isHidden:Bool{
        if self == .nothing{
            return true
        }
        return false
    }
    
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



struct GridItem: Identifiable,Hashable{
   let id = UUID()
   var background : GridBackGround
   var chess : ChessItem
}

enum GridBackGround: String{
    case TopLeft = "TopLeft"
    case Top = "Top"
    case TopRight = "TopRight"
    case Left = "Left"
    case Mid = "Mid"
    case Right = "Right"
    case BottomLeft = "BottomLeft"
    case Bottom = "Bottom"
    case BottomRight = "BottomRight"
    case MidDot = "MidDot"
}

