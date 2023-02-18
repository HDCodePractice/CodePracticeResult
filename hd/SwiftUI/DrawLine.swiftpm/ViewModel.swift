//
//  File.swift
//  DrawLine
//
//  Created by 老房东 on 2022-03-05.
//

import Foundation
import SwiftUI

struct ViewModel{
    var start = CGPoint(x: 0, y: 0)
    var end =  CGPoint(x: 0, y: 0)
    var lines : [LinePoints] = []
}

struct LinePoints: Identifiable{
    let id = UUID()
    var start : CGPoint
    var end : CGPoint
}
