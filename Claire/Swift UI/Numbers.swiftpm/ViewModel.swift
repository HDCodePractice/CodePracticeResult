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
        grid[currentRow][currentColumn].caption = click
        // Index out of range after inputing all the grid
        
        if button.button.title == "delete"{
            grid[currentRow][currentColumn].caption = ""
            currentColumn -= 1
            // Cannot input number after delete
            // Have to click twice to delete a number
        } else {
            if currentColumn == 4{
                currentRow += 1
                currentColumn = 0
                // Doesn't really work
                // Have to disable input
            } else {
                currentColumn += 1
                // Easy to be index out of range
            }
        }
        
        if button.button.title == "check"{
            // Do all the guess work
        }
        
        


        
    }
    
    mutating func check(){
        
    }
    
    
    
}
