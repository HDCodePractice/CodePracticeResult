//
//  File.swift
//  keyboard
//
//  Created by Bernie Zhang on 3/2/22.
//

import Foundation
import SwiftUI

struct Button: View {
    var buttonTitle : String = ""
    var background : Color = .green
    var width : CGFloat = 70
    var height : CGFloat = 70
    
    var body: some View {
        Text(buttonTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(background)
            .cornerRadius(height/10)
    }
}

struct Button_Previews: PreviewProvider{
    static var previews: some View{
        Button(buttonTitle: "A", background: .gray,width: 90,height: 90)
    }
}
