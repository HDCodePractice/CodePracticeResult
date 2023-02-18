import SwiftUI

struct QuestionView:View {
    @EnvironmentObject var vm : ViewModel
    
    var body: some View {
        if vm.reachEnded {
            VStack(alignment: .center) {
                Text("You got \(vm.rightNumber) questions right out of \(vm.totalQuestion)!")
                    .font(.title3)
                PrimaryButton("Restart")
                    .onTapGesture {
                        vm.reachEnded = false
                        vm.rightNumber = 0
                        vm.clicked = false
                        vm.currentIndex = 0
                        vm.getQuestion()
                    }
            }
        } else {
            VStack {
                Text("Question \(vm.questionAt+1) out of \(vm.totalQuestion)")
                Image(vm.question.flag)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Text("What is the capital of \(vm.question.title)?")
                    .font(.title2)
                HStack {
                    AnswerButton(vm.question.answers[0])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[0])
                        }
                    AnswerButton(vm.question.answers[1])
                        .onTapGesture {
                            vm.tapAnswer(answer: vm.question.answers[1])
                        }
                }
                HStack {
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
                        vm.nextQuestion()
                    }
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
