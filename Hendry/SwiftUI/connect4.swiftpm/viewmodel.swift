//
//  viewmodel.swift
//  connect4
//
//  Created by Hendry shao on 2022-04-01.
//

import Foundation
import SwiftUI

struct ViewModel{
    var gridWidth = 8
    var gridHeight = 7
    var gridBackground  = Color.red
    var gridItemBackground = Color.white
    var grid : [[Connect]] = []
    
    init(){
        for _ in 1 ... gridWidth  {
            var col : [Connect] = []
            for _ in 1 ... gridHeight {
                col.append(.nothing)
            }
            grid.append(col)
        }
    }
    func printGrid() {
        var a = ""
        for col in grid{
            for i in col{
                switch i {
                case .nothing:
                    a += "0"
                default:
                    a += "1"
                }
            }
            a += "\n"
        }
        print(a)
    }
}
