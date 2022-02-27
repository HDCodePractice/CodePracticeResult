//
//  CalculatorBrain.swift
//  calculatorApp
//
//  Created by Lei Zhou on 2/20/22.
//

import Foundation

enum CalculatorBrain {
    case left(String)
    case leftOp(left:String,op: CalculatorButtonItem.Op)
    case leftOpRight(left:String,op:CalculatorButtonItem.Op,right:String)
    case error
    
    var output: String {
        let result: String
        switch self {
        case .left(let left):
            result = left
        case .leftOp(left: let left, op: _):
            result = left
        case .leftOpRight(left: _, op: _, right: let right):
            result = right
        case .error:
            result = "ERROR"
        }
        return result
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain {
        switch item {
        case .digit(let num):
            return applyNumber(num: num)
        case .op(let op):
            return applyOp(op: op)
        case .dot:
            return self
        case .command(let cmd):
            return self
        
        }
    }
    
    private func applyOp(op: CalculatorButtonItem.Op) -> CalculatorBrain {
        switch self {
            case .left(let left):
                return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOp(left: let left, op: _):
            return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOpRight(left: let left, op: let oldOp, right: let right):
            if op == .equal {
                return CalculatorBrain.leftOp(left: right, op: oldOp)
            }else {
                return CalculatorBrain.leftOp(left: left, op: op)
            }
 
        case .error:
            return self
        }
    }
    
    private func applyNumber(num : Int) -> CalculatorBrain{
        switch self {
        case .left(let left):
            return CalculatorBrain.left("\(left)\(num)")
        case .leftOp(left: let left, op: let op):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(left: let left, op: let op, right: let right):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(left)\(num)")
        case .error:
            return self
        }
    }

}

