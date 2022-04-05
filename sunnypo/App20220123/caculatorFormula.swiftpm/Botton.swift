//
//  File.swift
//  caculatorFormula
//
//  Created by Sunny on 2022/2/13.
//

import Foundation
import SwiftUI

struct Button: View {
    var buttonTitle : String = ""
    var background : Color = .red
    var width : CGFloat = 66
    var height : CGFloat = 66
    
    var body :some View {
        Text(buttonTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(background)
            .cornerRadius(33)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews:some View {
        Button(buttonTitle: "AC", background: .green)
        Button(buttonTitle: "0", background: .red)

    }
}
