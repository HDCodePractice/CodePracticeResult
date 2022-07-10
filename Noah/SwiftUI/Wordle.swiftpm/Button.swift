import SwiftUI

struct ButtonItem: Hashable, Identifiable {
    let id = UUID()
    var letter: String = ""
    var util: ButtonUtil
    var color: ButtonColor
}

extension ButtonColor {
    var background: Color {
        switch self {
        case .notUsed:
            return Color(red: 212/255, green: 214/255, blue: 218/255)
        case .wrong:
            return .gray
        case .partial:
            return .yellow
        case .right:
            return .green
        }
    }
}

enum ButtonUtil {
    case letter
    case delete
    case enter
}

enum ButtonColor {
    case notUsed
    case wrong
    case partial
    case right
}
