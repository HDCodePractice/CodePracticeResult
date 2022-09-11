import SwiftUI

enum GridState{
    case empty
    case hideBoat
    case destroyBoat
    case afterAttac
    
    func getImage(boat:Boat)->String{
        switch self{
        case .empty:
            return ""
        case .hideBoat:
            return boat.getImage()
        case .destroyBoat:
            return "burst"
        case .afterAttac:
            return "x.circle"
        }
    }
    
    func getFile()->String{
        
        switch self{
        case .empty:
            return "empty"
        case .hideBoat:
            return "hideBoat"
        case .destroyBoat:
            return "destroied"
        case .afterAttac:
            return "afterAttac"
        }
    }
    
}
