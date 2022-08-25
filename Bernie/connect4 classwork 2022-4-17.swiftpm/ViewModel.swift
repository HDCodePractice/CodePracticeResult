//
//  File.swift
//  connect4 classwork 2022-4-17
//
//  Created by Bernie Zhang on 4/17/22.
//

import Foundation
import SwiftUI

struct ViewModel{
    var gridWidth = 7
    var gridHeight = 8
    var gridBackground  = Color.gray
    var grid : [[GridItem]] = []
    // grid [[]] 里面的[[GridItem]->column]->row
    // GridItem
    // grid[5][6] 5 column 6 row
    var isBlock = true
    
    init(){
        for column in 0 ..< gridWidth  {
            var col : [GridItem] = []
            for row in 0 ..< gridHeight {
                col.append(
                    GridItem(connect: .nothing,column: column, row: row)
                )
            }
            grid.append(col)
        }
    }
    
    mutating func tapColumn(column : [GridItem]) {
        let col = column[0].column
        let row = checkLastNothing(column: column)
        if row > -1 {
            grid[col][row].connect = isBlock ? .black : .green
            isBlock.toggle()
        }
        checkVertical(row: row, column: col)
        checkHorizontal(row: row, column: col)
    }
    
    mutating func checkHorizontal(row:Int, column: Int){
        // 找到row
        // i 从 0 到 gridWidth - 4 开始
        // j 从 i 到 i + 3
        // 从 grid[i 到 j][row] 是不是都是 当前的connect颜色
        let connect = grid[column][row].connect
        for i in 0 ... gridWidth - 4 {
            if checkHorizontal4IsConnect(start: i, row: row, connect: connect){
                let newConnect = getNewConnect(connect: connect)
                for j in i...i+3 {
                    grid[j][row].connect = newConnect
                }
                return
            }
        }
    }
    
    func checkHorizontal4IsConnect(start: Int,row: Int,connect: Connect)->Bool{
        for j in start ... start + 3 {
            if grid[j][row].connect != connect{
                return false
            }
        }
        return true
    }
    
    func getNewConnect(connect:Connect)->Connect{
        switch connect {
        case .green:
            return .greenWin
        case .black:
            return .blackWin
        default:
            return .nothing
        }
    }
    
    mutating func checkVertical(row: Int, column: Int){
        // column < gridHeight - 3
        // column 到 column + 3 都是一个connect
        if row < gridHeight - 3 {
            let connect = grid[column][row].connect
            for i in row ... row+3 {
                if grid[column][i].connect != connect{
                    return
                }
            }
            let newConnect = getNewConnect(connect: connect)
            for i in row ... row+3 {
                grid[column][i].connect = newConnect
            }
        }
    }
    
    func checkLastNothing(column : [GridItem]) -> Int{
        for item in column{
            if item.connect != .nothing{
                return item.row - 1
            }
        }
        return column.last!.row
    }
}
