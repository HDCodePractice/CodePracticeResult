import Foundation
import SwiftUI

struct ViewModel{
    var gridWidth = 8
    var gridHeight = 7
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[GridItem]] = []
    
    init(){
        for _ in 1 ... gridWidth  {
            var col : [GridItem] = []
            for _ in 1 ... gridHeight {
                col.append(GridItem(connect:.nothing))
            }
            grid.append(col)
        }
    }
    func tapColumn(column: [GridItem]) -> [GridItem] {
        var rColumn = column
        for i in 0..<rColumn.count {
            rColumn[i] = GridItem(connect: checkOneWin())
        }
        return rColumn
    }
    func checkOneWin()->Connect{
        var row = 0
        var col = 0
        var diagonal = 0
        for i in grid{
            for j in i {
                if j.connect == .green {
                    row += 1
                } else {
                    if row < 4 {
                        row = 0
                    }
                }
            }
        }
        for j in 0...7 {
            for i in grid {
                if i[j].connect == .green {
                    col += 1
                } else {
                    if col < 4 {
                        col = 0
                    }
                }
            }
        }
        for i in 0...7 {
            for j in 0...7 {
                if grid[i][j].connect == .green {
                    diagonal += 1
                } else {
                    if diagonal < 4 {
                        diagonal = 0
                    }
                }
            }
        }
        if row >= 4 || col >= 4 {
            return .greenWin
        } else {
            return .green
        }
    }

    func checkTwoWin()->Connect{
        var row = 0
        var col = 0
        var diagonal = 0
        for i in grid {
            for j in i {
                if j.connect == .black {
                    row += 1
                } else {
                    if row < 4 {
                        row = 0
                    }
                }
            }
        }
        for j in 0...7 {
            for i in grid {
                if i[j].connect == .black {
                    col += 1
                } else {
                    if col < 4 {
                        col = 0
                    }
                }
            }
        }
        for i in 0...7 {
            for j in 0...7 {
                if grid[i][j].connect == .black {
                    diagonal += 1
                } else {
                    if diagonal < 4 {
                        diagonal = 0
                    }
                }
            }
        }
        if row >= 4 || col >= 4 {
            return .blackWin
        } else {
            return .black
        }
    }
}
