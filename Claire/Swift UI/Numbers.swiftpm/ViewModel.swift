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
            grid[currentRow][currentColumn].caption = click
            if currentColumn == 4{
                if currentRow == 6{
                    return
                }
                return
            } else {
                currentColumn += 1
            }
        }
        
            // Hello, world
            
            // "for" to check
            
            // Set all status
                // if allStatus == "correct" { Win View }
                // else {
//                  if currentRow == 6 { Lose View , Text(answer)}
//                  currentRow += 1 && currentColumn = 0
//                 }
    }
    
    mutating func check(){
        
        var correctCount = 0
        
        // count is int and cannot be for
        for answerEx in answer{
            for diff in 0...5{
                if answerEx != grid[currentRow][diff]{
                    
                }
            }
        }
    }
}
