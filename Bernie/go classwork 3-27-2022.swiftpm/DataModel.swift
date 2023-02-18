//
//  File.swift
//  go classwork 3-27-2022
//
//  Created by Bernie Zhang on 3/27/22.
//

import Foundation
import SwiftUI

struct GridItem:Hashable, Identifiable{
    let id = UUID()
    var background : Background
    var go: Go
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


extension Go{
    var nextGo: Go{
        switch self {
        case .white:
            return .black
        case .black:
            return .nothing
        case .nothing:
            return .white
        }
    }
    var color:Color{
        switch self {
        case .white:
            return .white
        case .black:
            return .black
        case .nothing:
            return .clear
        }
        
    }
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
