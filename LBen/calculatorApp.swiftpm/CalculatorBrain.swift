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
        case .leftOpRight(left: let left, op: let op, right: let right):
  
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
            return applyDot()
        case .command(let cmd):
            return applyCommand(command: cmd)
        
        }
    }
    
    private func applyOp(op: CalculatorButtonItem.Op) -> CalculatorBrain {
        switch self {
            case .left(let left):
                return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOp(left: let left, op: _):
            return CalculatorBrain.leftOp(left: left, op: op)
        case .leftOpRight(left: let left, op: let oldOp, right: let right):
            let newRight = caculcateResult(left:left,op:oldOp,right:right)
            if op == .equal {
                return CalculatorBrain.leftOp(left: newRight, op: oldOp)
            }else {
                return CalculatorBrain.leftOp(left: newRight, op: op)
            }
 
        case .error:
            return self
        }
    }
    
    private func applyDot() -> CalculatorBrain {
        switch self {
        case .left(let left):
            if String(left).contains("."){
                return CalculatorBrain.left(left)
            }else{
                return CalculatorBrain.left("\(left).")
            }
        case .leftOp(left: let left, op: let op):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "0")
        case .leftOpRight(left: let left, op: let op, right: let right):
            if String(right).contains("."){
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(right)")
            }else{
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(right).")
            }
        case .error:
            return self
        }
    }
    
    private func applyCommand(command: CalculatorButtonItem.Command) -> CalculatorBrain {
        switch command {
        case .opposite:
            switch self {
            case .left(let left):
                if (Double(left) ?? 0) <= 0 {
                    return CalculatorBrain.left("\(abs(Double(left) ?? 0))")
                }else{
                    return CalculatorBrain.left("-\(left)")
                }
            case .leftOp(left: let left, op: let op):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "0")
            
            case .leftOpRight(left: let left, op: let op, right: let right):
                if (Double(right) ?? 0) <= 0  {
                    return CalculatorBrain.leftOpRight(left:left,op:op,right:"\(abs(Double(right) ?? 0))")
                }else{
                    return CalculatorBrain.leftOpRight(left:left,op:op,right:"-\(right)")
                }
            case .error:
                return self
            }
        
        case .clear:
            return CalculatorBrain.left("0")
        case .percent:
            switch self{
            case .left(let left):
                return CalculatorBrain.left("\(((Double(left) ?? 0)/100))")
            case .leftOp(left: let left, op: let op):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "0")
            case .leftOpRight(left: let left, op: let op, right: let right):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(((Double(right) ?? 0)/100))")
            case .error:
                return self
            }
        }
        
        
    }
    
    private func applyNumber(num : Int) -> CalculatorBrain{
        switch self {
        case .left(var left):
            if left == String(0) {
                left = ""
            }
            return CalculatorBrain.left("\(left)\(num)")
        case .leftOp(left: let left, op: let op):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(left: let left, op: let op, right: let right):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "\(right)\(num)")
        case .error:
            return self
        }
    }
    
    private func caculcateResult(left: String,op:CalculatorButtonItem.Op,right:String) -> String {
        
        switch op {
        case .divide:
            return String(Float(left)!/Float(right)!)
        case .minus:
            return String(Float(left)! - Float(right)!)
        case .multiply:
            return String(Float(left)! * Float(right)!)
        case .plus:
            return String(Float(left)! + Float(right)!)
        case .equal:
            return "nothing to do"
        }
    }
}
