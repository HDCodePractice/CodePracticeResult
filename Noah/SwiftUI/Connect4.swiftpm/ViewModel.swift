import Foundation
import SwiftUI

struct ViewModel {
    var gridWidth = 8
    var gridHeight = 7
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[GridItem]] = []
    
    init(){
        for _ in 1 ... gridWidth  {
            var col : [GridItem] = []
            for _ in 1 ... gridHeight {
                col.append(GridItem(connect: .green))
            }
            grid.append(col)
        }
    }
}
