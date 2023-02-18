//
//  File.swift
//  benChineseChessApp
//
//  Created by Lei Zhou on 4/9/22.
//

import Foundation
import SwiftUI

enum ChessItem : Hashable {
    enum BlackChess:String {
        case shuai = "帅"
        case shi = "士"
        case xiang = "相"
        case ma = "马"
        case ju = "军"
        case pao = "炮"
        case bing = "兵"
    }
    
    enum RedChess:String {
        case jiang = "将"
        case shi = "仕"
        case xiang = "象"
        case ma = "馬"
        case ju = "軍"
        case pao = "砲"
        case zu = "卒"
        
    }
    
    case red(RedChess)
    case black(BlackChess)
    case nothing
    
    var title : String {
        switch self {
        case .black(let blackChess):
            return blackChess.rawValue
        case .red(let redChess):
            return redChess.rawValue
        case .nothing:
            return ""
        }
    }
    
    var color : Color {
        switch self {
        case .black(_):
            return Color.black
        case .red(_):
            return Color.red
        case .nothing:
            return Color.clear
        }
    }
    
}
