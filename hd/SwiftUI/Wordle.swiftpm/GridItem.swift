import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var letter: String
    var status: Status
}

extension GridItem{
    var backgroundColor:Color{
        let notused = Color.white
        let gray = Color.gray
        let green = Color.green
        let yello = Color.yellow
        
        switch status {
            case .empty,.input:
                return notused
            case .gray:
                return gray
            case .green:
                return green
            case .yellow:
                return yello
            }
    }
    
    var foregroundColor:Color{
        switch status{
        case .empty,.input:
            return .black
        default:
            return .white
        }
    }
    
    var boardColor:Color{
        switch status{
        case .empty:
            return .gray
        case .input:
            return .red
        default:
            return .clear
        }
    }
}
