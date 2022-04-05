import SwiftUI

struct GridItem : Identifiable, Hashable{
    var id = UUID()
    var connect : Connect
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
    var nextConnect: Connect{
        switch self {
        case .nothing:
            return  .green
        case .green:
            return .black
        case .black:
            return .nothing
        default:
            return .nothing
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
