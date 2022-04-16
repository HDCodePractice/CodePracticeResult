//
//  DataModel.swift
//  Checker
//
//  Created by Qianji Yao on 2022/3/26.
//

import Foundation
import SwiftUI

//struct GridItem: Identifiable,Hashable{
//    let id = UUID()
//    var background : GridBackGround
//    var checker : CheckerItem
//}
//
//enum GridBackGround{
//    case white
//    case black
//}
//
//enum CheckerItem:String{
//    case white = "circle"
//    case black = "circle.fill"
//    case whiteKing = "crown"
//    case blackKing = "crown.fill"
//    case nothing = ""
//}
//
//extension CheckerItem{
//    var isHidden:Bool{
//        if self == .nothing{
//            return true
//        }
//        return false
//    }
//
//    var nextchecker: CheckerItem{
//        switch self {
//        case .white:
//            return  .whiteKing
//        case .whiteKing:
//            return .black
//        case .black:
//            return .blackKing
//        case .blackKing:
//            return .nothing
//        default:
//            return  .white
//        }
//    }
//}
//
//extension GridBackGround{
//    var color: Color{
//        switch self {
//        case .white:
//            return .white
//        case .black:
//            return .brown
//        }
//    }
//}
import SwiftUI

enum Connect: String {
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
