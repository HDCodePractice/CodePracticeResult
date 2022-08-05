
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
    }
    func checkHorizontal(col: Int,row: Int)->Bool{
            var connects : [GridItem] = []
            for i in 0...gridWidth-1{
                connects.append(grid[i][row])
            }
            return checkConnectsWon(
                connects: connects,
                connect: grid[col][row].connect
            )
        }
        
        func checkConnectsWon(connects:[GridItem],connect: Connect)->Bool{
            for i in 0...connects.count-5{
                if check4ConnecsWon(
                    connects: [
                        connects[i],
                        connects[i+1],
                        connects[i+2],
                        connects[i+3]
                    ],
                    connect: connect
                ){
                    return true
                }
            }
            return false
        }
        
        func check4ConnecsWon(connects:[GridItem],connect: Connect)->Bool {
            for i in connects{
                if i.connect != connect{
                    return false
                }
            }
            return true
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

