//
//  File.swift
//  tryagain
//
//  Created by cc on 2022-02-19.
//
import SwiftUI

enum CalculateItem:Hashable{
    enum Command:String {
        case clear = "AC"
        case minus = "+/-"
        case percent = "%"
    }
    enum Op:String{
        case divide = "/"
        case mult = "*"
        case minus = "-"
        case plus = "+"
        case equal = "="
    }
    
    case digit(Int)
    case dot
    case command(Command)
    case op(Op)
    case res
    
}
extension CalculateItem{
    var title : String{
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let  op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        case .res:
            return "0"
        }
    }
    
    var color: Color{
        switch self {
        case .command(_):
            return .secondary
        case .op(_):
            return .red
        default :
            return .blue
            
        }
    }
    
    var width: CGFloat{
        let width = 66
        if self == .digit(0){
            return CGFloat(width*2+10)
        }
        return CGFloat(width)
    }
    
    var height: CGFloat{
        return 66
    }
}

