//
//  File.swift
//  connect4
//
//  Created by Bernie Zhang on 3/29/22.
//

import Foundation
import SwiftUI

struct ViewModel{
    var row = 6
    var column = 7
    var background = Color.gray
    var grid:[[GridItem]] = []
    // var grid =[[GridItem]]()
    
    init(){
        for _ in 0..<row{
            var col:[GridItem] = []
            for _ in 0..<column{
                col.append(GridItem(connect: .nothing))
                //            }
            }
            grid.append(col)
        }
    }
    func tapeColumn(column:[GridItem])->[GridItem]{
        var rColumn = column
        if column[0].connect == .nothing{
            for i in 0..<column.count{
                if column[i].connect != .nothing{
                    rColumn[i-1].connect = .green
                    return rColumn
                }
            }
            rColumn[column.count-1].connect = .green
        }
        
        return rColumn
    }
}
