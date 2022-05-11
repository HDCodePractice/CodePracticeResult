//
//  AnswerButton.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import SwiftUI

struct AnswerButton: View {
    var title:String
    var isRight:Bool = false
    var isClick:Bool = false
    
    init(_ title:String,isRight:Bool=false,isClick:Bool=false){
        self.title = title
        self.isRight = isRight
        self.isClick = isClick
    }
    
    var body: some View {
        ZStack{
            Text(title)
                .font(.system(size: 50))
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(.blue)
                .cornerRadius(30)
                .shadow(color: isClick ? isRight ? .green : .red : .clear, radius: 10)
            Image(systemName: isRight ? "checkmark.circle.fill" : "x.circle.fill")
                .font(.largeTitle)
                .foregroundColor(isClick ? isRight ? .green : .red : .clear)
                .opacity(0.5)
        }
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:30){
            AnswerButton("Beaconsfield Beaconsfield Beaconsfield",isRight: true,isClick: false)
            AnswerButton("Beaconsfield Beaconsfield Beaconsfield",isRight: false,isClick: false)
            AnswerButton("Beaconsfield",isRight: true,isClick: true)
            AnswerButton("Beaconsfield",isRight: false,isClick: true)
        }
    }
}
