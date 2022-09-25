import SwiftUI

struct ContentView: View {
    
    @State var game = Game()
    @State var colorNum = 0
    @State var flag = true
    
//    @State var globeSize:Image.Scale
    
    
    var body: some View {
        
        VStack {
            ZStack{
                Color.clear
                Rectangle()
                    .foregroundColor(game.board[0].backColor.color)
                ForEach(0..<game.board.count,id:\.self){z in
                    Image(systemName: game.board[z].globe)
                    
//                        .imageScale(game.switchSize())
                        .imageScale(flag ? .large:.small)
                    
                        .foregroundColor(game.board[z].globeColor.color)
                        .offset(x:game.board[z].x,y:game.board[z].y)
                }
            }
            
            HStack{
                
                Button("Play"){
                    withAnimation(.easeIn(duration: 0.8)){
//                        game.switchSize()
                        game.playGame()
                        flag = (flag ? false : true)
//                        if flag{
//                            flag = false
//                        }else{
//                            flag = true
//                        }
                        
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Restart"){
                    
                    withAnimation (.easeInOut(duration: 0.8)){
                        flag = true
                        game.startGame()
                        
                        
                    }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
    
    
}

