import SwiftUI
enum Checker:String {
    case white = "white"
    case black = "black"
    case whiteKing = "whiteKing"
    case blackKing = "blackKing"
    case nothing = "nothing"

    func nextChecker() -> Checker{
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
    }
    }
    var color:Color{
        switch self{
        case .white, .whiteKing:
            return .white
        case . black, . blackKing:
            return . black
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
enum Grid: String {
    case light = "light"
    case dark = "dark"
    var color: Color {
        switch self {
        case .light:
            return Color(red: 1/255, green: 255/255, blue: 1/255)
        case .dark:
            return Color(red: 1/255, green: 55/255, blue: 1/255)
        }
        
    }
    
    
}
struct GridItem: Identifiable, Hashable{
    let id:UUID = UUID()
    var gridColor: Grid
    var checker: Checker
}
struct ViewModel {
    var grid :[[GridItem]]=[[
        GridItem(gridColor: .light, checker: .nothing),
        GridItem(gridColor: .light, checker: .nothing)
    ]]
}

