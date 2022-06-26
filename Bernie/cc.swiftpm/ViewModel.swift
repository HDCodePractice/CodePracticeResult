//
//  File.swift
//  cc
//
//  Created by Bernie Zhang on 4/7/22.
//

import Foundation
import SwiftUI

struct ViewModel{
    var row = 9
    var column = 8
    var background = Color.yellow
    var grid:[[GridItem]] = []
    
    init(){
        for _ in 0..<row{
            var col:[GridItem] = []
            for _ in 0..<column{
                col.append(GridItme(cc: .nothing))
            }
        }
    }
}
