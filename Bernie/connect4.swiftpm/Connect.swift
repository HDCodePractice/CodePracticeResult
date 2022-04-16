//
//  File.swift
//  connect4
//
//  Created by Bernie Zhang on 4/3/22.
//

import Foundation
import SwiftUI

enum Connect{
    
    case green
    case greenWin
    case black
    case blackWin
    case nothing
    
    var color:Color{
        switch self{
        case .green,.greenWin:
            return .green
        case .black,.blackWin:
            return .black
        case .nothing:
            return .white
        }
    }
    
    var image:String{
        switch self{
        case .black,.green,.nothing:
            return "circle.fill"
        case .blackWin, .greenWin:
            return "star.circle.fill"
        }
    }
}
