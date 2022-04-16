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
    var keyPad : [[KeyPadButton]] = []
    var gameFinished : Bool = false
    var gameWin : Bool = false
    var answer : [String] = []
        
    var currentRow = 0
    var currentColumn = 0
    
    let numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    init(){
        answer = Array(numbers.shuffled().prefix(5))
    }
    
    mutating func putNumber(_: KeyPadButton){
        inputNumber.append("\(KeyPadButton.number)")
        currentRow += 1
    }
    
    mutating func delete(){
        if KeyPadButtonItem.caption == delete{
            currentColumn -= 1
        }
    }
    
    
    
}
