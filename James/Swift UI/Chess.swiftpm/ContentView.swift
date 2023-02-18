import SwiftUI

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
