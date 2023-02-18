import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var grid = Grid(pics: "pencil.slash", x: 0, y: 0)
    
    var body: some View {
        
        VStack(spacing:1){
            
            HStack{
                Rectangle()
//                    .fill(.red)
            }
            
            ForEach(game.board,id:\.self){ row in
                HStack(spacing:1){
                    ForEach(row){ grid in
                        ZStack{
                            Rectangle()
                                .fill(.gray)
                            Image(systemName: grid.pics)
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
            Button{
                game.startGame()
                
            }label:{
                Text("Restart").font(.largeTitle)
            }
            
            buttonStyle(.borderedProminent)
        }
        .padding()
        
    }
    
}
