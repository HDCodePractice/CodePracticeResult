//
//  File.swift
//  keyboard
//
//  Created by sunny on 2022-03-03.
//

import Foundation
import SwiftUI

struct Button: View {
    var buttonTitle : String = ""
    var buttonSubTitle : String = ""
    var background : Color = .gray
    var width : CGFloat = 66
    var height : CGFloat = 66
    
    var body: some View {
        ZStack{
            if buttonTitle.count == 1 {
                Rectangle().fill(background)
                    .cornerRadius(10)
            }else{
                if buttonTitle == "shift"{
                    Rectangle().fill(background)
                        .cornerRadius(10)
                }
            }
            if buttonTitle.count == 1 || buttonTitle == "return" {
                VStack{
                    Text(buttonSubTitle)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Text(buttonTitle)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
            }else{
                Image(systemName: buttonTitle)
                    .foregroundColor(.white)
            }
            
        }.padding(.all, 5.0)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        Button(buttonTitle: "A",buttonSubTitle: "1",background: .green,width: .infinity,height: .infinity)
        Button(buttonTitle: "0",buttonSubTitle: "1", background: .red,width: .infinity,height: .infinity)
    }
}
