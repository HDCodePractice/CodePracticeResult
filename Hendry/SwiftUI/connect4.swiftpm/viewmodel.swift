//
//  viewmodel.swift
//  connect4
//
//  Created by Hendry shao on 2022-04-01.
//

import Foundation
import SwiftUI
struct ViewModel
var gridbackground = color.grey
var gridspot = color.white
var grid : [[griditem]] = [[]]
init(){
    let width = 8
    let length = 7
    ZStack{
    color.gridbackground
    for _ in 1 ... width{
        VStack{
            HStack{
        for _ in 1 ... length{
            
        }
            }
        }
    }
}
}
