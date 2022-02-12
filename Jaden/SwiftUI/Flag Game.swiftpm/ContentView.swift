import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var answer: [String]?
    private var gamestart: some View {
        VStack{
            HStack{
                Text(game.question)
                //                    Text(answer[1])
            }
            Text("")
            ForEach(game.answers,id:\.self){flag in
                Text(flag)
                    .font(.largeTitle)
                    .onTapGesture {
                        game.toggleAnswer(tAnswer: flag)
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
                        Image(systemName: flag == game.correct ?  "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(flag == game.correct ? .green : .red)
                        
                        
                            

                    }
                    if flag == game.correct && flag != game.answer{
                        Image(systemName: flag == game.correct ?  "checkmark.circle.fill" : "x.circle.fill")
                            .foregroundColor(flag == game.correct ? .green : .red)
                    }
                }
            }
        }
    }
    var body: some View {
        VStack{
            if game.gameStart{
                gamestart
            }else{
                gameEnd
            }
            Text("Question Number: \(game.questionNumber)/10")
            Text(game.play)
            if game.stopper{
                Text(game.scoreText)
                
            }

            Text(game.button)
                .onTapGesture{
                    game.newGame()
                    game.tenQuestions()
                    if game.stopper{
                        game.tenQuestions()
                        game.questionNumber = 10
                        if game.play == "stop"{
                            game.charger = 1
                            game.score = 0
                        }
                    }
                }

        }
    }
}
