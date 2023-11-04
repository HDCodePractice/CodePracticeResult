import SwiftUI

struct putChess{
    var board : [[Grid]] = []
    var last : Grid? = nil
    
    init(){
        let lastChess = ["che", "ma", "xiang", "shi", "shuai", "shi", "xiang", "ma","che"]
        let pawns = ["bin", "", "bin", "", "bin", "", "bin", "","bin"]
        let blackPawns = ["zu", "", "zu", "", "zu", "", "zu", "","zu"]
        let heiPao = ["","heiPao","","","","","","heiPao",""]
        let pao = ["","pao","","","","","","pao",""]
        let nothing = ["", "", "", "", "", "", "", "",""]
        let blackChess = ["heiChe","heiMa","heiXiang","heiShi","jiang","heiShi","heiXiang","heiMa","heiChe"]
        board = []
        
        board.append( genLineFromArray(x: 0, array: blackChess, tokenColor: .black))
        board.append( genLineFromArray(x: 1, array: nothing, tokenColor: .clear))
        board.append( genLineFromArray(x: 2, array: heiPao, tokenColor: .black))
        board.append( genLineFromArray(x: 3, array: blackPawns, tokenColor: .black))
        for i in 4...5{
            board.append( genLineFromArray(x: i, array: nothing, tokenColor: .clear))
        }
        board.append( genLineFromArray(x: 6, array: pawns, tokenColor: .white))
        board.append( genLineFromArray(x: 7, array: pao, tokenColor: .white))
        board.append( genLineFromArray(x: 8, array: nothing, tokenColor: .clear))
        board.append( genLineFromArray(x: 9, array: lastChess, tokenColor: .white))
    }
    
    func genLineFromArray(x: Int, array : [String], tokenColor: Color)->[Grid]{
        var lineChess : [Grid] = []
        for index in 0..<array.count{
            lineChess.append( Grid(x: x, y: index, color: (index+x)%2==0 ? .white : .black , token: Token(name: array[index], color: tokenColor)))
        }
        return  lineChess
    }
    
    mutating func tapGrid(grid: Grid){
        if let last, last.token.color != .clear && grid.token.color != last.token.color{
            if last.isCanMove(board: board, end: grid){
                self.last = nil
                board[grid.x][grid.y].token = last.token
                board[last.x][last.y].token = Token(name: "", color: .clear)
            }
        }else{
            self.last = grid
        }
    }
}
