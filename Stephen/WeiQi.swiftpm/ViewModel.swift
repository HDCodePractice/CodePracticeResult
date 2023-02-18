//
//  ViewModel.swift
//  WeiQi
//
//  Created by stephen on 27/3/2022.
//

import Foundation

struct ViewModel{
    var gridSize = 19
//    var grid : [[GridItem]] = [[
//        GridItem(background : .topLeft, go: .nothing),
//        GridItem(background : .top, go: .nothing),
//        GridItem(background : .top, go: .nothing),
//        GridItem(background : .top, go: .nothing),
//        GridItem(background : .top, go: .nothing),
//        GridItem(background : .top, go: .nothing),
//      ]]
    var grid : [[GridItem]] = [[]]
    
    init() {
        for i in 1 ... gridSize{
            var row : [GridItem] = []
            for j in 1 ... gridSize{
                switch i{
                case 1:
                    switch j {
                    case 1:
                        row.append(GridItem(background: .topLeft, go: .nothing))
                    case gridSize:
                        row.append(GridItem(background:.topRight, go:.nothing))
                    default:
                        row.append(GridItem(background: .top, go: .nothing))
                    }
                case gridSize:
                    switch j {
                    case 1:
                        row.append(GridItem(background: .bottomLeft, go: .nothing))
                    case gridSize:
                        row.append(GridItem(background:.bottomRight, go:.nothing))
                    default:
                        row.append(GridItem(background: .bottom, go: .nothing))
                    }
                default:
                    switch j {
                    case 1:
                        row.append(GridItem(background:.left, go:.nothing))
                    case gridSize:
                        row.append(GridItem(background:.right, go:.nothing))
                    default:
                        row.append(GridItem(background:.mid, go:.nothing))
                    }
                }
            }
            grid.append(row)
        }
    }
}
