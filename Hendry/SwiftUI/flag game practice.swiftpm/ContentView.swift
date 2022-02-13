import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var how = 0
    var gamestart: some View {
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
    
    var gameEnd: some View{
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
                        how += 1
                    }
                    if flag == game.correct && flag != game.answer {
                        Image(systemName: flag == game.correct ? "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(flag == game.correct ? .green : .red)
                    }
                }
            }
            Text("\(how)/10")
        }
    }
    
    var body: some View {
        VStack{
            if game.gameStart {
                gamestart
            }else{
                gameEnd
            }
            Text("Start")
                .onTapGesture {
                    game.newGame()
                }
        }
    }
}