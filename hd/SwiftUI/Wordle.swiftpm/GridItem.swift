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
            case .notused:
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
        case .notused:
            return .black
        default:
            return .white
        }
    }
    
    var boardColor:Color{
        let notused = Color(red: 212/255, green: 214/255, blue: 208/255)
        switch status{
        case .notused:
            return notused
        default:
            return .black
        }
    }
}
