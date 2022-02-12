import SwiftUI

struct ContentView: View {
    let difficulties = ["Start"]
    var body: some View {
        GameView(Difficulty: "Start")
//        NavigationView {
//            ZStack {
//                VStack {
//                    ForEach(difficulties,id: \.self){ difficulty in
//                        NavigationLink() {
//                            GameView(
//                                Difficulty: difficulty
//                            )
//                        } label: {
//                            ZStack {
//                                Text(difficulty)
//                                    .font(.title)
//                                    .padding()
//                            }
//                            .frame(width:200)
//                            .foregroundColor(.white)
//                            .background(.blue)
//                            .cornerRadius(5)
//
//                        }
//                    }
//                }
//            }
//            .ignoresSafeArea()
//            .navigationTitle("Flag Game")
//        }
    }
}


struct GameView: View {
    @State var game = Game()
    @State var started = false
    let Difficulty: String
    var body: some View {
        ZStack {
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
                                        Color.blue
                                        Text("Continue")
                                            .foregroundColor(.white)
                                            .font(.title)
                                    }
                                    .frame(width: 140, height: 50)
                                    .cornerRadius(20)

                                }
                            } else {
                                Button() {
                                    game.Difficulty = Difficulty
                                    started = true
                                    game.newGame()
                                } label: {
                                    ZStack{
                                        Color.blue
                                        Text("Start")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                    
                                            
                                    }
                                    .frame(width: 200, height: 100)
                                    .cornerRadius(15)
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
                .font(.title)
            Text(game.question)
                .font(.largeTitle)

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
            Text("You got a score of:")
            Text("\(game.score)/\(game.total)")
                .font(.largeTitle)
            Button(){
                started = false
                game.newGame()
            } label: {
                ZStack{
                    Color.blue
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.largeTitle)


                }
                .frame(width: 200, height: 100)
                .cornerRadius(15)
                }
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
