import SwiftUI

struct Game{
    var eightyOneBoard:[[[[Grid]]]] = []
    var nineBoard:[[Grid]] = []
    let column = 3
    let row = 3
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        nineBoard = []
        for i in 0..<row{
            var rows:[Grid]=[]
            for j in 0..<column{
                rows.append(Grid(x: i, y: j))
            }
            nineBoard.append(rows)
        }
        for _ in 0..<3{
            var bRows:[[[Grid]]] = []
            for _ in 0..<3{
                bRows.append(nineBoard)
            }
            eightyOneBoard.append(bRows)
        }
        
    }
    
    mutating func afterTap(grid:Grid){
        let x = grid.x
        let y = grid.y
        for i in 0..<nineBoard.count{
            for j in 0..<nineBoard[i].count{
                nineBoard[i][j].status = .empty
                if i == x || j == y{
                    nineBoard[i][j].status = .related
                }
            }
        }
        
        nineBoard[x][y] = grid
        nineBoard[x][y].status = .clicked
    }
}
