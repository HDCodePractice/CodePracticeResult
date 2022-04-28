import SwiftUI

struct GridItem: Identifiable,Hashable {
    var id = UUID()
    var connect: Connect
}

enum Connect {
    case green
    case black
    case greenWin
    case blackWin
    case nothing
}

extension Connect {
    var color:Color{
        switch self {
        case . green, . greenWin:
            return .green
        case .black, .blackWin:
            return .black
        case .nothing:
            return .white
        }
    }
    
    var imageName: String{
        switch self {
        case . green, .black, .nothing:
            return "circle.fill"
        case . greenWin, .blackWin:
            return "star.fill"
        }
    }
}

func checkHorizontal(row: Int, col: Int, target: Int) -> Bool {
    var index = 0
    if grid[row][col] == target {
        for i in 1 ... 3 {
            if col <= 4 {
                if grid[row][col+i] == target {
                    index += 1
                }
            }
        }
    }
    
    if index == 3 {
        return true
    }
    return false
}

func checkVertical(row: Int, col: Int, target: Int) -> Bool {
    var index = 0
    if grid[row][col] == target {
        for i in 1 ... 3 {
            if row >= 3 {
                if grid[row-i][col] == target {
                    index += 1
                }
            }
        }
    }
    
    if index == 3 {
        return true
    }
    return false
}

func checkDiagonal(row: Int, col: Int, target: Int) -> Bool {
    var index = 0
    var index2 = 0
    if grid[row][col] == target {
        for i in 1 ... 3 {
            if row >= 3 && col <= 4 {
                if grid[row-i][col+i] == target {
                    index += 1
                }
                
            }
            if row >= 3 && col >= 3 {
                if grid[row-i][col-i] == target {
                    index2 += 1
                }
            }
        }
    }
    if index == 3 || index2 == 3 {
        return true
    }
    return false
}

func checkOneWon() -> Bool {
    for eachRow in 0 ... 6 {
        for each in 0 ... 7 {
            if checkHorizontal(row: eachRow, col: each, target: 1) || checkVertical(row: eachRow, col: each, target: 1) || checkDiagonal(row: eachRow, col: each, target: 1) {
                return true
            }
        }
    }
    return false
}

func checkTwoWon() -> Bool {
    for eachRow in 0 ... 6 {
        for each in 0 ... 7 {
            if checkHorizontal(row: eachRow, col: each, target: 2) || checkVertical(row: eachRow, col: each, target: 2) || checkDiagonal(row: eachRow, col: each, target: 2) {
                return true
            }
        }
    }
    return false
}
