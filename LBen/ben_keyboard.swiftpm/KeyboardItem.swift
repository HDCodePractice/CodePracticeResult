//
//  File.swift
//  ben_keyboard
//
//  Created by Lei Zhou on 3/5/22.
//

import Foundation
import SwiftUI

enum KeyboardItem : Hashable{
    enum FunctionKey : String{
        case numberSwitch =  "textformat.123"
        case speakerSwitch = "mic"
        case deleteButton = "delete.backward"
        case shiftButton = "shift"
        case languageSwitch = "globe"
        case keyboardButton = "keyboard"
    }

    
    
    case letter(String,String)
    case functionKey(FunctionKey)
    case spaceButton
    case returnButton
}
extension KeyboardItem {
    var title: [String] {
        switch self {
        case .letter(let upper, let lower):
            return [upper,lower]
        case .functionKey(let iconName):
            return [iconName.rawValue]
        case .spaceButton:
            return [""]
        case .returnButton:
            return ["return"]
        }
    }
    var color : Color {
        switch self {
        case .functionKey(_), .returnButton:
            return .teal
        default:
            return .gray
        }
    }
    var height : CGFloat {
        return 55
    }
    var width : CGFloat {
        if (self == .spaceButton) {
           return 110
        }
        if (self == .returnButton || self == .functionKey(.numberSwitch) ||  self == .functionKey(.keyboardButton)) {
            return 44
        }
        return 22
    }
}
