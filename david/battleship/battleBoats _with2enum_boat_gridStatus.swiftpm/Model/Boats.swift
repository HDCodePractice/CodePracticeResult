import SwiftUI

enum Boat{
    case A
    case B
    case C
    case D
    
    func boatNumber()->Int{
        switch self{
        case .A:
            return 5
        case .B:
            return 4
        case .C:
            return 3
        case .D:
            return 2
        }
    }
    
    func getColor()->Color{
        switch self{
        case .A:
            return .red
        case .B:
            return .yellow
        case .C:
            return .blue
        case .D:
            return .green
        }
    }
    
    func getImage()->String{
        switch self{
        case .A:
            return "a.circle"
        case .B:
            return "b.circle"
        case .C:
            return "c.circle"
        case .D:
            return "d.circle"
        }
        
    }
    
//    func boatStatus()->String{
//        var boatStatus = ""
//        return boatStatus
//        
//    }
    
}
