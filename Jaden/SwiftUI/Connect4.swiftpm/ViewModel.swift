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
                col.append(GridItem(connect: .nothing))
            }
            grid.append(col)
        }
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
