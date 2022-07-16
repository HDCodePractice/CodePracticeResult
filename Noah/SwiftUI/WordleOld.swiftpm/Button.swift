import SwiftUI

struct ButtonItem: Hashable {  
    var letter: String = ""
    var cont: ButtonUtil
    var color: ButtonColor
//    var body: some View {
//        Text(letter == "" ? (cont == .delete ? "delete" : "enter") : letter)
//            .foregroundColor(.primary)
//            .padding()
//            .background(color.background)
//            .cornerRadius(10)
//            .onTapGesture {
//                
//            }
//    }
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
