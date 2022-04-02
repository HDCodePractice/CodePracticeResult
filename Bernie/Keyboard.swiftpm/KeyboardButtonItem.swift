//
//  File.swift
//  keyboard
//
//  Created by Bernie Zhang on 3/2/22.
//

import Foundation
import SwiftUI

enum KeyboardButtonItem{
    enum Op:String{
        case plus = "+"
        case minus = "-"
        case multiply = "x"
        case divide = "/"
        case equal = "="
    }
    
    enum Command:String{
        case at = "@"
        case sharp = "#"
        case dollar = "$"
        case caret = "^"
        case ampersand = "&"
        case asterisk = "*"
        case leftparenthesis = "("
        case rightparenthesis = ")"
        case apostrophe = "'"
        case quotation = "\"" //双引号 这样打吗？
        case colon = ":"
        case semicolon = ";"
        case exclamation = "!"
        case comma = ","
        case question = "?"
        case fullstop = "."
        case enter = "return"
        case numbers = "123"
        
    }
    
    
    enum Icon {
        case delete
        case shiftfill
        case globe
        case mic
        case keyboardchevrondown
        
        var image: Image {
            switch self {
            case .delete: return Image(systemName: "delete.left")
            case .shiftfill: return Image(systemName: "shift.fill")
            case .globe: return Image(systemName: "globe")
            case .mic: return Image(systemName: "mic")
            case .keyboardchevrondown: return Image(systemName: "keyboard.chevron.compact.down")
            }
        }
    }
    
    case letter(String)
    case digit(Int)
    case command(Command)
    case icon(Icon)
}
