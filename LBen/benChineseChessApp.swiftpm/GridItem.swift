//
//  File.swift
//  benChineseChessApp
//
//  Created by Lei Zhou on 4/9/22.
//

import Foundation

struct GridItem: Hashable,Identifiable{
    let id = UUID()
    var chess : ChessItem
}

