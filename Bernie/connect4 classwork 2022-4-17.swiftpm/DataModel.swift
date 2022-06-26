//
//  File.swift
//  connect4 classwork 2022-4-17
//
//  Created by Bernie Zhang on 4/17/22.
//

import Foundation
import SwiftUI

struct GridItem : Identifiable,Hashable{
    var id = UUID()
    var connect : Connect
    var column : Int
    var row : Int

}

enum Connect {
    case green
    case black
    case greenWin
    case blackWin
    case nothing
    
    var color:Color{
        switch self {
        case . green, . greenWin:
            return .green
        case .black, .blackWin:
            return .black
        case .nothing:
            return .white
        }
    }
    
    var imageName:String{
        switch self {
        case . green, .black, .nothing:
            return "circle.fill"
        case . greenWin, .blackWin:
            return "star.fill"
        }
    }
}
