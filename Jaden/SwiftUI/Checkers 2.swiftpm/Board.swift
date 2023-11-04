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
    
    mutating func newGame(){
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
        if let selected{
            grids[grid.x][grid.y].token = selected.token
            grids[selected.x][selected.y].token = .clear
            self.selected = nil
        }else{
            if grid.token != .clear{
                grids[grid.x][grid.y].token = .red
                self.selected = grid
            }
        }
    }
}
