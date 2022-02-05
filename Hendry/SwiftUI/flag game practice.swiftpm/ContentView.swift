import SwiftUI
struct ContentView: View {
    @State var game = Game()
    @State var flagput = ""
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
                            .foregroundColor(.green.onTapGesture {
                                flagput = flags[flag]
                            })
                        forEach(game.answers,id:\.self){
                            i in Text(i)
                            if countries[i] == flags[i] && flagput == flags[i]{
                                Text("You are correct")
                            }
                            
                        }
                        
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
