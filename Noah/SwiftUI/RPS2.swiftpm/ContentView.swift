import SwiftUI

struct ContentView: View {
    @State var game : Game = Game()
    
    var body: some View {
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
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "rock"
                        game.genComputer()
                    }
                
                Image("Scissors")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "scissors"
                        game.genComputer()
                    }
                
                Image("Paper")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture(){
                        game.player = "paper"
                        game.genComputer()
                    }
            }
            .padding()
        }
    }
}
