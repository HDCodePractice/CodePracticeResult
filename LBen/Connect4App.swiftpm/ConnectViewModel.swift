//
//  File.swift
//  Connect4App
//
//  Created by Lei Zhou on 4/3/22.
//

import Foundation
import SwiftUI

struct connect4ViewModel {
    var gridRow = 6
    var gridColumn = 7
    var background = Color.gray
    var grid : [[GridItem]] = []
    init() {
        for i in 0..<gridRow {
            var column : [GridItem] = []
            for j in 0..<gridColumn {
                column.append(GridItem(connect: ConnectItem.nothing))
            }
            grid.append(column)
        }
    }
    
    func tapColumn(gridItem: [GridItem]
    ) -> [GridItem] {
        var rColumn = gridItem
        var i = gridItem.count - 1
        while (i >= 0) {
            if (gridItem[i].connect.color == .white) {
                rColumn[i] = GridItem(connect: .green)
                
                break
            }
            i -= 1
        }
        return rColumn

    }
}
