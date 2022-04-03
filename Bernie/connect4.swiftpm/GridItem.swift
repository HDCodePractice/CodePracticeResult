//
//  File.swift
//  connect4
//
//  Created by Bernie Zhang on 4/3/22.
//

import Foundation

struct GridItem : Hashable,Identifiable{
    var id = UUID()
    var connect : Connect
}
