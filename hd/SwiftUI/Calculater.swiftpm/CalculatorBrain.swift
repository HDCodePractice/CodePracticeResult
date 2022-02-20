//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 老房东 on 2022-02-20.
//

import Foundation

enum CalculatorBrain{
    case left(String) // 10
    case leftOp(left: String, op: CalculatorButtonItem.Op) // 10 +
    case leftOpRight(left:String,op: CalculatorButtonItem.Op,right:String) // 10 + 20
    case error
    
    var output: String{
        let result: String
        switch self {
        case .left(let left):
            result = left
        case .leftOp(let left , _):
            result = left
        case .leftOpRight(_, _, let right):
            result = right
        case .error:
            return "ERROR"
        }
        return result
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain{
        switch item{
        case .digit(let num):
            return applyNumber(num: num)
//        case .dot:
        case .op(let op):
            return applyOp(op: op)
//        case .command(let command):
        default:
            return self
        }
    }

    private func applyOp(op: CalculatorButtonItem.Op) -> CalculatorBrain{
        switch self {
        case .left(let left):
            return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOp(let left, _):
            return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOpRight(let left, let oldop, let right):
            if op == .equal{
                return CalculatorBrain.leftOp(left: right, op: oldop)
            }else{
                return CalculatorBrain.leftOp(left: "\(left)\(oldop.rawValue)\(right)", op: op)
            }
        case .error:
            return self
        }
    }
    
    private func applyNumber(num : Int) -> CalculatorBrain{
        switch self {
        case .left(let string):
            return CalculatorBrain.left("\(string)\(num)")
        case .leftOp(let left,let op):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(right)\(num)")
        case .error:
            return self
        }
    }
}

