//
//  BlackSlot.swift
//  draughts
//
//  Created by sunny on 2022-03-13.
//

import Foundation
import SwiftUI

struct BlackSlot: View {
//    var buttonTitle : String = ""
//    var background : Color = .red
//    var width : CGFloat = 66
//    var height : CGFloat = 66

    
    var isKing : Bool
    var white : Bool
    var black : Bool
    
    var body: some View {
        ZStack{
            Rectangle().fill(.orange)
            if white == true{
                Circle().foregroundColor(.white)
            }
            if black == true{
                Circle().foregroundColor(.black)
            }
            if isKing == true{
                Image(systemName:"crown.fill").resizable().scaledToFit().foregroundColor(.yellow)
            }
        }
    }
}

struct BlackSlot_Previews: PreviewProvider {
    static var previews: some View {
        BlackSlot(isKing: false, white: false, black: true)
        BlackSlot(isKing: false, white: true, black: false)
        BlackSlot(isKing: true, white: true, black: false)
    }
}
