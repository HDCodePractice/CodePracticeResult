import SwiftUI

struct ContentView: View {
    @State var game : Game = Game()
    
    var body: some View {
        if game.starting {
            gameStarting
        }else{
            gameRestule
        }
    }
    
    var gameRestule: some View{
        VStack{
            Text(game.result)
                .font(.largeTitle)
            
            Text("Play again")
                .font(.largeTitle)
                .onTapGesture(){
                    game.starting = true
                }
        }
    }
    
    var gameStarting: some View{
        VStack(spacing:60) {
            Image(game.computer)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .padding()
                .frame(width: 120, height: 120)
                .onTapGesture(){
                    game.genComputer()
                }
                            
            Text(game.result)
                .font(.largeTitle)
            
            Image(game.player)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
            
            HStack(spacing:20){
                Image("Rock")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .scaledToFit()
                
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "Rock"
                        game.genComputer()
                        game.starting = false
                    }
                
                Image("Scissor")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "Scissor"
                        game.genComputer()
                        game.starting = false
                    }
                
                Image("Paper")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "Paper"
                        game.genComputer()
                        game.starting = false
                    }
            }
            .padding()
        }
    }
}
