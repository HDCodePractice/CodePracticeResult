import SwiftUI
enum Bullet{
    case Big
    case Small
    
    func getPower()->Int{
        switch self{
        case .Big:
            return 5
        case .Small:
            return 1
        }
    }
}
