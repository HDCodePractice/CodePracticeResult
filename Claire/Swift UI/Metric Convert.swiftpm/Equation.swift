//
//  Equation.swift
//  Metric Convert
//
//  Created by Qianji Yao on 2022/1/19.
//

import Foundation

struct Equation {
    var one: Double = 0.0
    var two: Double = 0.0
    var operation: String = ""
    var end: Double {
        if operation == "" {
            return 0
        } else if operation == "+" {
            return one  + two
        } else if operation == "-" {
            return one - two
        } else if operation == "*" || operation == "×"{
            return one * two
        } else if operation == "/" || operation == "÷"{
            return one / two
        }
        return 0.0
    }
    var text: String {
        if operation == "" {
            return "\(one)"
        }
        return "\(one) \(operation) \(two) = \(end)"
    }
}

struct Equations {
    var items : [Equation] = []
    var text : String {
        var start = items.count - 5
        var text = ""
        let end = items.count - 1
        if start < 0 {
            start = 0
        }
        for i in start ... end {
            text += items[i].text + "\n"
        }
        return text
    }
}
