//
//  File.swift
//  go
//
//  Created by Bernie Zhang on 3/21/22.
//

import Foundation

struct ViewModel{
    var gridSize = 19
    var grid:[[GridItem]] = []
    
    init(){
        for i in 1...gridSize{
            var row:[GridItem] = []
            for j in 1...gridSize{
                row.append( GridItem(background: .mid, go: .nothing))
            }
            grid.append(row)
            grid[0][0] = GridItem(background: .topLeft, go: .nothing)
            grid[0][18] = GridItem(background: .topRight, go: .nothing)
//            grid[18][0] = GridItem(background: .bottomLeft, go: .nothing)
//            grid[18][18] = GridItem(background: .bottomRight, go: .nothing)
//            for j in 1...gridSize{
//                if i == 1{
//                    row = [GridItem(background: .topLeft, go: .nothing)]
//                    for c in 1...gridSize-2 {
//                        row.append(GridItem(background: .top, go: .nothing))
//                    }
//                    row.append(GridItem(background: .topRight, go: .nothing))
//                    grid.append(row)
//                }else if 1 < i && i < 19 {
//                    row = [GridItem(background: .left, go: .nothing)]
//                    for d in 1...gridSize-2 {
//                        row.append(GridItem(background: .mid, go: .nothing))
//                    }
//                    row.append(GridItem(background: .right, go: .nothing))
//                    grid.append(row)
//                }else if i == 19{
//                    row = [GridItem(background: .bottomLeft, go: .nothing)]
//                    for e in 1...gridSize-2 {
//                        row.append(GridItem(background: .bottom, go: .nothing))
//                    }
//                    row.append(GridItem(background: .bottomRight, go: .nothing))
//                    grid.append(row)
//                }
//
//            }
//            var rowTop:[GridItem] = []
//            var rowBottom:[GridItem] = []
//            var rowMid:[GridItem] = []
//            for j in 1...gridSize{
//                if i == 1 && j == 1 {
//                    rowTop.append(GridItem(background: .topLeft, go: .nothing))
//                }else if i == 1 && 1 < j && j < 19{
//                    rowTop.append(GridItem(background: .top, go: .nothing))
//                }else if i == 1 && j == 19{
//                    rowTop.append(GridItem(background: .topRight, go: .nothing))
//                }else if !(i == 1) && !(i == 19) && j == 1 {
//                    rowMid.append(GridItem(background: .left, go: .nothing))
//                }else if !(i == 1) && !(i == 19) && 1 < j && j < 19 {
//                    rowMid.append(GridItem(background: .mid , go: .nothing))
//                }else if !(i == 1) && !(i == 19) && j == 19 {
//                    rowMid.append(GridItem(background: .right , go: .nothing))
//                }else if i == 19 && j == 1 {
//                    rowBottom.append(GridItem(background: .bottomLeft, go: .nothing))
//                }else if i == 19 && 1 < j && j < 19{
//                    rowBottom.append(GridItem(background: .bottom, go: .nothing))
//                }else if i == 19 && j == 19{
//                    rowBottom.append(GridItem(background: .bottomRight, go: .nothing))
//                }
//            }
//            grid.append(rowTop)
//            grid.append(rowMid)
//            grid.append(rowBottom)
       }
                    grid[18][0] = GridItem(background: .bottomLeft, go: .nothing)
                    grid[18][18] = GridItem(background: .bottomRight, go: .nothing)
        for i in 1...17{
            grid[0][i] = GridItem(background: .top, go: .nothing)
            grid[i][0] = GridItem(background: .left, go: .nothing)
            grid[18][i] = GridItem(background: .bottom, go: .nothing)
            grid[i][18] = GridItem(background: .right, go: .nothing)
        }
        let array = [3,9,15]
        for x in array{
            for y in array{
                grid[x][y] = GridItem(background: .midDot, go: .nothing)
            }
        }
//        grid[3][3] = GridItem(background: .midDot, go: .nothing)
//        grid[3][9] = GridItem(background: .midDot, go: .nothing)
//        grid[3][15] = GridItem(background: .midDot, go: .nothing)
//        grid[9][3] = GridItem(background: .midDot, go: .nothing)
//        grid[9][9] = GridItem(background: .midDot, go: .nothing)
//        grid[9][15] = GridItem(background: .midDot, go: .nothing)
//        grid[15][3] = GridItem(background: .midDot, go: .nothing)
//        grid[15][9] = GridItem(background: .midDot, go: .nothing)
//        grid[15][15] = GridItem(background: .midDot, go: .nothing)
        //        grid[9][9].go = .black
        //        grid[9][10].go = .white
        //        grid[10][9].go = .black
        //        grid[10][10].go = .white
    }
}
