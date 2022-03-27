//
//  ViewModel.swift
//  chess
//
//  Created by sunny on 2022-03-26.
//

import Foundation

struct ViewModel{
    var gridSize = 9
    var grid : [[GridItem]] = []
    
    init(){
        for _ in 1 ... gridSize {
            var row : [GridItem] = []
            for _ in 1 ... gridSize {
                row.append(GridItem(chess: .nothing))
            }
            grid.append(row)
        }
    }
}
