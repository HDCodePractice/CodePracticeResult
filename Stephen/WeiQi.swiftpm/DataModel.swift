//
//  DataModel.swift
//  WeiQi
//
//  Created by stephen on 27/3/2022.
//

import Foundation
import SwiftUI

struct GridItem:Identifiable, Hashable{
    let id = UUID()
    var background: Background
    var go: Go
}


enum Go{
    case white
    case black
    case nothing
}

enum Background{
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

extension Background{
    var name: String{
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

extension Go{
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

extension Go{
    var nextGo:Go{
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        case .nothing:
            return .black
        }
    }
}
