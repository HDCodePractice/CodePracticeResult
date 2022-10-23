import SwiftUI

struct Grid{
    var x: Int
    var y: Int
    var status : GridStatus = .clicked
}

enum GridStatus{
    case empty
    case clicked
    
    var color:Color{
        switch self{
            case .clicked:
            return .cyan
            case .empty:
            return .white
        }
    }
}
