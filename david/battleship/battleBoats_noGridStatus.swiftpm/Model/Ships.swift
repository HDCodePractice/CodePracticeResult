import SwiftUI

enum Ship{
    case A
    case B
    case C
    case D
    case H
    case Hitted
    case Z
    
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
        case .H:
            return 1
            case .Hitted:
            return 0
        case .Z:
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
        case .H:
            return .black
        case .Hitted:
            return .white
        case .Z:
            return .clear
        }
    }
    
    func getImage()->String{
        switch self{
        case .A:
            return ""
        case .B:
            return ""
        case .C:
            return ""
        case .D:
            return ""
        case .H:
            return "slowmo"
        case .Hitted:
            return "togglepower"
        case .Z:
            return ""
        }
    }
    
    func shipStatus()->String{
        
        if shipNumber() == 0 {
            return "empty"
        }else {
            return "hide"
        }
    }
}
