import SwiftUI
// down at bottom read
  var vm = ViewModel()
  var canCastle = [[1,1],[1,1]]
struct Grid{
    var x : Int
    var y : Int
    var color : Color
    var token : Token
    func isCanMove(board:[[Grid]], end: Grid, checks:Bool) -> [Bool]{
        var ans = false
        if token.name == "Pawn"{
            ans = movePawn(board: board, end: end,checks:checks)
        }else if token.name == "Knight"{
            ans = moveKnight(board: board, end: end,checks:checks)
        }else if token.name == "Rook"{
            ans = moveRook(board: board, end: end,checks:checks)
        }else if token.name == "Bishop"{
            ans = moveBishop(board: board, end: end,checks:checks)
        }else if token.name == "Queen"{
            ans = moveQueen(board: board, end: end,checks:checks)
        }else if token.name == "King"{
            ans = moveKing(board: board, end: end,checks:checks)
        }else{
            ans = true
        }
        if ans == true{
                return [true,false]
        }else{
            return [false,false]
        }
    }
    func moveBishop(board:[[Grid]], end: Grid, checks:Bool) -> Bool{
        var path : [Grid] = []
        if abs(end.x-x)==abs(end.y-y) && end.token.color != token.color{
            var xValue = 1
            var yValue = 1
            if end.x > x{
                xValue = 1
            }else if end.x < x{
                xValue = -1
            }
            if end.y > y{
                yValue = 1
            }else if end.y < y{
                yValue = -1
            }
            for i in 0...abs(end.x-x){
                path.append(board[x+i*xValue][y+i*yValue])
            }
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }
        return false
    }
    func moveQueen(board:[[Grid]], end: Grid, checks:Bool)-> Bool{
        if x==end.x && y==end.y{
            return false
        }else if end.x==x || end.y == y{
            return moveRook(board:board, end: end,checks:checks)
        }else if abs(end.x-x)==abs(end.y-y){
            return moveBishop(board:board, end: end,checks:checks)
        }else{
            return false
        }
    }
    func moveRook(board:[[Grid]], end: Grid, checks:Bool) -> Bool{
        var path : [Grid] = []
        if x == end.x{
            if y > end.y{
                for i in end.y...y{
                    path.append(board[x][i])
                }
                path=path.reversed()
            }else{
                for i in y...end.y{
                    path.append(board[x][i])
                }
            }
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }else if y == end.y{
            if x > end.x{
                for i in end.x...x{
                    path.append(board[i][y])
                }
                path=path.reversed()
            }else{
                for i in x...end.x{
                    path.append(board[i][y])
                }
            }
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }
        return false
    }
    func moveKnight(board:[[Grid]], end: Grid, checks:Bool) -> Bool{
        var path : [Grid] = []
        
        if x != end.x && y != end.y && abs(end.x-x)+abs(end.y-y) == 3{
            path.append(board[x][y])
                path.append(end)
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }
        return false
    }
    func movePawn(board:[[Grid]], end: Grid, checks:Bool) -> Bool{
        var path : [Grid] = []
            if abs(end.x-x) == 2{
                if abs(end.y-y)==0{
                    if token.color == .black{
                        if x == 1 && end.x > x{
                            path.append(board[x][y])
                            path.append(board[x+1][y]) 
                            path.append(end)
                            path.append(end)
                        }
                    }else{
                        if x == 6 && end.x < x{ 
                            path.append(board[x][y])
                            path.append(board[x-1][y]) 
                            path.append(end)
                            path.append(end)
                        }
                    }
                }
            }
            if abs(end.x-x) == 1{
                if token.color == .black{
                    if end.x > x{
                        if abs(end.y-y) == 1{
                            if end.token.color != .clear && end.token.color != board[x][y].token.color{
                                path.append(board[x][y])
                                path.append(end)
                            }
                        }else if abs(end.y-y)==0{
                            path.append(board[x][y])
                            path.append(end)
                            path.append(end)
                        }
                    }
                }else{
                    if end.x < x{
                        if abs(end.y-y) == 1{
                            if end.token.color != .clear && end.token.color != board[x][y].token.color{
                                path.append(board[x][y])
                                path.append(end)
                            }
                        }else if abs(end.y-y)==0{
                            path.append(board[x][y])
                            path.append(end)
                            path.append(end)
                        }
                    }
                }
            }
        if path.count > 0{
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }
        return false
    }
    func moveKing(board:[[Grid]], end: Grid, checks:Bool) -> Bool{
        var path : [Grid] = []
        if abs(end.x-x) < 2 && abs(end.y-y) < 2{
            if abs(end.x-x)==0 && abs(end.y-y)==0{
                
            }else{
                path.append(board[x][y])
                path.append(end)
            }
        }
        if path.count > 0{
            if checks{
                return checkPath(board: board,path: path)
            }else{
                return checkPathNoChecks(board: board,path: path)
            }
        }
        return false
    }
    func findCheck(board:[[Grid]],color:Color)->Bool{
        var location : [Int] = []
        for i in 0...7{
            for j in 0...7{
                if board[i][j].token.name == "King" && board[i][j].token.color == color{
                    location = [i,j]
                }
            }
        }
        for i in 0...7{
            for j in 0...7{
                if vm.checkGrid(board: board,move: board[i][j], to: board[location[0]][location[1]]){
                        return true
                    }
            }
        }
        return false
    }
    // check path
    func checkPath(board:[[Grid]],path: [Grid])->Bool{
        if path.count < 1{
            return false
        }
            for i in 0...(path.count-2){
                if path[i].token.color != .clear && i != 0{
                    return false
                    
                }
            }
            if path.last!.token.color == path[0].token.color{
                return false
            }
        var board2 = board
        board2[path[0].x][path[0].y].token = Token(name: "", color: .clear, move: false)
        board2[path.last!.x][path.last!.y].token = path[0].token
        if findCheck(board:board2,color: path[0].token.color){
            return false
        }
        return true
    }
     func checkPathNoChecks(board:[[Grid]],path: [Grid])->Bool{
            for i in 0...(path.count-2){
                if path[i].token.color != .clear && i != 0{
                    return false
                    
                }
            }
            if path.last!.token.color == path[0].token.color{
                return false
            }
            return true
    }
    func findCheckMate(board:[[Grid]],color: Color)->Bool{
        
        return true
    }
}
