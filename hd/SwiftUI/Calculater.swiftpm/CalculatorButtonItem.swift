//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by 老房东 on 2022-02-13.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    enum Op:String{
        case plus = "+"
        case minus = "-"
        case multiply = "x"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command:String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case command(Command)
    case op(Op)
}

extension CalculatorButtonItem{
    var title: String{
        switch self{
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .command(let command):
            return command.rawValue
        case .op(let op):
            return op.rawValue
        }
    }
    
    var background: Color{
        switch self {
        case .digit(_):
            return .yellow
        case .dot:
            return .red
        case .command(_):
            return .green
        case .op(_):
            return .blue
        }
    }
    
    var width : CGFloat {
        if self == .digit(0) {
            return 142
        }
        return 66
    }
    
    var height : CGFloat {
        return 66
    }
}

extension CalculatorButtonItem: Hashable{}
