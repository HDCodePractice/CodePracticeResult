//
//  File.swift
//  caculatorFormula
//
//  Created by Sunny on 2022/2/13.
//

import Foundation
import SwiftUI

enum CaculatorButtonItem {
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

extension CaculatorButtonItem{
    var title: String{
        switch self{
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case.command(let command):
            return command.rawValue
        case .op(let op):
            return op.rawValue
        }
    }
    
    var background: Color{
        switch self {
        case .digit(_):
            return .red
        case .dot:
            return .gray
        case .command(_):
            return .gray
        case .op(_):
            return .orange
        }
    }
    
    var width : CGFloat {
        if self == .digit(0) {
            return 132
        }
        return 66
    }
    var height : CGFloat {
        return 66
    }
}
extension CaculatorButtonItem: Hashable{}
