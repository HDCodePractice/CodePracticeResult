import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var grids : [[Grid]]
    var selected : Grid? = nil
    var select = false 
    
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
        if select == false {
            for x in 0..<height{
                for y in 0..<width{
                    if x<3 && (x+y)%2 != 0{
                        self.grids[grid.x][grid.y].token = .white
                    }
                    if x>4 && (x+y)%2 != 0{
                        self.grids[grid.x][grid.y].token = .gray
                    }
                }
            }
            
            select.toggle()
        } else {
            self.grids[grid.x][grid.y].token = .red
            select.toggle()
        }
    
    }
}
