import SwiftUI

struct Game{
    var board : [[Grid]] = []
    var gameState = GameState.Countinue
    var lastGrid : Grid?
    let width = 5
    let hight = 4
    let nameArray = ["0.circle","1.circle","2.circle","3.circle","4.circle","5.circle","6.circle","7.circle","8.circle","9.circle"]
    
    func genArray(_ nameArray:[String])->[Symbol]{
        var array = [Symbol]()
        for _ in 0...1{
            for i in nameArray{
                let symbol : Symbol = Symbol(name: i,isFlipped: false)
                array.append(symbol)
            }
        }
        return array
    }
    
    init(){
        startGame(genArray(nameArray))
    }
    
    
    mutating func startGame( _ symbolArray: [Symbol]){
        board = []
        gameState = GameState.Countinue
        var array = symbolArray
        array.shuffle()
        for i in 0..<hight{
            var row: [Grid] = []
            for j in 0..<width{
                row.append(Grid(symbol: array.first!, x: i, y: j))
                array.removeFirst()
            }
            board.append(row)      
        }
    }
    
    
    mutating func flip(grid:Grid)->[[Grid]]{
        if lastGrid == nil{
            board[grid.x][grid.y].symbol.isFlipped = true
            lastGrid = board[grid.x][grid.y]
            return board
        }else{
            if board[grid.x][grid.y].canFlip(){
                board[grid.x][grid.y].symbol.isFlipped = true
                if board[grid.x][grid.y].symbol.name == lastGrid!.symbol.name && lastGrid!.symbol.isFlipped {
                    return board
                }
                if board[grid.x][grid.y].symbol.name != lastGrid!.symbol.name && lastGrid!.symbol.isFlipped{
                    lastGrid!.symbol.isFlipped = false
                    board[grid.x][grid.y].symbol.isFlipped = false
                    lastGrid = board[grid.x][grid.y]
                    return board
                }
                if lastGrid!.symbol.isFlipped == false{
                    lastGrid = board[grid.x][grid.y]
                    return board
                }
            }
        }
        return board
    }
    
    func isShowGridSymbol(grid: Grid)->String{
        if grid.symbol.isFlipped{
            return grid.symbol.name
        }
        return ""
    }
    
    
    
    
    
    func isGameOver()->Bool{
        for i in board{
            for j in i{
                if j.symbol.isFlipped == false{
                    return false
                }
            }
        }
        return true
    }
}
