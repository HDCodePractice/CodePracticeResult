import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            Text("Battleship")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            ZStack{
                Color.secondary
                VStack{
                    ForEach(0..<game.board.count ,id:\.self){row in
                        HStack{
                            ForEach(0..<game.board[row].count ,id:\.self){column in
                                ZStack{
                                    Rectangle()
                                        .fill(game.board[row][column].gridColor)
                                    Image(systemName: game.board[row][column].symbol.name)
                                        .opacity(0.2)
                                        
                                }
                                .onTapGesture{
                                    
                                }
                            }
                        }
                    }
                }
            }
            Button("Restart"){  game.startGame()}
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
