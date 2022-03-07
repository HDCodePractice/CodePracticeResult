//
//  File.swift
//  MyKeyboard
//
//  Created by stephen on 6/3/2022.
//

import Foundation

struct KeyboardModel{
    let keyboard :[[KeyboardButtonItem]] = [
        [.letter("Q"),.letter("W"),.letter("E"),.letter("R"),.letter("T"),.letter("Y"),.letter("U"),.letter("I"),.letter("O"),.letter("P"),.command(.clear)],
        [.letter("A"),.letter("S"),.letter("D"),.letter("F"),.letter("G"),.letter("H"),.letter("J"),.letter("K"),.letter("L"),.command(.Return)],
        [.command(.shift),.letter("Z"),.letter("X"),.letter("C"),.letter("V"),.letter("B"),.letter("N"),.letter("M"),.comma,.dot,.command(.shift)],
        [.command(.number),.command(.language),.command(.space),.command(.number),.command(.hide)]
    ]
    
//    var brain = KeyboardBrain.left("")
//
//    mutating func applyButton(button: KeyboardButtonItem){
//        brain = brain.apply(item: button)
//    }
}

