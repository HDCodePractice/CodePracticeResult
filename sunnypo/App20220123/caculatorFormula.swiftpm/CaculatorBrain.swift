//
//  CaculatorBrain.swift
//  caculatorFormula
//
//  Created by Sunny on 2022/2/20.
//
<<<<<<< Updated upstream

import Foundation

enum CaculatorBrain{
    case left(String)
    case leftOp(left: String, op: CaculatorButtonItem.Op)
    case leftOpRight(left: String, op: CaculatorButtonItem.Op,right:String)
=======
import Foundation

enum CalculatorBrain{
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Op)
    case leftOpRight(left:String,op: CalculatorButtonItem.Op,right:String)
>>>>>>> Stashed changes
    case error
    
    var output: String{
        let result: String
<<<<<<< Updated upstream
        switch self{
        case .left(let left):
            result = left
        case .leftOp(let left, _):
=======
        switch self {
        case .left(let left):
            result = left
        case .leftOp(let left , _):
>>>>>>> Stashed changes
            result = left
        case .leftOpRight(_, _, let right):
            result = right
        case .error:
            return "ERROR"
        }
<<<<<<< Updated upstream
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
=======
        
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
>>>>>>> Stashed changes
            case .error:
                return self
            }
        }
<<<<<<< Updated upstream

    
    private func applyNumber(num: Int) -> CaculatorBrain{
        switch self {
        case .left(let string):
            return CaculatorBrain.left("\(string)\(num)")
        case .leftOp(let left,let op):
            return CaculatorBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return CaculatorBrain.leftOpRight(left: left, op: op, right: "\(right)\(num)")
=======
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
>>>>>>> Stashed changes
        case .error:
            return self
        }
    }
}
<<<<<<< Updated upstream
=======

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
>>>>>>> Stashed changes
