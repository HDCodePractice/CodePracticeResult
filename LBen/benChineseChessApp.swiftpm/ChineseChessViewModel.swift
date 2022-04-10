//
//  File.swift
//  benChineseChessApp
//
//  Created by Lei Zhou on 4/9/22.
//

import Foundation
import SwiftUI

struct ChineseChessViewMode {
    var gridRow = 11
    var gridColumn = 9
    var background = Color.brown
    var grid : [[GridItem]] = []
    init() {
        for i in 0..<gridRow {
            var row : [GridItem] = []
            for j in 0..<gridColumn {
                switch (i,j) {
                case (0,0), (0,8):
                    row.append(GridItem(chess: ChessItem.black(.ju)))
                case (0,1),(0,7):
                    row.append(GridItem(chess: ChessItem.black(.ma)))
                case (0,2),(0,6):
                    row.append(GridItem(chess: ChessItem.black(.xiang)))
                case (0,3),(0,5):
                    row.append(GridItem(chess: ChessItem.black(.shi)))
                case (0,4):
                    row.append(GridItem(chess: ChessItem.black(.shuai)))
                case (2,1),(2,7):
                    row.append(GridItem(chess: ChessItem.black(.pao)))
                case (3,0),(3,2),(3,4),(3,6),(3,8):
                    row.append(GridItem(chess: ChessItem.black(.bing)))
                case (10,0), (10,8):
                    row.append(GridItem(chess: ChessItem.red(.ju)))
                case (10,1),(10,7):
                    row.append(GridItem(chess: ChessItem.red(.ma)))
                case (10,2),(10,6):
                    row.append(GridItem(chess: ChessItem.red(.xiang)))
                case (10,3),(10,5):
                    row.append(GridItem(chess: ChessItem.red(.shi)))
                case (10,4):
                    row.append(GridItem(chess: ChessItem.red(.jiang)))
                case (8,1),(8,7):
                    row.append(GridItem(chess: ChessItem.red(.pao)))
                case (7,0),(7,2),(7,4),(7,6),(7,8):
                    row.append(GridItem(chess: ChessItem.red(.zu)))
                default: row.append(GridItem(chess: ChessItem.nothing))
                }
            }
            grid.append(row)
        }
   }
    
}
