//
//  KeyContent.swift
//  keyboard
//
//  Created by sunny on 2022-03-03.
//

import Foundation

struct KeyboardComponent {

    var keys : [[KeyContentItem]] = [
        [
            .character("Q","1"),
            .character("W","2"),
            .character("E","3"),
            .character("R","4"),
            .character("T","5"),
            .character("Y","6"),
            .character("U","7"),
            .character("I","8"),
            .character("O","9"),
            .character("P","0"),
            .command("delete.left")
        ],[
            .character("A","@"),
            .character("S","#"),
            .character("D","¥"),
            .character("F","&"),
            .character("G","*"),
            .character("H","("),
            .character("J",")"),
            .character("K","'"),
            .character("L","\\"),
            .command("return")
        ],[
            .command("shift"),
            .character("Z","%"),
            .character("C","-"),
            .character("V","+"),
            .character("B","="),
            .character("N","/"),
            .character("M",";"),
            .character(".",":"),
            .character(".","!"),
            .command("shift")
        ],[
            .command("textformat.123"),
            .command("globe"),
            .command("mic"),
            .command("spacebar"),
            .command("textformat.123"),
            .command("keyboard.chevron.compact.down")
        ]
    ]
}
