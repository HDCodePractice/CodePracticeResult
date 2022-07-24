import SwiftUI

enum GridStatus {
    case empty
    case incomplete
    case wrong
    case partial
    case right
}

struct GridItem: Identifiable, Hashable { 
    let id = UUID()
    var status: GridStatus
    var text: String
    var textColor: Color = .black
    
    var background: Color {
        switch status {
        case .empty, .incomplete:
            return .white
        case .wrong:
            return Color(red: 212/255, green: 214/255, blue: 218/255)
        case .partial:
            return .yellow
        case .right:
            return .green
        }
    }
}
