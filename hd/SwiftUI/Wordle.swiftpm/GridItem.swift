import SwiftUI

struct GridItem: Identifiable{
    let id = UUID()
    var letter: String
    var status: ItemStatus
}

enum ItemStatus{
    case empty
    case gray
    case green
    case yellow
    case inComplete
}

extension ItemStatus{
    var background : Color{
        switch self{
        case .empty,.inComplete:
            return .white
        case .gray:
            return .gray
        case .yellow:
            return .yellow
        case .green:
            return .green
        }
    }
}
