import SwiftUI

struct Game{
    var board:[[Grid]]=[]
    var clickedGrid : [Int] = []
    var matchedCount: Int = 0
    let symbols = ["0.circle","1.circle","2.circle","3.circle","4.circle","5.circle","6.circle","7.circle","8.circle","9.circle"]
    let width = 4
    let height = 5
    init(){
        startGame()
    }
    
    mutating func tapGrid(grid: Grid)->Bool{
        let x = grid.x
        let y = grid.y
        
        if board[x][y].status != .covered{
            return false
        }
        
        if clickedGrid.isEmpty{
            clickedGrid=[x,y]
            board[x][y].status = .clicked
        }else{
            let lastX = clickedGrid[0]
            let lastY = clickedGrid[1]
            if !(x==lastX && y==lastY){
                if board[lastX][lastY].symbol == board[x][y].symbol{
                    board[lastX][lastY].status = .matched
                    board[x][y].status = .matched
                    clickedGrid=[]
                }else{
                    board[lastX][lastY].status = .clicked
                    board[x][y].status = .clicked
                    return true
                }
            }
        }
        return false
    }
    
    mutating func afterTapGrid(grid: Grid){
        let x = grid.x
        let y = grid.y
        let lastX = clickedGrid[0]
        let lastY = clickedGrid[1]
        
        board[lastX][lastY].status = .covered
        board[x][y].status = .covered
        clickedGrid=[]
    }
    
    mutating func startGame(){
        let symbolCount = width*height/2
        let symbolsResultStart = Array(symbols.shuffled().prefix(symbolCount))
        var symbolsResult = symbolsResultStart + symbolsResultStart
        symbolsResult.shuffle()
        var putedCount = 0
        
        board = []
        for i in 0..<height{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(symbol: symbolsResult[putedCount], x: i, y: j))
                putedCount += 1
            }
            board.append(row)
        }
    }
}


struct Grid{
    var symbol:String
    var x: Int
    var y: Int
    var status : GridStatus = .covered
}


enum GridStatus{
    case clicked
    case matched
    case covered
    
    var color : Color {
        switch self{
        case .clicked:
            return .cyan
        case .matched:
            return .mint
        case .covered:
            return .white
        }
    }
}
