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
            print(winstreak)
            print(losestreak)
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
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "rock"
                        game.genComputer()
                        game.starting = false
                    }
                
                Image("Scissor")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "scissors"
                        game.genComputer()
                        game.starting = false
                    }
                
                Image("paper")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "paper"
                        game.genComputer()
                        game.starting = false
                    }
            }
            .padding()
        }
    }
}
