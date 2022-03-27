//
//  File.swift
//  BenChessApp
//
//  Created by Lei Zhou on 3/20/22.
//

import Foundation
struct ChessViewModel {
    var gridSize = 19
    var grid : [[GridItem]] = []
    var isSwitch : Bool = true
    init(){
        for i in 1...gridSize{
            var row : [GridItem] = []
            for j in 1...gridSize{
                        row.append(GridItem(background:  GridBackGround.black , chess: .nothing))
                }
            grid.append(row)
        }
    }
}

