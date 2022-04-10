//
//  File.swift
//  Connect4App
//
//  Created by Lei Zhou on 4/3/22.
//

import Foundation
import SwiftUI


enum ConnectItem {
    case black
    case green
    case blackWin
    case greenWin
    case nothing
    
    var color : Color{
        switch self {
        case .black, .blackWin:
            return .black
        case .green, .greenWin:
            return .green
        case .nothing:
            return .white

        }
    }
    var image : String {
        switch self {
        case .black, .green, .nothing :
            return "circle.fill"
        case .greenWin, .blackWin:
            return "start.circle.fill"
        }
    }
}

