import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    
    var body: some View {
        VStack {
            Text("Battle Boats")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            HStack{
                
            }
            VStack(spacing:1){
                ForEach(game.board,id:\.self){row in 
                    HStack(spacing:1){
                        ForEach(row){grid in 
                            ZStack{
                                Rectangle()
                                    .fill(.blue)
                                Image(systemName: game.board[grid.h][grid.w].gridState.getImage(boat: game.board[grid.h][grid.w].boat))
                                    .resizable()
                                    .scaledToFit()
                            }
//                            .onTapGesture {
//                                <#code#>
//                            }
                            
                        }
                    }
                }
            }
        }
        Button("Restart Game"){
            game.startGame()
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
}
