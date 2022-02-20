//
//  CalculaterBrain.swift
//  Calculater
//
//  Created by 老房东 on 2022-02-20.
//

import Foundation

enum CalculaterBrain{
    case left(String) // 10
    case leftOp(left: String, op: CalculaterButtonItem.Op) // 10 +
    case leftOpRight(left:String,op: CalculaterButtonItem.Op,right:String) // 10 + 20
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
    
    func apply(item: CalculaterButtonItem) -> CalculaterBrain{
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

    private func applyOp(op: CalculaterButtonItem.Op) -> CalculaterBrain{
        switch self {
        case .left(let left):
            return CalculaterBrain.leftOp(left: left, op: op)
        case .leftOp(let left, _):
            return CalculaterBrain.leftOp(left: left, op: op)
        case .leftOpRight(let left, let oldop, let right):
            if op == .equal{
                return CalculaterBrain.leftOp(left: right, op: oldop)
            }else{
                return CalculaterBrain.leftOp(left: "\(left)\(oldop.rawValue)\(right)", op: op)
            }
        case .error:
            return self
        }
    }
    
    private func applyNumber(num : Int) -> CalculaterBrain{
        switch self {
        case .left(let string):
            return CalculaterBrain.left("\(string)\(num)")
        case .leftOp(let left,let op):
            return CalculaterBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return CalculaterBrain.leftOpRight(left: left, op: op, right: "\(right)\(num)")
        case .error:
            return self
        }
    }
}

