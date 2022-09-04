import SwiftUI
import Foundation

struct ContentView: View {
    @State var game = Game()
    @State var disMark = true
    
    var body: some View {
        VStack(spacing:1) {
            
            HStack{
                Text("Current Player:")
                //                Image(systemName: game.currentPlayer.getImage())
                //                    .foregroundColor(game.currentPlayer.getColor())
                Text("Game State:")
            }
            ForEach(game.board,id:\.self){row in 
                HStack(spacing:1){
                    
                    ForEach(row,id:\.self){ grid in
                        ZStack{
                            Rectangle()
                                .fill(.yellow)
                            Image(systemName: game.showBoard[grid.x][grid.y].pics)
                                .resizable()
                                .scaledToFit()
                        }
                        .onTapGesture {
                            game.showPics(grid: grid)
                        }   
                    }
                }
            }
        }
        Button{
            
            game.startGame()
        }label:{
            Text("Restart")
                .font(.largeTitle)
        }
        .buttonStyle(.borderedProminent)
        .padding()
    }
    
}

