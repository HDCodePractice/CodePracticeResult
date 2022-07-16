import Foundation
import SwiftUI

struct ViewModel{
    var gridHeight = 9
    var gridWidth = 8
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[ChessBoardItem]] = []
    
    init(){
        for _ in 1 ... gridHeight  {
            var col : [ChessBoardItem] = []
            for _ in 1 ... gridWidth {
                col.append(ChessBoardItem(background: "Mid2", chess: "no", checker: .pawn))
            }
            grid.append(col)
        }
    }
    mutating func change() {
        grid[0][1]=ChessBoardItem(background: "Mid2",chess: "no", checker: .nothing)
    }
}

struct ChessBoardItem: Identifiable,Hashable{
    let id:UUID = UUID()
    var background = "Mid2"
    var chess = "no"
    var checker : Connect
}
