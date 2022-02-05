import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var answer: [String]?
    var body: some View {
        VStack{
            if game.gameStart{
                HStack{
                    Text(game.question)
//                    Text(answer[1])
                }
                Text("")
                ForEach(game.answers,id:\.self){flag in
                    Text(flag)
                        .font(.largeTitle)
                        .onTapGesture{
                            game.check = game.correct
                        }
                    if game.display == "yes"{
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            
                    }else{
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)

                    }


                }
            }else{
                Text("A! Nothing!")
            }
            Text("Play")
                .onTapGesture{
                    game.newGame()
                    
                }

        }
    }
}
