//
//  QuestionView.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import SwiftUI

struct QuestionView: View {
    var flagImage : String
    
    var body: some View {
        VStack{
            Image(flagImage)
                .resizable()
                .scaledToFit()
            HStack{
                AnswerButton("Beaconsfield")
                AnswerButton("Beaconsfield")
            }
            HStack{
                AnswerButton("Beaconsfield")
                AnswerButton("Beaconsfield")
            }
        }
        .padding()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(flagImage: "canada")
    }
}
