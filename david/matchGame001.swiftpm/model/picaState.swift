import SwiftUI

enum PicState{
    case back 
    case front 
    case disapear
    
    func getPic()->String{
        switch self{
        case .back:
            return  "timelapse"
        case .front:
            return "front"
        case .disapear:
            return ""
        }
    }
}
