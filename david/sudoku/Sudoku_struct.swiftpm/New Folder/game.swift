import SwiftUI

struct Game{
    var bigBoard:[[NineBoard]]=[]
    var aaa = [0]
    var numArr:[Int]=[]
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
                        bigBoard[r][w].nineBoard[x][j].status = .related
                        bigBoard[h][c].nineBoard[i][y].status = .related
                        bigBoard[r][c].nineBoard[i][j].status = .related
                        
                    }
                }
            }
        }
//        if  !numArr.contains(grid.num){
            bigBoard[r][c].nineBoard[x][y] = grid
            numArr.append(grid.num)
            bigBoard[r][c].nineBoard[x][y].status = .clicked
//        }else if !numArr[r][c].contains(grid.num)
            
            
//        }
        
    }
    
    mutating func inputNum(getNum:Int){
        
    }
}
