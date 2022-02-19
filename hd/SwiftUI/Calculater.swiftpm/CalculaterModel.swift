//
//  File.swift
//  Calculater
//
//  Created by 老房东 on 2022-02-13.
//

import Foundation

struct CalculaterModel{
    let keyboard : [[CalculaterButtonItem]] = [
        [.command(.clear),.command(.flip),.command(.percent),.op(.divide)],
        [.digit(7),.digit(8),.digit(9),.op(.multiply)],
        [.digit(4),.digit(5),.digit(6),.op(.minus)],
        [.digit(1),.digit(2),.digit(3),.op(.pluse)],
        [.digit(0),.dot,.op(.equal)]
    ]
}
