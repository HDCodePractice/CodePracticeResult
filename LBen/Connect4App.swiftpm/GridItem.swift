//
//  File.swift
//  Connect4App
//
//  Created by Lei Zhou on 4/3/22.
//

import Foundation

struct GridItem : Hashable,Identifiable{
    let id = UUID()
    var connect : ConnectItem
}
