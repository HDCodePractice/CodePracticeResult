import SwiftUI
import Foundation

enum GridStatus{
    case Empty
    case Deploy
    case Destroy
    
    func getImageName() -> String {
        switch self {
        case .Empty:
            return "square"
        case .Deploy:
            return "square.fill"
        default:
            return "x.square.fill"
            
        }
    }
    
    
    func getColor()->Color{
        switch self{
        case .Empty:
            return .blue
        case .Destroy:
            return .red
        default:
            return .blue
        }
    }
    func getOpacity() -> Double {
        switch self{
        case .Destroy:
            return 1.0
        default:
            return 0.0
        }
    }
    
} 
