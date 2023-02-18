import SwiftUI
import Foundation

enum Pic{
    case Close
    case Open
    case Match
    func getName() -> String {
        switch self {
        case .Close:
            return "Closed"
        case .Open:
            return "Opened"
        default:
            return "Match"
            
        }
    }
    
    func getColor()->Color{
        switch self{
        case .Close:
            return .blue
        case .Open:
            return  .clear
        default:
            return .clear
        }
    }
    func getOpacity() -> Double {
        switch self{
        case .Close:
            return 1.0
        case .Open:
            return  0.0
        default:
            return 0.0
        }
    }
    
} 


