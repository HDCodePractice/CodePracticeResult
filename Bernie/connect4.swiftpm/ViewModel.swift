//
//  File.swift
//  connect4
//
//  Created by Bernie Zhang on 3/29/22.
//

import Foundation
struct ViewModel{
    var gridRow = 7
    var gridColumn = 8
    var grid:[[GridItem]] = []
    
    init(){
        for i in 1...gridColumn{
            var row:[GridItem] = []
            for j in 1...gridRow{
                row.append(GridItem(background: .gray, connet4: .nothing))
            }
            grid.append(row)
        }
    }
}
