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
}
    
enum KeyPadButton{
    case number
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
}

struct KeyPadButtonItem: Identifiable{
    let id = UUID()
    var status = KeyPadButton.self
    var caption : String
}
