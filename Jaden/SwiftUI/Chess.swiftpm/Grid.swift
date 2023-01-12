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
        }
        return true
    }
    
    func moveBishop(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        var starty = y
        var endy = end.y
        if y > end.y {
            starty = end.y
            endy = y
        }
        var startx = x
        var endx = end.x
        if x > end.x {
            startx = end.x
            endx = x
        }
        
        for i in startx+1..<endx{
            for j in starty+1..<endy{
                if i == j{
                    path.append(board[i][j])
                }
                
            }
            
        }
        return checkPath(path: path)
        
        return false
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
            for i in starty+1..<endy{
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
            for i in startx+1..<endx{
                path.append(board[i][y])
            }
            return checkPath(path: path)
        }
        return false
    }
    
    
    func moveKnight(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        
        if abs(end.x-x)+abs(end.y-y) == 3{
            if token.color == end.token.color || end.token.color == .clear{
                path.append(end)
            }
            return checkPath(path: path)
        }
        return false
    }
    
    func movePawn(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        //        print(self)
        //        print(end)
        // black
        if token.color == .black{
            // down and less 3 step
            if end.x - x > 0 && end.x - x <= 2 && end.y == y{
                // when chess not on 2, only 1 step
                if end.x - x == 1{
                    path.append(end)
                }else if x==1{ // only line 1 move2
                    path.append(end)
                    path.append(board[end.x-1][end.y])
                }
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
        
        if path.count > 0{
            return checkPath(path: path)
        }
        return false
        
    }
    
    func checkPath(path: [Grid])->Bool{
        print(path)
        for item in path{
            if item.token.color != .clear{
                return false
            }  
            
        }
        return true
    }
}
