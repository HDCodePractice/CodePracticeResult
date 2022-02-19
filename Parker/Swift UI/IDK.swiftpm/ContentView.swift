import SwiftUI
struct ContentView: View {
    let difficulties = ["Easy"]
    var body: some View {
        NavigationView {
            VStack {
                ForEach(difficulties,id: \.self){ difficulty in
                    NavigationLink() {
                        GameView(
                            Difficulty: difficulty
                        )
                    } label: {
                        ZStack {
                            Text("Start")
                                .font(.title)
                                .padding()
                        }
                        .frame(width:300)
                        .foregroundColor(.black)
                        .background(.purple)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
            }
            .navigationTitle("Guess the Flag")
        }
    }
}

struct GameView: View {
    @State var game = Game()
    @State var response = ""
    @State var chosenResponse = ""
    @State var continueButton = false
    let Difficulty: String
    var body: some View {
        VStack {
            if game.GameStart {
                Text("Select the flag of \(game.Question)?")
                    .font(.system(.body, design: .rounded))
                answers
                if continueButton == true {
                    continueButtonDisplay
                }
            } else {
                startButton
            }
        }
    }
    var answers: some View {
        ForEach(game.Answers,id:\.self) { flag in
            HStack {
                Button() {
                    if flag == game.CorrectAnswer {
                        response = "checkmark.circle.fill"
                    } else {
                        response = "x.circle.fill"
                    }
                    continueButton = true
                    chosenResponse = flag

                } label: {
                    Text(flag)
                        .font(.system(size: 40))
                }
                if response == "x.circle.fill" && flag == chosenResponse {
                    Image(systemName: response)
                        .foregroundColor(.red)
                        .font(.system(size: 20))
                }
                if (response == "checkmark.circle.fill" && flag == chosenResponse) || (flag == game.CorrectAnswer && response != "") {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 20))
                }
            }
        }
    }

    var continueButtonDisplay: some View {
        VStack {
            Button() {
                game.Difficulty = Difficulty
                game.newGame()
                response = ""
                continueButton = false
            } label: {
                ZStack {
                    Color.accentColor
                    Text("Next")
                        .foregroundColor(.black)
                }
                    .frame(width: 140, height: 50)
                    .cornerRadius(5)
                    .shadow(radius: 5)
            }
        }
    }

    var startButton: some View {
        VStack {
            Button() {
                game.Difficulty = Difficulty
                game.newGame()
                response = ""
                continueButton = false
            } label: {
                ZStack {
                    Color.accentColor
                    Text("Start")
                        .foregroundColor(.white)
                }
                    .frame(width: 140, height: 50)
                    .cornerRadius(5)
                    .shadow(radius: 5)
            }
        }
    }
}
