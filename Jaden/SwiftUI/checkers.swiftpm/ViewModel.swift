//
//  ViewModel.swift
//  checkers
//
//  Created by Jaden Cheung on 3/26/22.
//

import Foundation

class ViewModel{
    var gridSize = 8
    var grid : [[GridItem]] = []
    static var changer = 1
    
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
    }
    static func changePiece(item: GridItem) -> GridItem {
        print(changer)
        if changer == 1{
            changer = 2
            return GridItem(background: item.background, checker: .nothing)
        }else if changer == 2{
            changer = 1
            return GridItem(background: item.background, checker: .whiteKing)
        }
        return GridItem(background: item.background, checker: .nothing)
        
    }
}
