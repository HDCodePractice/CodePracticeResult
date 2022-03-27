//
//  KeyContentItem.swift
//  keyboard
//
//  Created by sunny on 2022-03-06.
//

import Foundation
import SwiftUI


enum KeyContentItem:Hashable{
    enum Character:String{
        case letter
        case symbol
    }
    enum Command:String{
        case symbolImg
    }
    
    
    case character(String,String)
    case command(String)
}

extension KeyContentItem{
    
}
