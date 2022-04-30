//
//  ViewModel.swift
//  connect5
//
//  Created by Hendry shao on 2022-04-27.
//

import SwiftUI
struct viewModel{
    let grid = [
        [0,0,0,1,0,1,1,0],
        [0,0,0,0,0,0,0,2],
        [0,0,0,2,2,2,2,0],
        [0,1,1,1,1,2,0,0],
        [0,0,0,0,2,0,0,0],
        [0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0]
    ]

    // 检查connects是不是都是actor
    func checkWon(connects: [Int], user: Int )->Bool{
        if connects.count != 4 {
            return false
        }
        for i in 0...3{
            if connects[i] != user{
                return false
            }
        }
        return true
    }

    // check isConnect4
    func checkHorizontalWon(user: Int)->Bool{
        for k in 0...6{
            for i in 0...4{
                var connects : [Int] = []
                for j in 0...3{
                    connects.append(grid[k][i+j])
                }
                if checkWon(connects:connects,user:1){
                    return true
                }
            }
        }
        return false
    }


     Text("one: \(checkHorizontalWon(user: 1))")
    Text("two: \(checkHorizontalWon(user: 2))")

}
