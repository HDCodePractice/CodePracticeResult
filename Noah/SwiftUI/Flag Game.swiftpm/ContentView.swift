import SwiftUI
struct ContentView: View {
    let difficulties = ["Easy","Medium","Hard"]
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
                            Text(difficulty)
                                .font(.title)
                                .padding()
                        }
                        .frame(width:300)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
            }
            .navigationTitle("Guess the Flag  🚩")
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
                Text("Which of the following flags is \(game.Question)?")
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
                        .font(.system(size: 60))
                }
                if response == "x.circle.fill" && flag == chosenResponse {
                    Image(systemName: response)
                        .foregroundColor(.red)
                }
                if (response == "checkmark.circle.fill" && flag == chosenResponse) || (flag == game.CorrectAnswer && response != "") {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
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
                    Text("Continue")
                        .foregroundColor(.white)
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
