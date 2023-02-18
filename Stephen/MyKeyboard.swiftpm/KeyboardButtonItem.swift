//
//  File.swift
//  MyKeyboard
//
//  Created by stephen on 6/3/2022.
//

import Foundation
import SwiftUI

enum KeyboardButtonItem{
    enum Function: String{
        case returnC = "return"
        case delete = "delete.backword"
        case lshift = "shift.fill"
        case rshift = "shift.fill"
        case globle = "globle"
        case mic = "mic"
        case keyboard = "keyboard.chevron.compact.down"
        case number = "textformat.123"
    }
    
        
    case letter(String)
    case dot
    case comma
    case command(Command)
}
    


extension KeyBoardItem{
 var KeyItemView : some View{
  VStact{
   switch self{
    case .space : Rectangle().hidden()
    case .letter: (let primary, let secondary)  {
     Text(secondary).foregroundColor(.secondary)
     Text(primary).foregroundColor(.white).font(.title)
    }
   case .function(let function):
      case return:
           Text(function.rawValue)
      default:
           Image(systemName: function.rawValue)

  }
 }

    
    var background: Color{
        switch self {
        case .letter(_):
            return .gray
        case .dot:
            return .gray
        case .command(_):
            return .gray
        case .comma:
            return .gray
        }
    }
    
    var width : CGFloat{
        if self == .command(.space){
            return 142
        }else{
            return 66
        }
    }
    
    var height : CGFloat{
        return 66
    }
}

//extension KeyboardButtonItem: Hashable{}
