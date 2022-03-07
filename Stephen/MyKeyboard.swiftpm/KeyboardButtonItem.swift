//
//  File.swift
//  MyKeyboard
//
//  Created by stephen on 6/3/2022.
//

import Foundation
import SwiftUI

enum KeyboardButtonItem{
    enum Command:String{
        case Return = "return"
        case number = "123"
        case clear = "delete"
        case shift = "shift"
        case space = "space"
        // 希望是能直接放置图片在这里，而不是文字
        case language = "Global"
        case hide = "Hide"
    }
    
        
    case letter(String)
    case dot
    case comma
    case command(Command)
}
    


extension KeyboardButtonItem{
    var title: String{
        switch self{
        case .letter(let value):
            return String(value)
        case .dot:
            return "."
        case .command(let command):
            return command.rawValue
        case .comma:
            return ","
        }
    }
    
    var background: Color{
        switch self {
        case .letter(_):
            return .gray
        case .dot:
            return .gray
        case .command(_):
            return .gray
        case .comma:
            return .gray
        }
    }
    
    var width : CGFloat{
        if self == .command(.space){
            return 142
        }else{
            return 66
        }
    }
    
    var height : CGFloat{
        return 66
    }
}

extension KeyboardButtonItem: Hashable{}
