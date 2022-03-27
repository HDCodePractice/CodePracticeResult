//
//  DataModel.swift
//  chess
//
//  Created by sunny on 2022-03-26.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var chess : ChessItem
}

enum ChessItem:String{
    case white = "white"
    case black = "black"
    case nothing = ""
}

extension ChessItem{
    var isHidden:Bool{
        if self == .nothing{
            return true
        }
        return false
    }
}
