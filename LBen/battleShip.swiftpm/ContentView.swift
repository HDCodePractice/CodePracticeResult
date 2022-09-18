import SwiftUI

struct  ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack{
            VStack (spacing:1){
                ForEach(game.board, id:\.self){
                    row in
                    HStack(spacing:1) {
                        ForEach(row) {
                            grid in
                            ZStack{
                                
                                Image(systemName: grid.gridStatus.getImageName()).resizable().scaledToFit().foregroundColor(grid.background)
                                Rectangle().scaledToFit().opacity(grid.opacity)
                            }.onTapGesture {
                                game.changeStatus(grid: grid)
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
