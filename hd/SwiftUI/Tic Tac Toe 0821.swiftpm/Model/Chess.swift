import SwiftUI

enum Chess{
    case X
    case O
    case null
    
    func getImage()->String{
        switch self{
        case .X:
            return "pencil.slash"
        case .O:
            return "circle.fill"
        case .null:
            return "circle.dotted"
        }
    }
    
    func getColor()->Color{
        switch self{
        case .X:
            return .red
        case .O:
            return .orange
        case .null:
            return .clear
        }
    }
    
    func nextPlayer()->Chess{
        if self == .X{
            return .O
        }else {
            return .X
        }
    }
}
