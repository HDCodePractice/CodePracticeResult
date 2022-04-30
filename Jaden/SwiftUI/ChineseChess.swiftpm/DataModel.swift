import SwiftUI

struct GridItem : Identifiable, Hashable{
    var id = UUID()
    var connect : Connect

}

enum Connect {
    case pawn
    case bishop
    case knight
    case rook
    case queen
    case king
    case nothing
    var nextConnect: String{
        switch self {
        case .nothing:
            return  "pawn"
        case .pawn:
            return "bishop"
        case .bishop:
            return "knight"
        case .knight:
            return "rook"
        case .rook:
            return "queen"
        case .queen:
            return "king"
        case .king:
            return "Mid2"
        default:
            return "Mid2"
        }
    }
    var imageName:String{
        switch self {
        case .pawn:
            return "pawn"
        case .bishop:
            return "bishop"
        case .knight:
            return "knight"
        case .rook:
            return "rook"
        case .queen:
            return "queen"
        case .king:
            return "king"
        case .nothing:
            return "Mid2"
        }
    }
}
