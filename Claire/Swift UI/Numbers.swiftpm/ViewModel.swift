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
    var grid : [[BlockItem]] = []
    var keyPad : [[KeyPadButtonItem]] = []
    var gameFinished : Bool = false
    var gameWin : Bool = false
    var answer : [String] = []
    
    var views = 0
    
    var currentRow = 0
    var currentColumn = 0
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    mutating func inition() {
        grid = []
        answer = Array(numbers.shuffled().prefix(5))
        for height in 0..<gridHeight{
            var items : [BlockItem] = []
            for width in 0..<gridWidth{
                items.append(
                    BlockItem(status: .nothing, caption: "", column: width, row: height)
                )
            }
            grid.append(items)
        }
        
        currentColumn = 0
        currentRow = 0
    }
    
    init(){
        inition()
        keyPad = [
            [KeyPadButtonItem(button: .number("1")), KeyPadButtonItem(button: .number("4")), KeyPadButtonItem(button: .number("7")), KeyPadButtonItem(button: .delete)],
            
            [KeyPadButtonItem(button: .number("2")), KeyPadButtonItem(button: .number("5")), KeyPadButtonItem(button: .number("8")), KeyPadButtonItem(button: .check)],
            
            [KeyPadButtonItem(button: .number("3")), KeyPadButtonItem(button: .number("6")), KeyPadButtonItem(button: .number("9")), KeyPadButtonItem(button: .number("0"))],
        ]
    }
    
    
    
    mutating func putNumber(button: KeyPadButtonItem){
        let click = button.button.title
        print("\(currentRow),\(currentColumn)")
        
        if button.button.title == "delete"{
            if currentColumn > 0{
                if grid[currentRow][currentColumn].caption != ""{
                    grid[currentRow][currentColumn].caption = ""
                } else {
                    currentColumn -= 1
                    grid[currentRow][currentColumn].caption = ""
                }
            } else {
                grid[currentColumn][0].caption = ""
                return
            }

        } else {
            if button.button.title == "check"{
                if grid[currentRow][currentColumn].caption == ""{
                    return
                } else {
                    check()
                    currentRow += 1
                    currentColumn = 0
                }
                
            }
            
            if button.button.title == "1" || button.button.title == "2" || button.button.title == "3" || button.button.title == "4" || button.button.title == "5" || button.button.title == "6" || button.button.title == "7" || button.button.title == "8" || button.button.title == "9" || button.button.title == "0"{
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
        }
    }
    
    mutating func check(){
        
        var correctCount = 0
        
        
        for gridCheck in grid[currentRow]{
            let answerColumn = answer.firstIndex(of: gridCheck.caption) ?? -1
                if !answer.contains(gridCheck.caption){
                    grid[currentRow][gridCheck.column].status = .wrong
                } else if answer.contains(gridCheck.caption) && answerColumn != gridCheck.column {
                    grid[currentRow][gridCheck.column].status = .wOrder
                } else if answer.contains(gridCheck.caption) && answerColumn == gridCheck.column {
                    grid[currentRow][gridCheck.column].status = .correct
                    correctCount += 1
                }
        }
        
        if correctCount == 5{
            views = 2
            inition()
            currentColumn = 0
            currentRow = 0
        } else if currentColumn == 4 && currentRow == 5{
            views = 3
            inition()
            currentColumn = 0
            currentRow = 0
            
        }
        
    }
}
