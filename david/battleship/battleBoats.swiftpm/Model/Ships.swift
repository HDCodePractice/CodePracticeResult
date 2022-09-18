import SwiftUI

enum Ship{
    case A
    case B
    case C
    case D
    case None
    
    func shipNumber()->Int{
        switch self{
        case .A:
            return 5
        case .B:
            return 4
        case .C:
            return 3
        case .D:
            return 2
        
        case .None:
            return 0
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
        case .None:
            return .clear
        }
    }
    
    func getImage()->String{
        switch self{
        case .A:
            if shipNumber()==0{
                return ""
            }
            return "a"
        case .B:
            return "b.circle"
        case .C:
            return "c.circle"
        case .D:
            return "d.circle"
        case .None:
            return ""
        }
    }
    
}
