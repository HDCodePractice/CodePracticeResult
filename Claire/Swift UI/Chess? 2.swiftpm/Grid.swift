import SwiftUI

struct Grid{
    var x : Int
    var y : Int
    var color : Color
    var token : Token
    
    func isCanMove( board:[[Grid]], end: Grid) -> Bool{
        if token.color != .clear{
            if token.name == "Pawn"{
                return movePawn(board: board, end: end)
            }else if token.name == "Knight"{
                return moveKnight(board: board, end: end)
            } else if token.name == "Rook"{
                return moveRook(board: board, end: end)
            }
            return true
        }
        return false
    }
    
    func movePawn(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        // black
        if token.color == .black{
            // down and less 3 step
            if end.x - x > 0 && end.x - x <= 2 && end.y == y {
                    if end.x - x == 1{
                        path.append(end)
                    }else if x==1{ // only line 1 move2
                        path.append(end)
                        path.append(board[end.x-1][end.y])
                    }
                // when chess not on 2, only 1 step
            }
        }else{
            if end.x - x < 0 && x - end.x <= 2 && end.y == y{
                if x > 2 &&  x - end.x == 1{
                    path.append(end)
                }else if x==6{ 
                    path.append(end)
                    path.append(board[end.x+1][end.y])
                }
            }                
        }
        
        // first click
        if path.count > 0{
            return checkPath(path: path)
        }
        return false
    }
    
    func moveKnight(board: [[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        
        if abs(end.x-x) + abs(end.y-y) == 3 && end.x-x != 0 && end.y-y != 0{
            if token.color != end.token.color || end.token.color == .clear{
                path.append(end)
            }
            return checkPath(path: path)
        }
        return false
    }
    
    func moveRook(board:[[Grid]],  end: Grid) -> Bool{
        var path : [Grid] = []
        var pathOnLine : [Grid] = []
        
        // rook move front && back
        // rook move left && right
        
        // no diagnal
        
        // append the whole path into the pathOnLine
        // check the pathOnLine
        // return true or false
        
        if x == end.x{
            var starty = y
            var endy = end.y
            if y > end.y{
                starty = y
                endy = y
            }
            for i in starty..<endy {
                path.append(board[x][i])
            }
            return checkPath(path: path)
        } else if y == end.y {
            var startx = x
            var endx = end.x
            if x > end.x{
                startx = x
                endx = x
            }
            for i in startx..<endx {
                path.append(board[x][i])
            }
            return checkPath(path: path)
        }
        
        return false
    }
    
    func checkPath(path: [Grid])->Bool{
        for item in path{
            if item.token.color != .clear{
                return false
            }
        }
        return true
    }
}
