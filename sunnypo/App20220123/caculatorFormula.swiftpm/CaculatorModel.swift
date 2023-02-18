//
//  File.swift
//  caculatorFormula
//
//  Created by Sunny on 2022/2/13.
//

import Foundation

struct CaculatorModel{
    let keyboard :[[CaculatorButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(7),.digit(8),.digit(9),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    var brain = CaculatorBrain.left("0")
    
    mutating func applyButton(button: CaculatorButtonItem){
        brain = brain.apply(item: button)
    }
}
