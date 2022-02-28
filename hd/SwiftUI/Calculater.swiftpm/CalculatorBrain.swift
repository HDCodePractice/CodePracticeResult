//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 老房东 on 2022-02-20.
//

import Foundation

enum CalculatorBrain{
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left:String,op: CalculatorButtonItem.Op,right:String)
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
        
        guard let value = Double(result) else{
            return "ERROR"
        }
        
        return formatter.string(from: value as NSNumber )!
    }
    
    func apply(item: CalculatorButtonItem) -> CalculatorBrain{
        switch item{
        case .digit(let num):
            return applyNumber(num: num)
        case .dot:
            return applyDot()
        case .op(let op):
            return applyOp(op: op)
        case .command(let command):
            return applyCommand(command: command)
        }
    }
    
    private func applyCommand(command: CalculatorButtonItem.Command) -> CalculatorBrain {
        switch command {
        case .flip:
            switch self {
            case .left(let left):
                return .left(left.flipped())
            case .leftOp(left: let left, op: let op):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "0")
            case .leftOpRight(left: let left, op: let op, right: let right):
                return .leftOpRight(left: left, op: op, right: right.flipped())
            case .error:
                return self
            }
        case .clear:
            return CalculatorBrain.left("0")
        case .percent:
            switch self{
            case .left(let left):
                return .left(left.percent())
            case .leftOp(left: let left, op: let op):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: "0")
            case .leftOpRight(left: let left, op: let op, right: let right):
                return CalculatorBrain.leftOpRight(left: left, op: op, right: right.percent())
            case .error:
                return self
            }
        }
    }
    
    private func applyDot() -> CalculatorBrain {
        switch self {
        case .left(let left):
            return .left(left.applyDot())
        case .leftOp(left: let left, op: let op):
            return CalculatorBrain.leftOpRight(left: left, op: op, right: "0.")
        case .leftOpRight(left: let left, op: let op, right: let right):
            return .leftOpRight(left: left, op: op, right: right.applyDot())
        case .error:
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
            switch op{
            case .plus, .minus, .multiply, .divide:
                if let result = oldop.calculate(left: left, right: right){
                    return .leftOp(left: result, op: op)
                }else{
                    return .error
                }
            case .equal:
                if let result = oldop.calculate(left: left, right: right){
                    return .leftOp(left: result, op: oldop)
                }else{
                    return .error
                }
            }
        case .error:
            return self
        }
    }
    
    private func applyNumber(num : Int) -> CalculatorBrain{
        switch self {
        case .left(let string):
            return string == "0" ? .left("\(num)") : .left("\(string)\(num)")
        case .leftOp(let left,let op):
            return .leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return .leftOpRight(left: left, op: op, right: right == "0" ? "\(num)" : "\(right)\(num)")
        case .error:
            return self
        }
    }
}

extension CalculatorButtonItem.Op{
    func calculate(left:String,right:String) -> String?{
        guard let left = Double(left), let right = Double(right) else {
            return nil
        }
        
        switch self{
        case .plus:
            return String(left + right)
        case .minus:
            return String(left - right)
        case .multiply:
            return String(left * right)
        case .divide:
            return right == 0 ? nil : String(left / right)
        case .equal:
            return nil
        }
    }
}

extension String{
    var containsDot:Bool{
        return contains(".")
    }
    
    func applyDot() -> String{
        return containsDot ? self : "\(self)."
    }
    
    var startWithNegative: Bool{
        return starts(with: "-")
    }
    
    func flipped() -> String{
        if startWithNegative{
            var s = self
            s.removeFirst()
            return s
        }else{
            return "-\(self)"
        }
    }
    
    func percent() -> String{
        return String((Double(self) ?? 0)/100)
    }
}

var formatter: NumberFormatter = {
    let f = NumberFormatter()
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 8
    f.numberStyle = .decimal
    return f
}()

