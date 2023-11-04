import SwiftUI

struct Game{
    var bigBoard:[[NineBoard]]=[]
    
    let width = 3
    let height = 3
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        bigBoard = []
        
        for i in 0..<height{
            var rows:[NineBoard]=[]
            for j in 0..<width{
                var nineboard = NineBoard(r: i, c: j)
                nineboard.startGame()
                rows.append(nineboard)
            }
            bigBoard.append(rows)
        }
        
    }
    
    mutating func afterTap(grid:Grid,nineBoard:NineBoard){
        let x = grid.x
        let y = grid.y
        let r = nineBoard.r
        let c = nineBoard.c
        
        for h in 0..<3{
            for w in 0..<3{
                for i in 0..<3{
                    for j in 0..<3 {
                        
                        bigBoard[h][w].nineBoard[i][j].status = .empty
                        
                        if h == r || w == c{
                            if i == x || j == y{
                                bigBoard[r][w].nineBoard[x][j].status = .related
                                bigBoard[h][c].nineBoard[i][y].status = .related
                            }
                        }
                        bigBoard[r][c].nineBoard[i][j].status = .related
                        
                    }
                }
            }
        }

        bigBoard[r][c].nineBoard[x][y] = grid
        bigBoard[r][c].nineBoard[x][y].status = .clicked
    }
}
