import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var grids : [[Grid]]
    var selected : Grid? = nil
    init(){
        self.grids = []
        generate()
    }
    mutating func generate(){
        self.grids = []
        for y in 0..<height{
            var line = [Grid]()
            for x in 0..<width{
                var token : Color = .clear
                if (x+y)%2==1{
                    if y < 3{
                        token = .white
                    }
                    if y > 4{
                        token = .gray
                    }
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
    mutating func selectGrid(grid: Grid){
        self.selected = grid
        generate()
        if selected!.token != .clear{
            grids[selected!.y][selected!.x].token = .red
        }
    }
}

