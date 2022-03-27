//
//  File.swift
//  checkers
//
//  Created by Bernie Zhang on 3/19/22.
//

import Foundation

struct ViewModel{
    var gridSize = 8
    var grid:[[GridItem]] = []
    
    init(){
        for i in 1...gridSize{
            var row:[GridItem] = []
            for j in 1...gridSize{
                if (i+j)%2 == 0{
                    row.append(GridItem(background: .black, chess: .nothing))
                }else{
                    row.append(GridItem(background: .white, chess: .nothing))
                }
            }
            grid.append(row)
        }
        grid[3][3].chess = .black
        grid[3][4].chess = .blackKing
        grid[4][3].chess = .white
        grid[4][4].chess = .whiteKing
    }
}
