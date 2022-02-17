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
                questionEnd
                Text("\(game.current) out of \(game.total)")
                if game.gameStart == false {
                    Text("Start")
                        .onTapGesture {
                        game.newGame()
                    }
                } else {
                    Text("Next")
                }
                    
            }
            
        }
    }
}
