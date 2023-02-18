import SwiftUI

struct Game{
    var board : [[Grid]] = []
    var gameState = GameState.Continue
    var currentPlayer = Chess.O
    let width = 3
    let hight = 3
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        board = []
        gameState = GameState.Continue
        currentPlayer = Chess.O
        for i in 0..<hight{
            var row : [Grid] = []
            for j in 0..<width{
                row.append(Grid(chess: Chess.Null, x: i, y: j))
            }
            board.append(row)
        }
    }
    
    mutating func putChess(grid:Grid){
        
        if board[grid.x][grid.y].changeChess(newChess: currentPlayer){
            var grid = grid
            grid = board[grid.x][grid.y]
            currentPlayer = currentPlayer.nextPlayer()
            
            
            if isGameOver(grid: board[grid.x][grid.y]){
                gameState = .Win
                
            }
            
        }
    }
    
    mutating func isGameOver(grid:Grid)->Bool{
        
        if grid.chess.getImage() != "circle.dotted"{
            
            if board[grid.x][0].chess.getImage()==board[grid.x][1].chess.getImage() && board[grid.x][2].chess.getImage()==board[grid.x][1].chess.getImage(){
                return true
            }
            if board[0][grid.y].chess.getImage()==board[1][grid.y].chess.getImage() && board[1][grid.y].chess.getImage()==board[2][grid.y].chess.getImage(){
                return true
            }
            if board[0][0].chess.getImage()==board[1][1].chess.getImage() && board[1][1].chess.getImage()==board[2][2].chess.getImage() && board[1][1].chess.getImage() != "circle.dotted"{
                return true
            }
            if board[2][0].chess.getImage()==board[1][1].chess.getImage() && board[1][1].chess.getImage()==board[0][2].chess.getImage() && board[1][1].chess.getImage() != "circle.dotted"{
                return true
            }
        }
        
        return false
    }
}
