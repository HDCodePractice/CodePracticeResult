//
//  ViewModel.swift
//  connect4
//
//  Created by stephen on 3/4/2022.
//

import Foundation

struct ViewModel{
    var gridRow = 7
    var gridColume = 6
    var grid :[[GridItem]] = [[]]
    
    init(){
        for i in 1 ... gridRow{
            var row : [GridItem] = []
            for j in 1 ... gridColume{
                switch i{
                case 1:
                    switch j{
                    case 1:
                        row.append(GridItem(background: .topLeft, connect4: .nothing))
                    case gridColume:
                        row.append(GridItem(background: .topRight, connect4: .nothing))
                    default:
                        row.append(GridItem(background: .mid, connect4: .nothing))
                    }
                case gridRow:
                    switch j{
                    case 1:
                        row.append(GridItem(background: .bottomLeft, connect4: .nothing))
                    case gridColume:
                        row.append(GridItem(background: .bottomRight, connect4: .nothing))
                    default:
                        row.append(GridItem(background: .mid, connect4: .nothing))
                    }
                default:
                        switch j{
                        case 1:
                            row.append(GridItem(background: .mid, connect4: .nothing))
                        case gridColume:
                            row.append(GridItem(background: .mid, connect4: .nothing))
                        default:
                            row.append(GridItem(background: .mid, connect4: .nothing))
                            
                        }
                }
            }
        }
    }
}
