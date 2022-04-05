import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var questionstart: some View {
        VStack{
            HStack{
                Text(game.question)
            }
            Text("")
            ForEach(game.answers,id:\.self){ flag in
                HStack{
                    Text(flag)
                        .font(.largeTitle)
                        .onTapGesture{
                            game.toggleAnswer(tAnswer: flag)
                        }
                }
            }
        }
    }
    
    var questionEnd: some View{
        VStack{
            HStack{
                Text(game.question)
            }
            Text("")
            ForEach(game.answers,id:\.self){ flag in
                HStack{
                    Text(flag)
                        .font(.largeTitle)
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
    
    var body: some View {
        VStack{
            if game.questionStart {
                questionstart
            }else{
                if game.gameStart == false {
                    if game.firstGame == true {
                        Text("Start")
                            .onTapGesture {
                                game.newGame()
                            }
                    } else {
                        Text("You got \(game.score) out of \(game.total)")
                        Text("Restart")
                            .onTapGesture {
                                game.newGame()
                            }
                    }
                } else {
                    Text("\(game.current+1) out of \(game.total)")
                    questionEnd
                    Text("Next")
                        .onTapGesture {
                            game.nextQuestion()
                        }
                }
                
            }
            
        }
    }
}
