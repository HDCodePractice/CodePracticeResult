import SwiftUI

struct ContentView: View {
    let difficulties = ["Start"]
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(colors: [.purple,.blue,.green], startPoint: .top, endPoint: .bottom)
                GameView(Difficulty: "Start")

            }

        }
        .ignoresSafeArea()
        .navigationTitle("Flag Game")
    }
}


struct GameView: View {
    @State var game = Game()
    @State var started = false
    let Difficulty: String
    var body: some View {
        ZStack {
            LinearGradient(colors: [.indigo,.blue,.cyan,.teal], startPoint: .top, endPoint: .bottom)
            VStack{
                if game.result {
                    result
                } else {
                    if game.gameStart {
                        start
                    } else {
                        end
                        VStack {
                            if started == true {
                                Button() {
                                    game.current += 1
                                    game.newGame()
                                } label: {
                                    ZStack {
                                        LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                                        Text("Next")
                                            .font(.system(size: 40, design: .rounded))
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.title)
                                    }
                                    .frame(width: 300, height: 100)
                                    .cornerRadius(20)

                                }
                            } else {
                                Button() {
                                    game.Difficulty = Difficulty
                                    started = true
                                    game.newGame()
                                } label: {
                                    ZStack{
                                        LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                                        Text("Start")
                                            .font(.system(size: 40, design: .rounded))
                                            .bold()
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                    
                                            
                                    }
                                    .frame(width: 300, height: 100)
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
//make func not work 2/14/22
    var start: some View {
        VStack{
            
            Text("\(game.current+1)/\(game.total)")
                .font(.system(size: 20, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .font(.title)
            Text("Which one of these flags is \(game.question)'s Flag")
                .font(.system(size: 30, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .padding()
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
    
    var result: some View {
        VStack {
            Text("You got a score of:")
                .font(.system(size: 40, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .font(.title)
            Text("\(game.score)/\(game.total)")
                .font(.system(size: 40, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .font(.largeTitle)
            Button(){
//                started = false
//                game.newGame()
                game.current = 0
                game.score = 0
                game.result = false
                game.gameStart = true
                game.mixup()
            } label: {
                ZStack{
                    LinearGradient(colors: [.pink,.red,.orange,.yellow,.white], startPoint: .top, endPoint: .bottom)
                    Text("Play Again")
                        .font(.system(size: 40, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .font(.largeTitle)


                }
                .frame(width: 300, height: 200)
                .cornerRadius(15)
                }
            }
        }
    
    
    var end: some View{
        VStack{
            if started == true {
                Text("\(game.current+1)/\(game.total)")
                    .font(.system(size: 20, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                Text("\(game.question)'s Flag is \(game.correct)")
                    .font(.system(size: 30, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                Text("")
                ForEach(game.answers,id:\.self){ flag in
                    HStack{
                        Text(flag)
                            .font(.system(size: 60))
//                        if flag == game.answer{
//                            Image(systemName: flag == game.correct ? "checkmark.circle.fill" : "x.circle.fill")
//                                .foregroundColor(flag == game.correct ? .green : .red)
//                        }
//                        if flag == game.correct && flag != game.answer {
//                            Image(systemName: flag == game.correct ? "checkmark.circle.fill" : "x.circle.fill")
//                                .foregroundColor(flag == game.correct ? .green : .red)
//
//                        }

                        if flag == game.correct{
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Text("Correct Answer")
                                .font(.system(size: 20, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                        }else{
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(.red)
                            Text("Wrong Answer")
                                .font(.system(size: 20, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                        }
                        if flag == game.answer{
                            Text("<-- Your Answer")
                                .font(.system(size: 25, design: .rounded))
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                        }

                    }
                }
            }
        }
    }
}
