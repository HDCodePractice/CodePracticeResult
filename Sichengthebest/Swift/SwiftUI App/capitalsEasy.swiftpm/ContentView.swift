import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack {
            if vm.quit == false {
                if vm.ended == false {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 200, height: 30)
                            .foregroundColor(.orange)
                            .onTapGesture {
                                vm.questionEnded = false
                                vm.quit = true
                                vm.atQuestion = -1
                                
                            }
                        Text("⬅ Quit to start screen")
                            .onTapGesture {
                            vm.questionEnded = false
                            vm.quit = true
                            vm.atQuestion = -1
                            
                        }
                    }
                    Divider()
                    Text("Question \(vm.atQuestion+1) of \(vm.defaultCountries.count)")
                    Image(vm.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(20)
                    Text(vm.currentQuestion.title)
                    ForEach(vm.currentQuestion.answers) {answer in
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 250, height: 30)
                                .foregroundColor(.orange)
                                .onTapGesture {
                                    if vm.questionEnded == false {
                                        vm.tap(answers: vm.currentQuestion.answers, item: answer)
                                        if answer.right {
                                            vm.getRight()
                                        }
                                    }
                                }
                            HStack {
                                Text(answer.name)
                                if answer.click {
                                    if answer.right {
                                        Text("✅")
                                    } else {
                                        Text("❌")
                                    }
                                }
                            }
                        }
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 250, height: 30)
                            .foregroundColor(vm.questionEnded ? .green : .red)
                            .onTapGesture {
                                if vm.questionEnded {
                                    vm.getQuestion()
                                }
                            }
                        HStack {
                            Text("Next")
                        }
                    }
                } else {
                    Text("The end")
                        .font(.title)
                    Text("You got \(vm.numberRight) out of \(vm.defaultCountries.count)")
                    Divider()
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 200, height: 30)
                            .foregroundColor(.orange)
                            .onTapGesture {
                                vm.questionEnded = false
                                vm.ended = false
                                vm.atQuestion = -1
                                vm.getQuestion()
                                vm.numberRight = 0
                            }
                        Text("Restart")
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 200, height: 30)
                            .foregroundColor(.orange)
                            .onTapGesture {
                                vm.questionEnded = false
                                vm.quit = true
                                vm.atQuestion = -1
                                
                            }
                        Text("Quit to start screen")
                    }
                }
            } else {
                Text("Welcome to Sichengthebest’s Geography Quiz!")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Divider()
                Text("Choose your difficulty:")
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 30)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            vm.reset(newCountries: vm.easyCountries)
                        }
                    Text("Easy")
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 30)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            vm.reset(newCountries: vm.normalCountries)
                        }
                    Text("Normal")
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 30)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            vm.reset(newCountries: vm.hardCountries)
                        }
                    Text("Hard")
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 200, height: 30)
                        .foregroundColor(.orange)
                        .onTapGesture {
                            vm.reset(newCountries: vm.extremeCountries)
                        }
                    Text("Extreme")
                }
            }
        }
    }
}
