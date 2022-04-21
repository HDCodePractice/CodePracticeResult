//
//  DataModel.swift
//  fallchess
//
//  Created by sunny on 2022-04-02.
//

import Foundation

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var chess : ChessItem
}

enum ChessItem:String{
    case orange = "orange"
    case blue = "blue"
    case nothing = ""
}
