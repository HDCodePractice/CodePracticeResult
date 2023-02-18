import SwiftUI

struct Grid{
    var symbol: Symbol
    var x: Int
    var y: Int
    var gridColor: Color
    var status : GridStatus = .unclicked
}


enum GridStatus{
    case unclicked
    case clicked
    case clickedOnTarget
    case showingBoat
    
    var symbol : Symbol{
        switch self{
        case .unclicked:
            return .square
        case .clicked:
            return .square
        case .clickedOnTarget:
            return .fire
        case .showingBoat:
            return .boat
        }
    }
}
