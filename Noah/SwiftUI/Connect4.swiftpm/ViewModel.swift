import Foundation
import SwiftUI

struct ViewModel{
    var gridWidth = 8
    var gridHeight = 7
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[GridItem]] = []
    
    init(){
        for _ in 1 ... gridWidth  {
            var col : [GridItem] = []
            for _ in 1 ... gridHeight {
                col.append(GridItem(connect:.nothing))
            }
            grid.append(col)
        }
    }
    func tapColumn(column: [GridItem]) -> [GridItem] {
        var rColumn = column
        for i in 0..<rColumn.count {
            rColumn[i] = GridItem(connect: .green)
        }
        return rColumn
    }
    
    func checkHorizontal(row: Int, col: Int, target: Int) -> Bool {
        var index = 0
        if grid[row][col] == target {
            for i in 1 ... 3 {
                if col <= 4 {
                    if grid[row][col+i] == target {
                        index += 1
                    }
                }
            }
        }
        
        if index == 3 {
            return true
        }
        return false
    }

    func checkVertical(row: Int, col: Int, target: Int) -> Bool {
        var index = 0
        if grid[row][col] == target {
            for i in 1 ... 3 {
                if row >= 3 {
                    if grid[row-i][col] == target {
                        index += 1
                    }
                }
            }
        }
        
        if index == 3 {
            return true
        }
        return false
    }

    func checkDiagonal(row: Int, col: Int, target: Int) -> Bool {
        var index = 0
        var index2 = 0
        if grid[row][col] == target {
            for i in 1 ... 3 {
                if row >= 3 && col <= 4 {
                    if grid[row-i][col+i] == target {
                        index += 1
                    }
                    
                }
                if row >= 3 && col >= 3 {
                    if grid[row-i][col-i] == target {
                        index2 += 1
                    }
                }
            }
        }
        if index == 3 || index2 == 3 {
            return true
        }
        return false
    }

    func checkOneWon() -> Bool {
        for eachRow in 0 ... 6 {
            for each in 0 ... 7 {
                if checkHorizontal(row: eachRow, col: each, target: 1) || checkVertical(row: eachRow, col: each, target: 1) || checkDiagonal(row: eachRow, col: each, target: 1) {
                    return true
                }
            }
        }
        return false
    }

    func checkTwoWon() -> Bool {
        for eachRow in 0 ... 6 {
            for each in 0 ... 7 {
                if checkHorizontal(row: eachRow, col: each, target: 2) || checkVertical(row: eachRow, col: each, target: 2) || checkDiagonal(row: eachRow, col: each, target: 2) {
                    return true
                }
            }
        }
        return false
    }

}
