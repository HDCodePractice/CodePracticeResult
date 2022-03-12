//
//  File.swift
//  ben_keyboard
//
//  Created by Lei Zhou on 3/6/22.
//

import Foundation
import SwiftUI


struct Keyboard : View {
    var keyboardTitle : [String] = []
    var background : Color = .gray
    var width : CGFloat = 66
    var height : CGFloat = 66
    var body: some View {
        VStack{
        Text(keyboardTitle[0])
                .font(.subheadline)
                .foregroundColor(.secondary) .padding(1)
        Text(keyboardTitle[1])
            .font(.headline)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
        }.frame(width: width, height: height)
            .background(background)
    }
            
}
struct FunctionKey : View {
    var functionKeyTitle : String = ""
    var background : Color = .gray
    var width : CGFloat = 66
    var height : CGFloat = 66
    var body: some View {
        VStack{
            Image(systemName: functionKeyTitle)
        }.frame(width: width, height: height)
            .foregroundColor(.white)
            .background(background)
    }
}
struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        Keyboard(keyboardTitle: ["1", "Q"])
        FunctionKey(functionKeyTitle: "shift")
    }
}
