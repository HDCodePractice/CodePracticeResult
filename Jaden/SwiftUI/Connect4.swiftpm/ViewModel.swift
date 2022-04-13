import Foundation
import SwiftUI

class ViewModel{
    var gridWidth = 8
    var gridHeight = 7
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[GridItem]] = []
    static var changer = 1
    
    init(){
        for _ in 1 ... gridWidth  {
            var col : [GridItem] = []
            for _ in 1 ... gridHeight {
                col.append(GridItem(connect: .nothing))
            }
            grid.append(col)
        }
    }
    static func changePiece() -> GridItem {
        print(changer)
        if changer == 1{
            changer = 2
            return GridItem(connect: .green)
        }else if changer == 2{
            changer = 1
            return GridItem(connect: .black)
        }
        return GridItem(connect: .nothing)

    }
    func tapColumn(column : [GridItem]) -> [GridItem]{
        var rColumn = column
        if rColumn[0].connect != .nothing{
            return rColumn
        }
        for i in 0..<rColumn.count{
            if rColumn[i].connect != .nothing{
                rColumn[i-1] = GridItem(connect: .green)
                return rColumn
            }

        }
        rColumn[rColumn.count-1] = GridItem(connect: .green)
        return rColumn
    }
}
