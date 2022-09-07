
import SwiftUI

struct  ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack{
            Text(game.isEnd())
            VStack {
                ForEach(game.board, id:\.self){
                    row in
                    HStack(spacing:1) {
                        ForEach(row) {
                            grid in
                            ZStack{
                                Rectangle()
                                    .fill(.clear)
                                Image(systemName: grid.img).resizable().scaledToFit()
                                Rectangle().foregroundColor(grid.pic.getColor())
                                    .opacity(grid.pic.getOpacity())
                            }.onTapGesture {
                                game.comparePair(secondGrid: grid)
                            }
                            
                            
                        }
                    }
                }
                Button {
                    game.startGame()
                }label: {
                    Text("Restart")
                        .font(.largeTitle)
                }.buttonStyle(.automatic)
            }.padding()
        }
        
    }
}

