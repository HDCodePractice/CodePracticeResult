//
//  QuestionView.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var vm : ViewModel
    var level : Level = .normal
    
    var body: some View {
        if vm.reachEnded{
            EndView()
                .environmentObject(vm)
        }else{
            VStack{
                HStack{
                    Text("Your score \(vm.rightCount)")
                    Spacer()
                    Text("\(vm.currentIndex+1) out of \(vm.totalQuestion)")
                }
                Image(vm.question.flag)
                    .resizable()
                    .scaledToFit()
                HStack{
                    AnswerButton(vm.question.answers[0])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[0])
                        }
                    AnswerButton(vm.question.answers[1])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[1])
                        }
                }
                HStack{
                    AnswerButton(vm.question.answers[2])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[2])
                        }
                    AnswerButton(vm.question.answers[3])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[3])
                        }
                }
                PrimaryButton("Next")
                    .onTapGesture {
                        vm.tapNext()
                    }
                    .disabled(!vm.isSelected)
            }
            .padding()
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = ViewModel()
        vm.startExam(level: .easy)
        return QuestionView()
            .environmentObject(vm)
    }
}
