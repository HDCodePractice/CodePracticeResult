//
//  File.swift
//  BenChessApp
//
//  Created by Lei Zhou on 3/20/22.
//

import Foundation
struct ChessViewModel {
    var gridSize = 8
    var grid : [[GridItem]] = []
    init(){
        for i in 1...gridSize{
            var row : [GridItem] = []
            for j in 1...gridSize{
                if (i+j)%2 == 0 {
//                    if (i <= 3){
//                row.append(GridItem(background:  GridBackGround.black , chess: .white))
//                    }
//                    else if (i > gridSize - 3){
//                        row.append(GridItem(background:  GridBackGround.black , chess: .black))
//                    } else{
                        row.append(GridItem(background:  GridBackGround.black , chess: .nothing))
//                    }
                }
                    else {
                        row.append(GridItem(background:  GridBackGround.white , chess: .nothing))
                    }
            }
            grid.append(row)
        }
    }
}
