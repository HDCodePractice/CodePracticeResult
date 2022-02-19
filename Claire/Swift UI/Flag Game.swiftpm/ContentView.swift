import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var questionstart: some View {
        VStack{
            Text("\(game.current) out of \(game.total)")
                .font(.custom("Gill Sans", size: 20))
                .foregroundColor(.white)
            HStack{
                Text(game.question)
                    .font(.custom("Gill Sans", size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
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
                    .font(.custom("Gill Sans", size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
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
        
        ZStack{
            LinearGradient(colors: [.yellow,.red], startPoint: .top, endPoint: .bottom)
            
            VStack {
                if game.gameStart{
                    if game.questionStart {
                        questionstart
                    }else{
                        questionEnd
                    }
                    
                    Text("Next")
                        .font(.custom("Gill Sans", size: 25))
                        .onTapGesture{
                            game.nextQuestion()
                        }
                        .disabled(game.questionStart ? true : false)
                        .foregroundColor(game.questionStart ? .secondary : .white)
                }else{
                    Button{
                        game.newGame()
                    }label: {
                        ZStack{
                            Color.white
                            Text("Start")
                                .font(.custom("Gill Sans", size: 30))
                                .fontWeight(.semibold)
                                .foregroundColor(.orange)
                        }
                        .frame(width: 300, height: 50)
                        .cornerRadius(100)
                        .shadow(radius: 5)
                    }
                }
            }
            
        }.ignoresSafeArea()
        
        
        
        
        
        
    }
}
