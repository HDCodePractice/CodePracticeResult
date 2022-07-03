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
    var textColor: Color = .primary
    
    var background: Color {
        switch status {
        case .empty, .incomplete:
            return .black
        case .wrong:
            return .gray
        case .partial:
            return .yellow
        case .right:
            return .green
        }
    }
}



