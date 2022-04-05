//
//  File.swift
//  MyKeyboard
//
//  Created by stephen on 6/3/2022.
//

import Foundation
import SwiftUI

struct Button: View {
    var buttonTitle : String = ""
    var background : Color = .gray
    var width : CGFloat = 66
    var height : CGFloat = 66
    
    var body: some View {
        Text(buttonTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: width, height: height)
            .background(background)
            .cornerRadius(height/2)
    }
}

