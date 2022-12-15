import SwiftUI

enum GridStatus{
    case empty
    case hideShip
    case destroiedShip
    case attactted
    
    func getImage()->String{
        switch self{
        case .empty:
            return ""
        case .hideShip:
            return "Pork"
        case .destroiedShip:
            return "burst"
        case .attactted:
//            return "pork"
            return "x.circle"
        }
    }
    
    func getFile()->String{
        
        switch self{
        case .empty:
            return "empty"
        case .hideShip:
            return "hideShip"
        case .destroiedShip:
            return "destroiedShip"
        case .attactted:
            return "attactted"
        }
    }
}
