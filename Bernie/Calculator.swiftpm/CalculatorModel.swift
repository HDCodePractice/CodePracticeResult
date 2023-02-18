//
//  File.swift
//  Calculator
//
//  Created by 老房东 on 2022-02-13.
//
import Foundation

struct CalculatorModel{
    let keyboard : [[CalculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    var brain = CalculatorBrain.left("0")
    
    mutating func applyButton(button: CalculatorButtonItem){
        brain = brain.apply(item: button)
    }
}
