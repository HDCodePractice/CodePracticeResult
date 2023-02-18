import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View{
        if game.gameStarting {
            gameStarting
        }else{
            gameEnding
        }
    }
    var gameEnding : some View{
        VStack{
            Image(game.computer)
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .padding()
            Text(game.result)
                .font(.largeTitle)
            Image(game.user)
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .onTapGesture{
                    game.restart()
                }
        }
    }
    var gameStarting: some View {
        VStack {
            Text(game.computer)
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .padding()
                .frame(width: 150, height: 150)
            Text(game.result)
                .font(.largeTitle)
            HStack{
                ForEach(game.all,id: \.self){i in
                    Image(i)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(50)
                        .onTapGesture{
                            game.winorlose(userInput: i)
                        }
                    }
                }
            .padding()
            Text(game.user)
            }
        }
    }

struct Game{
    var user : String = "NO Choice"
    var computer : String = "NO Choice"
    var result : String = "Please choose"
    let all = ["rock","paper","scissor"]
    var gameStarting : Bool = true
    
    mutating func winorlose(userInput: String){
        user = userInput
        if let c = all.randomElement() {
                     computer = c
                     if computer == user {
                         result = "You Tied"
                     }
                     if (user=="rock"&&computer=="scissor") ||
                         (user=="scissor"&&computer=="paper") ||
                         (user=="paper"&&computer=="rock"){
                         result = "You Won"
                     }
                     if (user=="scissor"&&computer=="rock") ||
                                (user=="paper"&&computer=="scissor") ||
                         (user=="rock"&&computer=="paper") {
                         result = "You Lost"
                        }
                    }
                    gameStarting = false
                }
            
    mutating func restart(){
        gameStarting = true
        user = "NO Choice"
        computer = "No Choice"
        result = "Please Choose"
    }
}
