//
//  DataModel.swift
//  fourdoku
//
//  Created by sunny on 2022-04-20.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable{
    let id = UUID()
    var numberButton : NumberItem
}

enum NumberItem:String{
    case one = "one"
    case two = "two"
    case three = "three"
    case four = "four"
    case nothing = "nothing"
}


