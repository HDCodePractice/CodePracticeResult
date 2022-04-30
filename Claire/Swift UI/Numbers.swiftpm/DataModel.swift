////
////  DataModel.swift
////  Numbers
////
////  Created by Qianji Yao on 2022/4/9.
////

import Foundation
import SwiftUI

enum BlockStatus{
    case correct
    case wOrder
    case wrong
    case nothing
    
    var color:Color{
        switch self {
        case .correct:
            return .green
        case .wOrder:
            return .yellow
        case .wrong:
            return .gray
        case .nothing:
            return .white
        }
    }
}

struct BlockItem: Identifiable, Hashable{
    let id = UUID()
    var status : BlockStatus
    var caption : String
    var column : Int
    var row : Int
}
    
enum KeyPadButton: Hashable{
    case number(String)
    case delete
    case check
        
    var color:Color{
        switch self {
            case .number, .delete:
                return .white
            case .check:
                return .orange
        }
    }
    
    var title:String{
        switch self{
        case .number(let number):
            return number
        case .delete:
            return "delete"
        case .check:
            return "check"
        }
    }
}

struct KeyPadButtonItem: Identifiable, Hashable{
    let id = UUID()
    var button : KeyPadButton
}
