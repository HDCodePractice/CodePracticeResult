//
//  Button.swift
//  calculator2
//
//  Created by Sicheng Jiang on 2022-02-26.
//

import SwiftUI

struct ButtonV: View {
    @State var selected : Bool = false
    var title:String
    var background: Color
    var size:CGFloat
    var size2:CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: size)
                .fill(background)
                .frame(width: size2, height:size)
            Text(title)
                .foregroundColor(selected ? .blue : .primary)
                .font(.system(size: size/2))
                .onTapGesture {
                    selected.toggle()
                }
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:5){
            ForEach(ViewModel().grid, id: \.self){
                row in
                HStack(spacing:2){
                    ForEach(row, id: \.self){
                        letter in
                        if letter == "AC" || letter == "+/-" || letter == "%" {
                            ButtonV(title: letter, background: .gray, size:50.0,size2:50.0)
                        } else if letter == "÷" || letter == "x" || letter == "+" || letter == "-" || letter == "=" {
                            ButtonV(title: letter, background: .orange, size:50.0,size2:50.0)
                        } else if letter == "0" {
                            ButtonV(title: letter, background: .blue, size:50.0,size2:100.0)
                        } else {
                            ButtonV(title: letter, background: .blue, size:50.0,size2:50.0)
                        }
                    }
                }
            }
        }
    }
}

struct ViewModel{
    let grid = [
        ["AC","+/-","%","÷"],
        ["7","8","9","x"],
        ["4","5","6","-"],
        ["1","2","3","+"],
        ["0",".","="]
    ]
}
