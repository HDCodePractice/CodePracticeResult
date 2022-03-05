import SwiftUI

struct ContentView: View {
    let difficulties = ["Easy","Medium","Hard"]
    var body: some View {

        NavigationView {
            ZStack {
                LinearGradient(colors: [.orange,.yellow], startPoint: .top, endPoint: .bottom)
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
                            .background(.red)
                            .cornerRadius(7)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .navigationTitle("Flag Game 2 🚩")
        }
    }
}


struct GameView: View {
    @State var game = Game()
    @State var started = false
    let Difficulty: String
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange,.yellow], startPoint: .top, endPoint: .bottom)
            VStack{
                if game.Results {
                    Results
                } else {
                    if game.gameStart {
                        gamestart
                    } else {
                        gameEnd
                        VStack {
                            if started == true {
                                Button() {
                                    game.current += 1
                                    game.newGame()
                                } label: {
                                    ZStack {
                                        Color.red
                                        Text("Continue")
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 140, height: 50)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                }
                            } else {
                                Button() {
                                    game.Difficulty = Difficulty
                                    started = true
                                    game.newGame()
                                } label: {
                                    ZStack {
                                        Color.red
                                        Text("Start")
                                            .font(.system(size: 30, design: .rounded))
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var gamestart: some View {
        VStack{
            Text("\(game.current+1)/\(game.total)")
                .font(.system(size: 25, design: .rounded))
                .foregroundColor(.white)
            Text(game.question)
                .font(.system(size: 40, design: .rounded))
                .bold()
                .foregroundColor(.white)
            Text("")
            ForEach(game.answers,id:\.self){ flag in
                HStack{
                    Text(flag)
                        .font(.system(size: 60))
                        .onTapGesture{
                            if flag == game.correct {
                                game.score += 1
                            }
                            game.toggleAnswer(tAnswer: flag)
                        }
                }
            }
        }
    }
    
    var Results: some View {
        VStack {
            Text("\(game.score)/\(game.total)")
                .font(.system(size: 70, design: .rounded))
                .bold()
                .foregroundColor(.white)
        }
    }
    
    var gameEnd: some View{
        VStack{
            if started == true {
                Text("\(game.current+1)/\(game.total)")
                    .font(.system(size: 25, design: .rounded))
                    .foregroundColor(.white)
                Text(game.question)
                    .font(.system(size: 40, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                Text("")
                ForEach(game.answers,id:\.self){ flag in
                    HStack{
                        Text(flag)
                            .font(.system(size: 60))
                        if flag == game.answer{
                            Image(systemName: flag == game.correct ? "checkmark.circle.fill" : "x.circle.fill")
                                .foregroundColor(flag == game.correct ? .green : .red)
                        }
                        if flag == game.correct && flag != game.answer {
                            Image(systemName: flag == game.correct ? "checkmark.circle.fill" : "x.circle.fill")
                                .foregroundColor(flag == game.correct ? .green : .red)
                        }
                    }
                }
            }
        }
    }
}
