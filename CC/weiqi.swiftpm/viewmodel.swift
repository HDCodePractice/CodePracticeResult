//
//  viewmodel.swift
//  weiqi
//
//  Created by cc on 2022-03-26.
//

import SwiftUI

struct ViewModel{
    var gridSize = 19
    var gride : [[GridItem]] = []
    
    init(){
        // 按gridSize初始化 grid
        for i in 1 ... gridSize {
            var row : [GridItem] = []
            for j in 1 ... gridSize {
                if i == 1 && j == 1 {
                    row.append(GridItem(background: .TopLeft, chess: .nothing))
                }else if i == 1 && j == gridSize {
                    row.append(GridItem(background: .TopRight, chess: .nothing))
                }else if i == gridSize && j == 1 {
                    row.append(GridItem(background: .BottomLeft, chess: .nothing))
                }else if i == gridSize && j == gridSize {
                    row.append(GridItem(background: .BottomRight, chess: .nothing))
                }else if i == 1 {
                    row.append(GridItem(background: .Top, chess: .nothing))
                }else if i == gridSize{
                    row.append(GridItem(background: .Bottom, chess: .nothing))
                }else if i != 1 && j == 1 {
                    row.append(GridItem(background: .Left, chess: .nothing))
                }else if i != 1 && j == gridSize {
                    row.append(GridItem(background: .Right, chess: .nothing))
                }else if (i == 4 || i == 10 || i == 16 ) && (j == 4 || j == 10 || j == 16 ) {
                    row.append(GridItem(background: .MidDot, chess: .nothing))
                }else {
                    row.append(GridItem(background: .Mid, chess: .nothing))
                }
                
            }
            gride.append(row)
        }
        gride[4][4].chess = .black
        gride[16][16].chess = .white
        gride[15][15].chess = .black
        gride[3][3].chess = .white
    }
}
