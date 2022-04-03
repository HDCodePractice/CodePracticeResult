//
//  File.swift
//  Connect4
//
//  Created by cc on 2022-04-03.
//

import SwiftUI

struct ViewModel{
    var grideSize = 8
    var gride : [[GrideItem]] = []
    
    init(){
        for _ in 1 ... grideSize{
            var row : [GrideItem] = []
            for _ in 1 ... grideSize {
                row.append(GrideItem(chess: .nothing))
            }
            gride.append(row)
        }
    }
}


