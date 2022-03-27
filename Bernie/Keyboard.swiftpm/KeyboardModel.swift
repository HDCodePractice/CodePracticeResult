//
//  File.swift
//  keyboard
//
//  Created by Bernie Zhang on 3/3/22.
//

import Foundation

struct KeyboardModel{
    let keykeyboard : [[KeyboardButtonItem]] = [
        [.letter("Q"),.letter("W"),.letter("E"),.letter("R"),.letter("T"),.letter("U"),.letter("I"),.letter("O"),.letter("P"),.icon(.delete)],
        [.letter("A"),.letter("S"),.letter("D"),.letter("F"),.letter("G"),.letter("H"),.letter("J"),.letter("K"),.letter("L"),.command(.enter)],
        [.icon(.shiftfill),.letter("Z"),.letter("X"),.letter("C"),.letter("V"),.letter("B"),.letter("N"),.letter("M"),.command(.comma),.command(.fullstop),.icon(.shiftfill)],
        [.command(.numbers),.icon(.globe),.icon(.mic),.letter(""),.command(.numbers),.icon(.keyboardchevrondown)]
    ]
}
