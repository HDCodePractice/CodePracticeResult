import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var background : GridBackGround
    var checker : CheckerItem
}

enum GridBackGround{
    case white
    case black
}

enum CheckerItem:String{
    case white = "circle"
    case black = "circle.fill"
    case whiteKing = "crown"
    case blackKing = "crown.fill"
    case nothing = ""
}

extension CheckerItem{
    var isHidden:Bool{
        if self == .nothing{
            return true
        }
        return false
    }
    
    var nextchecker: CheckerItem{
        switch self {
        case .white:
            return  .whiteKing
        case .whiteKing:
            return .black
        case .black:
            return .blackKing
        case .blackKing:
            return .nothing
        case .nothing:
            return .white
        default:
            return  .nothing
        }
    }
}

extension GridBackGround{
    var color: Color{
        switch self {
        case .white:
            return .white
        case .black:
            return .blue
        }
    }
}
