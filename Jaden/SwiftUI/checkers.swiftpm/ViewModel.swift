//
//  ViewModel.swift
//  checkers
//
//  Created by Jaden Cheung on 3/26/22.
//

import Foundation

struct ViewModel{
    var gridSize = 8
    var grid : [[GridItem]] = []
    
    init(){
            // 按gridSize初始化 grid
            for i in 1 ... gridSize {
                var row : [GridItem] = []
                for j in 1 ... gridSize {
                    row.append(GridItem(
                        background: (i+j)%2 == 0 ? .black : .white,
                                checker: .nothing
                ))
            }
            grid.append(row)
        }
//            grid[0][0].checker = .black
//            grid[3][4].checker = .blackKing
//            grid[4][3].checker = .white
//            grid[4][4].checker = .whiteKing
//            grid[4][5].checker = .blackKing
    }
}
