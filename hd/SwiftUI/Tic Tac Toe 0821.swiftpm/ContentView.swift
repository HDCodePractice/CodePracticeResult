import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack{
            HStack{
                Text("Current Player:")
                Image(systemName: game.currentPlayer.getImage())
                    .foregroundColor(game.currentPlayer.getColor())
                
                Text("Game State:\(game.gameState.getTitle())")
            }
            VStack(spacing:1) {
                ForEach(game.board,id:\.self){ row in
                    HStack(spacing:1){
                        ForEach(row){ grid in
                            ZStack{
                                Rectangle()
                                Image(systemName: grid.chess.getImage())
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(grid.chess.getColor())
                                    .padding()
                            }
                            .onTapGesture { 
                                game.putChess(grid: grid)
                            }
                        }
                    }
                }
            }
            Button{
                game.startGame()
            }label: {
                Text("Restart")
                    .font(.largeTitle)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
