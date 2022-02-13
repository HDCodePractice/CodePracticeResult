//
//  File.swift
//  calculatorApp
//
//  Created by Lei Zhou on 2/13/22.
//

import Foundation
import SwiftUI


struct MyView: View {
    var buttonTitle : String = ""
    var background : Color = .gray
    var width : CGFloat = 66
    var height : CGFloat = 66
    var body: some View {
        Text(buttonTitle)
            .font(.largeTitle)
            .frame(width: width, height: height)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(height/2)
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(buttonTitle: "AC")
        MyView(buttonTitle: "0", background: .yellow)
    }
}
