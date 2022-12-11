import SwiftUI

enum Symbol{
    case boat
    case fire
    case square
    
    var name : String{
        switch self{
        case .boat:
            return "sun.max"
        case .fire:
            return "flame.fill"
        case .square:
            return "square.fill"
        }
    }
    
    
}




