//
//  File.swift
//  MyCal2
//
//  Created by stephen on 13/2/2022.
//

import Foundation

struct CalculaterModel{
    let keyboard :[[CalculaterButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.plus)],
        [.digit(0),.dot,.op(.equal)]
    ]
    
    var brain = CalculaterBrain.left("0")
    
    mutating func applyButton(button:CalculaterButtonItem){
        brain = brain.apply(item: button)
    }

}

