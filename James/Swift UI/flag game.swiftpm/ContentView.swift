import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var answer : [String]?
    var Me = ""
    var body: some View {
        VStack{
            if let answer = answer{
                HStack{
                    Text(answer[0])
//                    Text(answer[1])
                }
                Text("")
                ForEach(game.flags,id:\.self){ flag in
                    Text(flag)
                        .onTapGesture{
                          Me = flag
                        }
                }
                
            }else{
                Text("A! Nothing!")
            }
            
            Text("Start")
                .onTapGesture {
                    answer = game.newGame()
                }
        }
    }
}
