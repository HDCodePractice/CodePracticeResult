import SwiftUI

struct ContentView: View {
    @State var game = Game()
    var questionStart: some View {
        VStack{
            Text("\(game.current) out of \(game.total)")
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
            Text("\(game.current) out of \(game.total)")
            HStack{
                Text(game.question)
            }
            Text("")
            Text("\(game.score)")
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
            if game.gameStart{
                if game.questionStart {
                    questionStart
                }else{
                    questionEnd
                }
                Text("Next")
                    .onTapGesture {
                        game.nextQuestion()
                    }
                    .disabled(game.questionStart ? true : false)
                    .foregroundColor(game.questionStart ? .secondary : .primary)
            }else{
                Text("Start")
                    .onTapGesture {
                        game.newGame()
                    }
            }
        }
    }
}
