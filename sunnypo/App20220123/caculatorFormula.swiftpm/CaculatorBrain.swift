//
//  CaculatorBrain.swift
//  caculatorFormula
//
//  Created by Sunny on 2022/2/20.
//

import Foundation

enum CaculatorBrain{
    case left(String)
    case leftOp(left: String, op: CaculatorButtonItem.Op)
    case leftOpRight(left: String, op: CaculatorButtonItem.Op,right:String)
    case error
    
    var output: String{
        let result: String
        switch self{
        case .left(let left):
            result = left
        case .leftOp(let left, _):
            result = left
        case .leftOpRight(_, _, let right):
            result = right
        case .error:
            return "ERROR"
        }
        return result
    }
    
    func apply(item: CaculatorButtonItem) -> CaculatorBrain{
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

    

    private func applyOp(op: CaculatorButtonItem.Op) -> CaculatorBrain{
            switch self {
            case .left(let left):
                return CaculatorBrain.leftOp(left: left, op: op)
            case .leftOp(let left, _):
                return CaculatorBrain.leftOp(left: left, op: op)
            case .leftOpRight(let left, let oldop, let right):
                if op == .equal{
                    return CaculatorBrain.leftOp(left: right, op: oldop)
                }else{
                    return CaculatorBrain.leftOp(left: "\(left)\(oldop.rawValue)\(right)", op: op)
                }
            case .error:
                return self
            }
        }

    
    private func applyNumber(num: Int) -> CaculatorBrain{
        switch self {
        case .left(let string):
            return CaculatorBrain.left("\(string)\(num)")
        case .leftOp(let left,let op):
            return CaculatorBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return CaculatorBrain.leftOpRight(left: left, op: op, right: "\(right)\(num)")
        case .error:
            return self
        }
    }
}
