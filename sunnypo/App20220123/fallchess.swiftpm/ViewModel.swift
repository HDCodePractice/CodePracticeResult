//
//  ViewModel.swift
//  fallchess
//
//  Created by sunny on 2022-04-02.
//

import Foundation


struct ViewModel{
    var gridSize = 7
    var grid : [[GridItem]] = []
    
    init(){
        for _ in 2 ... gridSize {
            var row : [GridItem] = []
            for _ in 1 ... gridSize {
                row.append(GridItem(chess: .nothing))
            }
            grid.append(row)
        }
    }
}
