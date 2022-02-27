//
//  File.swift
//  calculatorApp
//
//  Created by Lei Zhou on 2/13/22.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem : Hashable {
    enum Op:String {
        case plus = "+"
        case minus = "-"
        case multiply = "x"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command:String {
        case clear = "AC"
        case opposite = "+/-"
        case percent = "%"
    }
    
    
    
    case digit(Int)
    case dot
    case command(Command)
    case op(Op)
    
}

extension CalculatorButtonItem {
    var title : String {
        switch self {
        case .digit(let value) : return String(value)
        case .dot:
            return "."
        case .command(let command):
            return command.rawValue
        case .op(let op):
            return op.rawValue
        }
    }
    var background : Color {
        switch self {
        case .digit(_) : return .gray
        case .dot:
            return .gray
        case .command(_):
            return .yellow
        case .op(_):
            return .orange
        }
        }
    var height : CGFloat {
        return 66
    }
    var width : CGFloat {
        if (self == .digit(0)) {
           return 142
        }
        return 66
    }
}

