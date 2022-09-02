import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            Text("Game State:\(game.gameState.getTitle())")
//            VStack(spacing: 1){
//                ForEach(game.board, id:\.self){row in
//                    HStack(spacing: 1){
//                        ForEach(row){grid in
//                            ZStack{
//                                Rectangle()
//                                    .fill(.red)
//                                Image(systemName: grid.symbol.name)
//                                    .resizable()
//                                    .scaledToFit()
//                                    .foregroundColor(.yellow) 
//                                    .padding()
//                            }
//                            .onTapGesture {game.board = game.flip(grid: grid)}
//                        }
//                    }
//                }
//            }
//            Button{
//                game.startGame(game.genArray(game.nameArray))
//            }label: {
//                Text("Restart")
//                    .font(.largeTitle)
//            }
//            buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
