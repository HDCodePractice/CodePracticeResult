//
//  File.swift
//  go
//
//  Created by Bernie Zhang on 3/21/22.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var background : GridBackGround
    var go : GoItem
}

enum GridBackGround{
    case bottom
    case bottomLeft
    case bottomRight
    case left
    case mid
    case midDot
    case right
    case top
    case topLeft
    case topRight
}

enum GoItem: String{
    
    case white = "circle"
    case black = "circle.fill"
    case nothing = ""
}

extension GoItem{
    var isHidden: Bool{
        if self == .nothing{
        return true
        }
        return false
    }
    var nextGo: GoItem{
        switch self{
        case .white:
            return .black
        case .black:
            return .nothing
        default:
            return .white
        }
    }
}

extension GridBackGround{
    var IMG:String{
        switch self {
        case .bottom:
            return "bottom"
        case .bottomLeft:
            return "bottomLeft"
        case .bottomRight:
            return "bottomRight"
        case .left:
            return "left"
        case .mid:
            return "mid"
        case .midDot:
            return "midDot"
        case .right:
            return "right"
        case .top:
            return "top"
        case .topLeft:
            return "topLeft"
        case .topRight:
            return "topRight"
        }
    }
}
