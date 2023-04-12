//
//  moveChess.swift
//  Chinese Chess
//
//  Created by Hendry shao on 2023-03-24.
//
import SwiftUI
struct Grid{
    var x : Int
    var y : Int
    var color : Color
    var token : Token
    func isCanMove( board:[[Grid]], end: Grid) -> Bool{
        if token.name == "bin" || token.name == "zu"{
                    return movePawn(board: board, end: end)
                }else if token.name == "ma" || token.name == "heiMa"{
                    return moveKnight(board: board, end: end)
                }else if token.name == "che" || token.name == "ma"{
                    return moveRook(board: board, end: end)
                }else if token.name == "xiang" || token.name == "heiXiang"{
                    return moveBishop(board: board, end: end)
                }
        return true
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
            for i in startx...endx{
                path.append(board[i][j])
                j += stepy
            }
            return checkPath(path: path)
        }
        return false
    }


    func moveKnight(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        var endx = end.x
        var endy = end.y
        if x != endx && y != endy && abs(endx-x)+abs(endy-y) == 3{
            if endy - y == 2{
                if token.color != end.token.color || end.token.color == .clear{
                    path.append(end)
                }
            }
            return checkPath(path: path)
        }
        return false
    }

    func movePawn(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        if token.color == .black{
            if y < 5{
                if (end.x - x == -1 && end.y-y == 0) || (end.x-x == 0 && abs(end.y-y) == 1){
                    path.append(end)
                }
            }else if y >= 5{
                if end.x - x == -1{
                    path.append(end)
                }
            }
        }else{
            if y >= 5{
                if (end.x - x == -1 && end.y-y == 0) || (end.x-x == 0 && abs(end.y-y) == 1){
                    path.append(end)
                }
            }else if y < 5{
                if end.x - x == -1{
                    path.append(end)
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
        for item in path{
            if item.token.color != .clear{
                return false
            }
        }
        return true
    }
    

}
