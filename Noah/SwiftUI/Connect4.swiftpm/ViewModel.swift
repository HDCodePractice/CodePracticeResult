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
}
