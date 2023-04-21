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
        if token.color == .black{
            if abs(end.x-x + end.y-y) == 4{
                if token.color == .white{
                    if end.x <= 5{
                        path.append(end)
                        if end.x-x > 0 && end.y-y > 0{
                            path.append(board[end.x-1][end.y-1])
                        }else if end.x-x > 0 && end.y-y < 0{
                            path.append(board[end.x+1][end.y-1])
                        }
                    }
                }
                path.append(end)
                return checkPath(path: path)
            }
        }
        
        return false
    }


    func moveKnight(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        var endx = end.x
        var endy = end.y
        if x != endx && y != endy && abs(endx-x)+abs(endy-y) == 3{
            if endy - y == 2{
                path.append(end)
                path.append(board[x][y+1])
            }else if endy - y == -2{
                path.append(end)
                path.append(board[x][y-1])
            }else if endx-x == 2 {
                path.append(end)
                path.append(board[x+1][y])
            }else if endx - x == -2{
                path.append(end)
                path.append(board[x-1][y])
            }
            return checkPath(path: path)
        }
        return false
    }

    func movePawn(board:[[Grid]], end: Grid) -> Bool{
        var path : [Grid] = []
        if token.color == .black{
            if x < 5{
                if (end.x - x == -1 && end.y-y == 0) || (end.x-x == 0 && abs(end.y-y) == 1){
                    path.append(end)
                }
            }else if x >= 5{
                if end.y - y == -1{
                    path.append(end)
                }
            }
        }else{
            if x >= 5{
                if (end.x - x == -1 && end.y-y == 0) || (end.x-x == 0 && abs(end.y-y) == 1){
                    path.append(end)
                }
            }else if x < 5{
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
