//
//  File.swift
//  GameBoard
//
//  Created by stephen on 20/3/2022.
//

import Foundation

struct ViewModel{
  var gridSize = 8
  var grid: [[GridItem]] = []
    
  init(){
      //初始化棋盘
      for i in 1 ... gridSize {
          var row : [GridItem] = []
          for j in 1 ... gridSize{
//              if (i + j)%2 == 0 {
//                  row.append(GridItem(background:.black, chess: .nothing))
//
//              }else {
//                  row.append(GridItem(background:.white, chess: .nothing))
//              }
              row.append(GridItem(
                background: (i+j)%2 == 0 ?.black : .white,
                chess: .nothing))
          }
          grid.append(row )
    }
      
      grid[3][3].chess = .black
      grid[3][4].chess = .blackKing
      grid[2][5].chess = .white
      grid[2][4].chess = .whiteKing

  }
}
