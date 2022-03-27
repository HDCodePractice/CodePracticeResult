//
//  File.swift
//  go classwork 3-27-2022
//
//  Created by Bernie Zhang on 3/27/22.
//

import Foundation

struct ViewModel{
  var gridSize = 19
  var grid : [[GridItem]] = []
    
    init(){
        for i in 1...gridSize{
            var row :[GridItem] = []
            for j in 1...gridSize {
                switch (i,j){
                                case(1,1):
                                    row.append(GridItem(background: .topLeft, go: .nothing))
                                case(1,gridSize):
                                    row.append(GridItem(background: .topRight, go: .nothing))
                                case (1,(2...gridSize-1)):
                                    row.append(GridItem(background: .top, go: .nothing))
                                case ((2...gridSize-1),1):
                                    row.append(GridItem(background: .left, go: .nothing))
                                case ((2...gridSize-1),gridSize):
                                    row.append(GridItem(background: .right, go: .nothing))
                                case(gridSize,gridSize):
                                    row.append(GridItem(background: .bottomRight, go: .nothing))
                                case(gridSize,1):
                                    row.append(GridItem(background: .bottomLeft, go: .nothing))
                                case(gridSize,(2...gridSize-1)):
                                    row.append(GridItem(background: .bottom, go: .nothing))
                                case(gridSize/2,gridSize/2):
                                    row.append(GridItem(background: .midDot, go: .nothing))
                                default:
                                    row.append(GridItem(background: .mid, go: .nothing))
                                }

//                switch i {
//                case 1:
//                    switch j{
//                    case 1:
//                        row.append(GridItem(background: .topLeft, go: .nothing))
//                    case gridSize:
//                        row.append(GridItem(background: .topRight, go: .nothing))
//                    default:
//                        row.append(GridItem(background: .top, go: .nothing))
//                    }
//                case gridSize:
//                    switch j{
//                    case 1:
//                        row.append(GridItem(background: .bottomLeft, go: .nothing))
//                    case gridSize:
//                        row.append(GridItem(background: .bottomRight, go: .nothing))
//                    default:
//                        row.append(GridItem(background: .bottom, go: .nothing))
//                    }
//                default:
//                    switch j{
//                    case 1:
//                        row.append(GridItem(background: .left, go: .nothing))
//                    case gridSize:
//                        row.append(GridItem(background: .right, go: .nothing))
//                    default:
//                        row.append(GridItem(background: .mid, go: .nothing))
//                    }
//                }
                
            }
            grid.append(row)
        }
    }
}
