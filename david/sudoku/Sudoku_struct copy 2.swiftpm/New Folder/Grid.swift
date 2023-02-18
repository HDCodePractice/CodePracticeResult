import SwiftUI

struct Grid{
    var num = 0
    var x: Int
    var y: Int
    var status : GridStatus = .empty
}

enum GridStatus{
    case empty
    case clicked
    case related
    
    var color:Color{
        switch self{
        case .clicked:
            return .cyan
        case .empty:
            return .white
        case .related:
            return .init( red: 215, green: 227, blue: 231, opacity: 0.001)
        }
    }
}
