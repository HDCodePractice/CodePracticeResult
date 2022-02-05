import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack{
            if game.gameStart {
                HStack{
                    Text(game.question)
                }
                Text("")
                ForEach(game.answers,id:\.self){ flag in
                    HStack{
                        Text(flag)
                            .font(.largeTitle)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                
            }else{
                Text("A! Nothing!")
            }
            
            Text("Start")
                .onTapGesture {
                    game.newGame()
                }
        }
    }
}
