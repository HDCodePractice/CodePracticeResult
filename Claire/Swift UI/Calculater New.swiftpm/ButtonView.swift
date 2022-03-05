//
//  Button.swift
//  Calculater New
//
//  Created by Qianji Yao on 2022/2/26.
//
import SwiftUI

struct ButtonView: View {
    var title : String
    var background : Color
    var size : CGSize
    
    var body: some View {
        Button() {
            
        } label: {
            Text("\(title)")
                .font(.system(size: size.height/2))
                .foregroundColor(.white)
                .frame(width: size.width, height: size.height)
                .background(background)
                .cornerRadius(size.height/2)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "+", background: .yellow, size: CGSize(width: 100, height: 100))
        ButtonView(title: "0", background: .blue, size: CGSize(width: 200, height: 100))
    }
}
