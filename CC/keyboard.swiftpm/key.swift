//
//  File.swift
//  keyboard
//
//  Created by cc on 2022-03-06.
//

import SwiftUI

enum key:Hashable{
    enum Symbol:String{
        case at = "@"
        case hash = "#"
        case dollar = "$"
        case and = "&"
        case asterisk = "*"
        case leftparenthese = "("
        case rightparenthese = ")"
        case singlequote = "'"
        case quote = "\""
        case percent = "%"
        case minus = "-"
        case plus = "+"
        case equal = "="
        case divide = "/"
        case semicolon = ";"
        case colon = ":"
        case exclamation = "!"
        case comma = ","
        case period = "."
        case question = "?"
        case change = "123"
    }
    case letter(String)
    case symbol(Symbol)
    
}
