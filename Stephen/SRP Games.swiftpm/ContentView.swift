import SwiftUI

struct ContentView: View {
    @State var game = Game()
    
    var body: some View {
        VStack {
            Text(game.computer)
            Image(game.comImage)
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .cornerRadius(20)
                .frame(width:400,height: 200)
            Text(game.result)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
        }
        if game.result == "Please choose"{
            HStack{
                ForEach(game.all, id: \.self){i in
                    Image(i)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture {
                            game.caiQ(userInput:i)
                        }
                }
            }
            .padding(.all, 5.0)
            Text(game.user)
        }else{
            VStack{
                Image(game.user)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width:400,height: 200)
                Text(game.user)
               
                Image(systemName: "restart.circle")
                    .frame(width: 25, height:25)
                    .onTapGesture {
                        game.result = "Please choose"
                        game.user = "No Choose!"
                        game.computer = "No Choose!"
                        game.comImage = "robot"
                    }
                VStack(
                       alignment: .leading,
                       spacing: 3
                ) {
                    Text("You played \(game.gameCounts) times.")
                    Text("You won \(game.winCounts) times.")
                    Text("You tied \(game.tiedCounts) times.")
                    Text("You lost \(game.lossCounts) times.")
                }
            }
        }
    }
}


struct Game {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var comImage : String = "robot"
    @State var result : String = "Please choose"
    @State var gameCounts : Int = 0
    @State var winCounts : Int = 0
    @State var lossCounts : Int = 0
    @State var tiedCounts : Int = 0
    
    let all = ["rock","paper","scissors"]
    
    mutating func caiQ(userInput: String){
        user = userInput
        gameCounts += 1
        comImage = "robot"

        if let c = all.randomElement(){
            computer  = c
            comImage = computer
            if computer == user{
                result = "tied"
                tiedCounts += 1
            }
            if (user=="rock"&&computer=="scissors")||(user=="scissors"&&computer=="paper") ||     (user=="paper"&&computer=="rock") {
                result = "You Won!"
                winCounts += 1
                }
            if (user=="rock"&&computer=="paper")||(user=="scissors"&&computer=="rock") ||     (user=="paper"&&computer=="scissors"){
                result = "You lost!"
                lossCounts += 1
            }
        }else{
            computer = "No Choose"
        }
    }
    
}
