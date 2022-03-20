//
//  File.swift
//  Calculater
//
//  Created by 老房东 on 2022-02-13.
//
import Foundation
import SwiftUI

struct Button: View {
    var buttonTitle : String = ""
    var background : Color = .red
    var width : CGFloat = 66
    var height : CGFloat = 66
    
    var body: some View {
        Text(buttonTitle)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: width , height: height)
            .background(background)
            .cornerRadius(height/2)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        Button(buttonTitle: "AC", background: .green,width: 120,height: 120)
        Button(buttonTitle: "0", background: .red,width: 120,height: 60)
    }
}
