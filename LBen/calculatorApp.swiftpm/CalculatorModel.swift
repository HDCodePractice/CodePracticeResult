//
//  File.swift
//  calculatorApp
//
//  Created by Lei Zhou on 2/13/22.
//

import Foundation

struct CalculatorModel {
    let keyboard : [[CalculatorButtonItem]] = [[.command(.clear),.command(.opposite), .command(.percent),.op(.divide)],
                                              [.digit(7),.digit(8),.digit(9),.op(.multiply)],
                                              [.digit(4),.digit(5),.digit(6),.op(.minus)],
                                              [.digit(1),.digit(2),.digit(3),.op(.plus)],
                                        [.digit(0),.dot,.op(.equal)]
    ]
}
