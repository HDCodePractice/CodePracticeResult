import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var grids : [[Grid]]
    var selected : Grid? = nil
    
    init(){
        self.grids = []
        for x in 0..<height {
            var line = [Grid]()
            for y in 0..<width {
                var token : Color = .clear
                if y<3 && (x+y)%2 != 0 {
                    token = .white
                }
                if y>4 && (x+y)%2 != 0 {
                    token = .gray
                }
                line.append(Grid(color: (x+y)%2==0 ? .white : .black, token: token, x: x, y: y))
            }
            self.grids.append(line)
        }
        
    }
    var gridX = 0
    var gridY = 0
    mutating func select(grid: Grid){
        if gridX != 0 && gridY != 0{
            if gridY<3 && (gridX+gridY)%2 != 0 {
                self.grids[gridX][gridY].token = .white
            }
            if gridY>4 && (gridX+gridY)%2 != 0 {
                self.grids[gridX][gridY].token = .gray
            }
            
        }
        
        self.selected = grid
        self.grids[grid.x][grid.y].token = .red
        gridX = grid.x
        gridY = grid.y
    }
}

