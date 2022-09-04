import SwiftUI

struct Game{
    var board : [[Grid]] = []
    var gameState  = GameState.Continue
    var currentPlayer = Chess.O
    let width = 3
    let hight = 3
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        gameState  = GameState.Continue
        currentPlayer = Chess.O
        for i in 0..<hight{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(chess: Chess.null, x: i, y: j))
            }
            board.append(row)
        }
    }
    
    mutating func putChess(grid: Grid){
        if board[grid.x][grid.y].changeChess(newChess: currentPlayer){
            currentPlayer = currentPlayer.nextPlayer()
            gameState = .Won
        }
    }
}
