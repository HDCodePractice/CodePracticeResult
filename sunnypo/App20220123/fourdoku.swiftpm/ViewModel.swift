//
//  ViewModel.swift
//  fourdoku
//
//  Created by sunny on 2022-04-20.
//

import Foundation

struct ViewModel{
    var gridSize = 4
    var grid : [[GridItem]] = []
    init(){
        for _ in 1 ... gridSize {
            var row : [GridItem] = []
            for _ in 1 ... gridSize {
                row.append(GridItem(numberButton: .nothing))
            }
            grid.append(row)
        }
    }
}

