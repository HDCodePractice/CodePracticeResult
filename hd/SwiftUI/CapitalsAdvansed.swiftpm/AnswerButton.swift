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
    
    init(_ answer: Question.Answer){
        self.title = answer.name
        self.isRight = answer.right
        self.isClick = answer.click
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.blue)
                .frame(maxHeight: 70)
                .cornerRadius(30)
                .shadow(color: isClick ? isRight ? .green : .red : .clear, radius: 10)
            Text(title)
                .font(.system(size: 50))
                .lineLimit(1)
                .minimumScaleFactor(0.01)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
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
            AnswerButton(Question.Answer(name: "Beaconsfiled", right: true, click: false))
            AnswerButton(Question.Answer(name: "Beaconsfiled", right: false, click: false))
            AnswerButton(Question.Answer(name: "Beaconsfiled", right: true, click: true))
            AnswerButton(Question.Answer(name: "Beaconsfiled", right: false, click: true))
        }
    }
}
