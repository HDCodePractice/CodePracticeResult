//
//  ViewModel.swift
//  draughtSample
//
//  Created by sunny on 2022-03-20.
//

import Foundation


struct ViewModel{
    var gridSize = 8
    var grid : [[GridItem]] = []
    
    init(){
        for i in 1 ... gridSize {
            var row : [GridItem] = []
            for j in 1 ... gridSize {
                if (i+j)%2 == 0{
                    row.append(GridItem(background: .black, chess: .nothing))
                }else{
                    row.append(GridItem(background: .white, chess: .nothing))
                }
            }
            grid.append(row)
        }
        //grid[4][4].chess = .blackKing
    }  
}
