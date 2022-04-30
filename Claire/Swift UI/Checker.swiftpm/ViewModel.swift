//
//  ViewModel.swift
//  Checker
//
//  Created by Qianji Yao on 2022/3/26.
//

import Foundation

//struct ViewModel{
//    var gridSize = 8
//    var grid : [[GridItem]] = []
//
//    init(){
//        // 按gridSize初始化 grid
//        for i in 1 ... gridSize {
//            var row : [GridItem] = []
//            for j in 1 ... gridSize {
//                row.append(GridItem(
//                            background: (i+j)%2 == 0 ? .black : .white,
//                            checker: .nothing
//                ))
//            }
//            grid.append(row)
//        }
//        grid[0][0].checker = .black
//        grid[3][4].checker = .blackKing
//        grid[4][3].checker = .white
//        grid[4][4].checker = .whiteKing
//    }
//}
//

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
            var col : [Connect] = []
            for _ in 1 ... gridHeight {
                col.append(GridItem(connect: .nothing))
            }
            grid.append(col)
        }
    }
}

