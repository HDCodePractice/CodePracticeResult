import SwiftUI

struct GridItem: Identifiable,Hashable {
    var id = UUID()
    var connect: Connect
}

enum Connect {
    case green
    case black
    case greenWin
    case blackWin
    case nothing
}

extension Connect {
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
    
    var imageName: String{
        switch self {
        case . green, .black, .nothing:
            return "circle.fill"
        case . greenWin, .blackWin:
            return "star.fill"
        }
    }
}

