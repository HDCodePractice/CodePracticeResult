import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var grids : [[Grid]] = []
    var selected : Grid? = nil
    
    init(){
        newGame()
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
            let y1 = selected.x
            let y2 = grid.x
            let x1 = selected.y
            let x2 = grid.y
            
            var isCanMove = false
            
            // move one step
            if grid.token == .clear && abs(x2-x1)==1{
                if selected.token == .white{
                    if y2-y1 == 1{
                        isCanMove = true
                    }
                }else{ // token == .black
                    if y2-y1 == -1{
                        isCanMove = true
                    }
                }
            }
            if isCanMove {
                grids[grid.x][grid.y].token = selected.token
                grids[selected.x][selected.y].token = .clear
                self.selected = nil
                return
            }
            
            // eat one chess
            if grid.token == .clear && abs(x2-x1)==2{
                if selected.token == .white{
                    if y2-y1 == 2{
                        isCanMove = true
                    }
                }else{ // token == .black
                    if y2-y1 == -2{
                        isCanMove = true
                    }
                }
            }
            
            if isCanMove{
                var chessy = 0
                var chessx = 0
                var isEat = false
                if selected.token == .white{
                    chessy = y2 - 1
                    if x2 > x1 {
                        chessx = x2 - 1
                    }else{
                        chessx = x2 + 1
                    }
                    if grids[chessy][chessx].token == .gray{
                        isEat = true
                    }                     
                }
                if selected.token == .gray{
                    chessy = y2 + 1
                    if x2 > x1 {
                        chessx = x2 - 1
                    }else{
                        chessx = x2 + 1
                    }
                    if grids[chessy][chessx].token == .white{
                        isEat = true
                    }                     
                }
                if isEat{
                    grids[grid.x][grid.y].token = selected.token
                    grids[selected.x][selected.y].token = .clear
                    grids[chessy][chessx].token = .clear
                    self.selected = nil
                    return
                }
            }
            grids[selected.x][selected.y].token = selected.token
            self.selected = nil
        }else{
            if grid.token != .clear{
                grids[grid.x][grid.y].token = .red
                self.selected = grid
            }
        }
    }
}
