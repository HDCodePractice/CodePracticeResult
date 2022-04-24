//
//  ViewModel.swift
//  Numbers
//
//  Created by Qianji Yao on 2022/4/9.
//

import Foundation
import SwiftUI

struct ViewModel{
    var gridWidth = 5
    var gridHeight = 6
    var gridBackground = Color.white
    var inputNumber : [String] = []
    var grid : [[BlockItem]] = []
    var keyPad : [[KeyPadButtonItem]] = []
    var gameFinished : Bool = false
    var gameWin : Bool = false
    var answer : [String] = []
        
    var currentRow = 0
    var currentColumn = 0
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    init(){
        answer = Array(numbers.shuffled().prefix(5))
        for height in 0..<gridHeight{
            var items : [BlockItem] = []
            for width in 0..<gridWidth{
                items.append(
                    BlockItem(status: .nothing, caption: "", column: height, row: width)
                )
            }
            grid.append(items)
        }
        keyPad = [
            [KeyPadButtonItem(button: .number("1")), KeyPadButtonItem(button: .number("4")), KeyPadButtonItem(button: .number("7")), KeyPadButtonItem(button: .delete)],
            
            [KeyPadButtonItem(button: .number("2")), KeyPadButtonItem(button: .number("5")), KeyPadButtonItem(button: .number("8")), KeyPadButtonItem(button: .check)],
            
            [KeyPadButtonItem(button: .number("3")), KeyPadButtonItem(button: .number("6")), KeyPadButtonItem(button: .number("9")), KeyPadButtonItem(button: .number("0"))],
        ]
    }
    
    mutating func putNumber(button: KeyPadButtonItem){
        let click = button.button.title
        
        if button.button.title == "delete"{
            // have to click twice to delete a number when it is not the last number in the column
            grid[currentRow][currentColumn].caption = ""
            if currentColumn > 0{
                currentColumn -= 1
            } else {
                return
            }
        } else {
            if button.button.title == "check"{
                grid[currentRow][currentColumn].caption = ""
                // delete the last input in the column
                check()
                currentRow += 1
                // when start a new row, skip the first block
                currentColumn = 0
            }
            
            if button.button.title == "1" || button.button.title == "2" || button.button.title == "3" || button.button.title == "4" || button.button.title == "5" || button.button.title == "6" || button.button.title == "7" || button.button.title == "8" || button.button.title == "9" || button.button.title == "0"{
                grid[currentRow][currentColumn].caption = click
            }
            
            if currentColumn == 4{
                if currentRow == 6{
                    return
                }
                return
            } else {
                currentColumn += 1
            }
        }
    }
    
    mutating func check(){
        
        var correctCount = 0
        for answerCheck in answer{
            for count in 0...5{
                if answerCheck != grid[currentRow][count].caption {
                    return grid[currentRow][currentColumn].status = .wrong
                } else if answerCheck == grid[currentRow][currentColumn].caption && answerCheck != String(currentColumn){
                    return grid[currentRow][currentColumn].status = .wOrder
                } else if answerCheck == grid[currentRow][currentColumn].caption && answerCheck == String(currentColumn){
                    correctCount += 1
                    return grid[currentRow][count].status = .correct
                }
            }
        }
        
        // only check the last input in the column
    }
}
