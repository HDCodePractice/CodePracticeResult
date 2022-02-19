import SwiftUI

struct ContentView: View {
    @State var game : Game = Game(running: true)
    
    var body: some View {
        if game.running == false {
            VStack(spacing:60) {
                HStack(spacing:20){
                    Image(systemName: "scissors")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "scissors"
                            game.genComputer()
                            game.running = true
                        }
                    
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "globe"
                            game.genComputer()
                            game.running = true
                        }
                    
                    Image(systemName: "newspaper")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture(){
                            game.player = "newspaper"
                            game.genComputer()
                            game.running = true
                        }
                }
                .padding()
            }
        } else {
            Image(systemName: game.computer)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 150, height: 150)
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
            
            Image(systemName: game.player)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 150, height: 150)
            Text("Play again?")
                .font(.largeTitle)
                .onTapGesture {
                    game.running = false
                }
        }
    }
}
