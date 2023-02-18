//
//  DataModel.swift
//  Oo
//
//  Created by sunny on 2022-03-27.
//

import Foundation
import SwiftUI

struct GridItem:Hashable,Identifiable{
    let id = UUID()
    var background : Background
    var go : Go
}


enum Background{
    case top
    case topLeft
    case topRight
    case left
    case right
    case mid
    case midDot
    case bottom
    case bottomLeft
    case bottomRight
}

enum Go{
    case white
    case black
    case nothing
}

extension Background{
    var name:String{
        switch self {
        case .top:
            return "Top"
        case .topLeft:
            return "TopLeft"
        case .topRight:
            return "TopRight"
        case .left:
            return "Left"
        case .right:
            return "Right"
        case .mid:
            return "Mid"
        case .midDot:
            return "MidDot"
        case .bottom:
            return "Bottom"
        case .bottomLeft:
            return "BottomLeft"
        case .bottomRight:
            return "BottomRight"
        }
    }
}
