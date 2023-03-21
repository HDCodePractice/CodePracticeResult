import SwiftUI

struct ViewModel{
    var board : [[Grid]] = []
    var last : Grid? = nil
    var mate : Color = .clear
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
            lineChess.append( Grid(x: x, y: index, color: (index+x)%2==0 ? .init(hue: 1, saturation: 0, brightness: 0.7, opacity: 1) : .gray , token: Token(name: array[index], color: tokenColor, move: false )))
        }
        return  lineChess
    }
    
    mutating func tapGrid(grid: Grid){
        print("hi x0.5")
        if let last, last.token.color != .clear{
            if grid.token.name == "Rook" && board[grid.x][grid.y].token.color == board[last.x][last.y].token.color {
                if grid.y>last.y{
                    if last.checkPath(board:board ,path:[board[last.x][last.y],board[last.x][last.y+1]]){
                        if last.checkPath(board:board, path:[board[last.x][last.y],board[last.x][last.y+2]]){
                            if board[last.x][last.y].token.move == false && grid.token.move==false{
                                self.last = nil
                                board[last.x][last.y+2].token = last.token
                                board[last.x][last.y+2].token.move = true
                                board[last.x][last.y].token = Token(name: "", color: .clear, move: false)
                                board[last.x][last.y+1].token = grid.token
                                board[last.x][last.y+1].token.move = true
                                board[grid.x][grid.y].token = Token(name: "", color: .clear, move: false)
                            }else{
                                self.last = grid   
                            }
                        }else{
                            self.last = grid 
                        }
                    }else{
                        self.last = grid   
                    } 
                }else{
                    if last.checkPath(board:board ,path:[board[last.x][last.y],board[last.x][last.y-1]]){
                        if last.checkPath(board:board, path:[board[last.x][last.y],board[last.x][last.y-2]]){
                            if last.checkPath(board:board, path:[board[last.x][last.y],board[last.x][last.y-3]]){
                                if board[last.x][last.y].token.move == false && grid.token.move==false{
                                    self.last = nil   
                                    board[last.x][last.y-2].token = last.token
                                    board[last.x][last.y-2].token.move = true
                                    board[last.x][last.y].token = Token(name: "", color: .clear, move: false)
                                    board[last.x][last.y-1].token = grid.token
                                    board[last.x][last.y-1].token.move = true
                                    board[grid.x][grid.y].token = Token(name: "", color: .clear, move: false)
                                }else{
                                    self.last = grid   
                                }
                            }else{
                                self.last = grid   
                            }
                        }else{
                            self.last = grid 
                        }
                    }else{
                        self.last = grid
                    }
                }
            }else{
                print("hi")
                let a = (last.isCanMove(board: board, end: grid,checks:true))
                if a[0]{
                    if a[1] == true{
                        mate = last.token.color
                    }
                    self.last = nil
                    board[grid.x][grid.y].token = last.token
                    board[grid.x][grid.y].token.move = true
                    board[last.x][last.y].token = Token(name: "", color: .clear, move: false)
                }
            }
        }else{
            self.last = grid
        }
    }
    func checkGrid(board: [[Grid]],move: Grid, to: Grid)->Bool{
        print("1")
        if move.token.color != .clear && to.token.color != move.token.color{
            print("2")
            if move.isCanMove(board: board, end: to,checks:false)[0]{
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
