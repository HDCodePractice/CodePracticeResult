//
//  File.swift
//  cc
//
//  Created by Bernie Zhang on 4/7/22.
//

import Foundation
import SwiftUI

struct GridItem: Identifiable,Hashable {
    let id = UUID()
    var background: GridBackGround
    var chess: CcItem

enum cc{
    case bJv
    case bMa
    case bXiang
    case bShi
    case bJiang
    case bPao
    case bZu
    case wJv
    case wMa
    case wXiang
    case wShi
    case wJiang
    case wPao
    case wZu
    case nothing

    var color:Color{
        switch self {
        case .wJv, .wMa, .wXiang, .wShi, .wJiang, .wPao, .wZu:
            return .red
        case .bJv, .bMa, .bXiang, .bShi, .bJiang, .bPao, .bZu:
            return .black
        case .nothing:
            return .clear
        }
        
    }
}
