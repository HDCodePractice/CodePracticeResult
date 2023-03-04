import SwiftUI

struct ViewModel{
    var board : [[Grid]] = []
    var last : Grid? = nil
    
    init(){
        let lastChess = ["Rook", "Knight", "Bishop", "Queen", "King", "Bishop", "Knight", "Rook"]
        let pawns = ["Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn", "Pawn"]
        let nothing = ["", "", "", "", "", "", "", ""]
        board = []
        board.append(genLineFromArray(x: 0, array: lastChess, tokenColor: .black))
        board.append(genLineFromArray(x: 1, array: pawns, tokenColor: .black))
        for i in 2...5{
            board.append(genLineFromArray(x: i, array: nothing, tokenColor: .clear))
        }
        board.append(genLineFromArray(x: 6, array: pawns, tokenColor: .white))
        board.append(genLineFromArray(x: 7, array: lastChess, tokenColor: .white))
    }
    
    func genLineFromArray(x: Int, array : [String], tokenColor: Color)->[Grid]{
        var lineChess : [Grid] = []
        for index in 0..<array.count{
            lineChess.append( Grid(x: x, y: index, color: (index+x)%2==0 ? .init(hue: 1, saturation: 0, brightness: 0.7, opacity: 1) : .gray , token: Token(name: array[index], color: tokenColor)))
        }
        return  lineChess
    }
    
    mutating func tapGrid(grid: Grid){
        if let last, last.token.color != .clear && grid.token.color != last.token.color{
            if last.isCanMove(board: board, end: grid,checks:true){
                self.last = nil
                board[grid.x][grid.y].token = last.token
                board[last.x][last.y].token = Token(name: "", color: .clear)
            }
        }else{
            self.last = grid
        }
    }
    func checkGrid(board: [[Grid]],move: Grid, to: Grid)->Bool{
        print("1")
        if move.token.color != .clear && to.token.color != move.token.color{
             print("2")
            if move.isCanMove(board: board, end: to,checks:false){
                print("3")
                return true
            }
            return false
        }else{
        return false
        }
    }
}
// down at bottom read grid
