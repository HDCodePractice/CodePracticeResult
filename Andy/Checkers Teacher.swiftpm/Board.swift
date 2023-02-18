import SwiftUI

struct Board{
    var width : Int = 8
    var height : Int = 8
    var grids : [[Grid]] = []
    var selected : Grid? = nil
    var move : Color = .clear
    var tile : [Int] = []
    init(){
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
        if move == .clear{
            if selected!.token != .clear{
                move = grids[selected!.y][selected!.x].token
                grids[selected!.y][selected!.x].token = .red
                tile = [selected!.y,selected!.x]
            }
        }else{
            print([selected!.y,tile[0]])
            if move == .gray{
                if tile[0]>0{
                    if selected!.y == grids[0][tile[0]-1].x{
                        if selected!.x - grids[tile[1]][0].y == 1 || selected!.x - grids[tile[1]][0].y == -1{
                            grids[tile[0]][tile[1]].token = .clear
                            grids[selected!.y][selected!.x].token = move
                            move = .clear
                        }else{
                            grids[tile[0]][tile[1]].token = move
                            move = .clear
                        }
                    }else{
                        grids[tile[0]][tile[1]].token = move
                        move = .clear
                    }
                }else{
                    grids[tile[0]][tile[1]].token = move
                    move = .clear
                }
            }else if move == .white{
                if tile[0]<7{
                    if selected!.y == grids[0][tile[0]+1].x{
                        if selected!.x - grids[tile[1]][0].y == 1 || selected!.x - grids[tile[1]][0].y == -1{
                            grids[tile[0]][tile[1]].token = .clear
                            grids[selected!.y][selected!.x].token = move
                            move = .clear
                        }else{
                            grids[tile[0]][tile[1]].token = move
                            move = .clear
                        }
                    }else{
                        grids[tile[0]][tile[1]].token = move
                        move = .clear
                    }
                }else{
                    grids[tile[0]][tile[1]].token = move
                    move = .clear
                }
            }
        }
    }
}

