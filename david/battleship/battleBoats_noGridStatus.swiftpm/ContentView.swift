import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    
    var body: some View {
        VStack {
            Text("Battle Boats")
                .foregroundColor(.accentColor)
                .font(.largeTitle)
            if game.isOver(){
                Text("Game State: win")
            }else{
                Text("Continue")
            }
            
            HStack{
                
            }
            VStack(spacing:1){
                ForEach(game.board,id:\.self){row in 
                    HStack(spacing:1){
                        ForEach(row){grid in 
                            ZStack{
                                Rectangle()
                                    .fill(.blue)
                                Image(systemName: game.board[grid.h][grid.w].ship.getImage())
                                    .resizable()
                                    .scaledToFit()
                            }
                            .onTapGesture {
                                if !game.isOver(){
                                    game.tapGrid(grid: grid)
                                }
                                
                            }
                            
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
