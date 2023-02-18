import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
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
                .cornerRadius(30)
                .padding()
            Text(game.result)
                .font(.largeTitle)
            Image(game.user)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
                .onTapGesture{
                    game.restart()
                }
        }
    }
    var gameStarting : some View{
        VStack {
            Text(game.computer)
                .font(.largeTitle)
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 100, height: 100)
                .padding()
            Text(game.result)
                .font(.largeTitle)
            HStack{
                ForEach(game.all,id: \.self) { i in
                    Image(i)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .onTapGesture {
                            game.winOrLoose(userInput: i)
                        }
                }
            }
            .padding()
            Text(game.user)
                .font(.largeTitle)
        }
    }
}


struct Game {
    var user : String = "Please Choose"
    var computer : String = "Please Choose"
    var result : String = "Please Choose"
    let all = ["rock","paper","scissors"]
    var gameStarting : Bool = true
    
    mutating func winOrLoose(userInput: String) {
        user = userInput
        if let c = all.randomElement() {
            computer = c
            if computer == user {
                result = "You Tied"
            }
            if (user=="rock"&&computer=="scissors") ||
                (user=="scissors"&&computer=="paper") ||
                (user=="paper"&&computer=="rock"){
                result = "You Won"
            }
            if (user=="scissors"&&computer=="rock") ||
                       (user=="paper"&&computer=="scissors") ||
                (user=="rock"&&computer=="paper") {
                result = "You Lost"
            }
        }else{
            computer = "No Choose"
        }
        gameStarting = false
    }
    
    mutating func restart(){
        gameStarting = true
        user = "Please Choose"
        computer = "Please Choose"
        result = "Please Choose"
    }
}
