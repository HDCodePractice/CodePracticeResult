//
//  CalculatorBrain.swift
//  Calculater
//
//  Created by Stephen on 2022-02-20.
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
        
        guard let value = Double(result) else{
            return "ERROR"
        }
        
        return formatter.string(from: value as NSNumber)!
    }
    
    func apply(item: CalculaterButtonItem) -> CalculaterBrain{
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

    private func applyOp(op: CalculaterButtonItem.Op) -> CalculaterBrain{
        switch self {
        case .left(let left):
            return CalculaterBrain.leftOp(left: left, op: op)
        case .leftOp(let left, _):
            return CalculaterBrain.leftOp(left: left, op: op)
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
//            if op == .equal{
//                return CalculaterBrain.leftOp(left: right, op: oldop)
//            }else{
//                return CalculaterBrain.leftOp(left: "\(left)\(oldop.rawValue)\(right)", op: op)
//            }
        case .error:
            return self
        }
    }
    
    private func applyNumber(num : Int) -> CalculaterBrain{
        switch self {
        case .left(let string):
            return string == "0" ? .left("\(num)"): .left("\(string)\(num)")
        case .leftOp(let left,let op):
            return CalculaterBrain.leftOpRight(left: left, op: op, right: "\(num)")
        case .leftOpRight(let left, let op, let right):
            return CalculaterBrain.leftOpRight(left: left, op: op, right: right == "0" ? ("\(num)") : "\(right)\(num)")
        case .error:
            return self
        }
    }
    
    private func applyDot() -> CalculaterBrain{
        switch self {
        case .left(let left):
            return .left(left.applyDot())
        case .leftOp(left: let left, op: let op):
            return CalculaterBrain.leftOp(left: left, op: op)
        case .leftOpRight(left : let left, op : let op, right : let right):
            return .leftOpRight(left: left, op: op, right: right.applyDot())
        case .error:
            return .error
        }
    }
    
    private func applyCommand(command: CalculaterButtonItem.Command) -> CalculaterBrain{
        switch command {
        case .flip:
            switch self{
                case .left(let left):
                    return .left(left.flipped())
            case .leftOp(left: let left, op: let op):
                    return CalculaterBrain.leftOp(left: left, op: op, right: "0")
                case .leftOpRight(left : let left, op : let op, right : let right):
                    return .leftOpRight(left: left, op: op, right: right.flipped())
                case .error:
                    return .error
            }
      case .clear:
            return CalculaterBrain.left("0")
      case .percent:
            switch self {
                case .left(let left):
                    return .left(left.percent())
                case .leftOp(left: let left, op: let op):
                    return CalculaterBrain.leftOp(left: left, op: op, right: "0")
                case .leftOpRight(left : let left, op : let op, right : let right):
                    return .leftOpRight(left: left, op: op, right: right.percent())
                case .error:
                return .error
                }
        }
    }
    
}


extension CalculaterButtonItem.Op{
    func calculate(left:String, right:String) -> String?{
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
            return right == 0 ? nil: String(left / right)
        case .equal:
            return nil
        }
    }
}


extension String{
    var containsDot: Bool{
        return contains(".")
    }
    
    func applyDot() -> String{
        return containsDot ? self: "\(self)."
    }
    
    var startWithNegative: Bool{
        return starts(with: "-")
    }
    
    func flipped() -> String{
        if startWithNegative{
            var s = self
            s.removeFirst()
            return s
        }else {
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
