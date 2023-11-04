import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var first = true
    var previousx = -1
    var previousy = -1
    var previousc : Color = .black
    var grids : [[Grid]]
    var selected : Grid? = nil
    
    init(){
        self.grids = []
        for x in 0..<height{
            var line = [Grid]()
            for y in 0..<width{
                var token : Color = .clear
                if x<3 && (x+y)%2 != 0{
                    token = .white
                }
                if x>4 && (x+y)%2 != 0{
                    token = .gray
                }
                line.append(
                    Grid(
                        x: x, 
                        y: y, 
                        color: (x+y)%2==0 ? .white : .black, 
                        token: token
                    )
                )
            }
            self.grids.append(line)
        }
    }
    
    mutating func select(grid: Grid){
            self.selected = grid
        if first == true{
            first = false
        }else {
            self.grids[previousx][previousy].token = previousc
            
        }
        previousc = self.grids[grid.x][grid.y].token
            self.grids[grid.x][grid.y].token = .red
            previousx = grid.x
            previousy = grid.y
    }
}
