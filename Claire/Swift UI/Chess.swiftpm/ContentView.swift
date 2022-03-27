import SwiftUI

struct ContentView: View{
    var body: some View {
        Image("black")
    }
}


enum Checker:String {
    case white
    case black
    case whiteKing
    case blackKing
    case nothing
    
    func nextChecker()->Checker {
        switch self {
        case .nothing:
            return .white
        case .white:
            return .black
        case .black:
            return .whiteKing
        case .whiteKing:
            return .blackKing
        case .blackKing:
            return .nothing
        default:
            return .nothing
        }
    }
    
    var color:Color{
        switch self {
        case .white, .whiteKing:
            return .white
        case .black, .blackKing:
            return .black
        default:
            return .clear
        }
    }
    
    var imageName:String{
        switch self {
        case .white:
            return "circle"
        case .black:
            return "circle.fill"
        case .whiteKing:
            return "crown"
        case .blackKing:
            return "crown.fill"
        default:
            return ""
        }
    }
}

var checker : Checker = .nothing
