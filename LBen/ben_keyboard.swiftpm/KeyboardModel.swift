//
//  File.swift
//  ben_keyboard
//
//  Created by Lei Zhou on 3/6/22.
//

import Foundation

struct KeyboardModel {
    let keyboard  : [[KeyboardItem]] = [[.letter("1", "Q"), .letter("2", "W"),.letter("3", "E"),.letter("4", "R"),.letter("5", "T"),.letter("6", "Y"),.letter("7", "U"),.letter("8", "I"),.letter("9", "O"),.letter("0", "P"), .functionKey(.deleteButton)],[.letter("@", "A"), .letter("#", "S"),.letter("$", "D"),.letter("&", "F"),.letter("*", "G"),.letter("(", "H"),.letter(")", "J"),.letter("'", "K"),.letter("\"", "L"), .returnButton],[.functionKey(.shiftButton),.letter("%", "Z"), .letter("-", "X"),.letter("+", "C"),.letter("=", "V"),.letter("/", "B"),.letter(";", "N"),.letter(":", "M"),.letter("!", ","),.letter("?", "."), .functionKey(.shiftButton)],[.functionKey(.numberSwitch),.functionKey(.languageSwitch),.functionKey(.speakerSwitch),.spaceButton,.functionKey(.numberSwitch),.functionKey(.keyboardButton)]]
}
