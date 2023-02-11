import SwiftUI

struct Grid{
    var x : Int
    var y : Int
    var color : Color
    var token : Token
    
    func isCanMove( board:[[Grid]], end: Grid) -> Bool{
        if token.name == "Pawn"{
            return movePawn(board: board, end: end)
        }else if token.name == "Knight"{
            return moveKnight(board: board, end: end)
        }else if token.name == "Rook"{
            return moveRook(board: board, end: end)
        }else if token.name == "Bishop"{
            return moveBishop(board: board, end: end)
        }else if token.name == "Queen"{
            return moveQueen(board: board, end: end)
        }
        return true
    }
    func moveBishop(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        if abs(end.x-x)==abs(end.y-y) && end.token.color != token.color{
            var startx = x
            var starty = y
            var endx = end.x
            var stepy = 1
            
            if end.x>x{
                if end.y>y{
                    // startx ... endx y+1
                    startx = x+1
                    endx = end.x
                    stepy = 1
                    starty = y+1
                }else{
                    // startx ... endx y-1
                    startx = x+1
                    endx = end.x
                    stepy = -1
                    starty = y-1
                }
            }else{
                if end.y>y{
                    // end.x ... x y+1 
                    startx = end.x
                    endx = x-1
                    stepy = -1
                    starty = end.y
                }else{
                    // end.x ... x y+1
                    startx = end.x
                    endx = x-1
                    stepy = 1
                    starty = end.y
                }
            }
            
            var j = starty
            path.append(board[x][y])
            for i in startx...endx{
                path.append(board[i][j])
                j += stepy
            }
            return checkPath(path: path)
        }
        return false
    }
    func moveQueen(board:[[Grid]], end: Grid)-> Bool{
        if x==end.x && y==end.y{
            return false
        }else if end.x==x || end.y == y{
            return moveRook(board:board, end: end)
        }else if abs(end.x-x)==abs(end.y-y){
            return moveBishop(board:board, end: end)
        }else{
            return false
        }
    }
    func moveRook(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        if x == end.x{
            var starty = y
            var endy = end.y
            if y > end.y {
                starty = end.y
                endy = y
            }
            for i in starty..<endy{
                path.append(board[x][i])
            }
            return checkPath(path: path)
        }else if y == end.y{
            var startx = x
            var endx = end.x
            if x > end.x {
                startx = end.x
                endx = x
            }
            for i in startx..<endx{
                path.append(board[i][y])
            }
            return checkPath(path: path)
        }
        return false
    }
    func moveKnight(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        
        if x != end.x && y != end.y && abs(end.x-x)+abs(end.y-y) == 3{
                path.append(end)
            return checkPath(path: path)
        }
        return false
    }
    func movePawn(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        if end.y == y{
            if abs(end.x-x) == 2{
                if token.color == .black{
                    if x == 1 && end.x > x{
                        path.append(board[x][y])
                        path.append(board[x+1][y]) 
                        path.append(end)
                    }
                }else{
                    if x == 6 && end.x < x{ 
                        path.append(board[x][y])
                        path.append(board[x-1][y]) 
                        path.append(end)
                    }
                }
            }
            if abs(end.x-x) == 1{
                if token.color == .black{
                    if end.x > x{
                        path.append(board[x][y])
                        path.append(end)
                    }
                }else{
                    if end.x < x{
                        path.append(board[x][y])
                        path.append(end)
                    }
                }
            }
        }
        if path.count > 0{
            return checkPath(path: path)
        }
        return false
    }
    // check path
    func checkPath(path: [Grid])->Bool{
        var path2 : [Grid] = path
        path2.remove(at: 0)
        for item in path2{
            if item.token.color != .clear{
                if item.token.color != path[0].token.color && item.x == path2[path2.count-1].x && item.y == path2[path2.count-1].y{
                    return true
                }
                return false
            }
        }
        return true
    }
}
