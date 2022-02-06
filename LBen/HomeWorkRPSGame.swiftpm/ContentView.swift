import SwiftUI

struct ContentView: View {
    @State var game = Game()
    var body: some View {
        if (game.result == "Paper! Rock! Scissor! Go!") {
            startingView
        } else {
            finishView
        }
    }
    
    var startingView: some View {
            VStack {
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .frame(width: 80, height: 80,alignment: .center)
                    .foregroundColor(.accentColor)
                    .padding()
                Text(game.result)
                HStack {
                    ForEach(game.rpsSet.sorted(by: <), id: \.key) { key, value in
                        Image(value)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .padding()
                            .onTapGesture{
                                game.result = game.winOrLose(userOutput: key)
                                game.user = value
                            }
                    }


                    }
                }
        }
    var finishView: some View {
        VStack {
            HStack{
                Text("Win: " + String(game.resultCount["win"]!))
                Text("Lose: " + String(game.resultCount["lose"]!))
                Text("Draw: " + String(game.resultCount["draw"]!))
            }
            
            Image(game.computer)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .padding()
                .rotationEffect(.degrees(180))
            Image(systemName: "desktopcomputer")
                .resizable()
                .frame(width: 80, height: 80,alignment: .center)
                .foregroundColor(.accentColor)
                .padding()
            Text(game.result)
            HStack {
                Image(game.user)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                }
            HStack {
                Button( "Play Again?", action:{
                    game.playAgain()
                }).foregroundColor(.blue)
                Button("Reset Count!",action:{
                    game.resetResultCount();
                    game.playAgain()
                }).foregroundColor(.red)
            }.padding()
        }
    }
    
}

struct Game {
    var result:String = "Paper! Rock! Scissor! Go!";
    var user:String = "";
    var computer:String = "";
    var resultCount:[String: Int] =  [
        "win": 0,
        "lose": 0,
        "draw": 0
    ];
    var rpsSet:[Int:String] = [
        1: "rocks",
        2: "paper",
        3: "scissors"
    ];
    
    mutating func winOrLose(userOutput:Int) -> String{
        var statement:String = "";
        let computerOutput = rpsSet.randomElement()!.key
        computer = rpsSet[computerOutput]!
        if (userOutput == computerOutput) {
            statement = "Draw!!"
            resultCount["draw"]! = resultCount["draw"]! + 1;
        } else if (userOutput ==  computerOutput + 1 || userOutput == computerOutput - 2) {
            statement = "You Win!!"
            resultCount["win"]! = resultCount["win"]! + 1;
        } else {
            statement = "You Lose!!"
            resultCount["lose"]! = resultCount["lose"]! + 1
        }
        return statement;
    }
    
    mutating func resetResultCount() {
        resultCount =  [
            "win": 0,
            "lose": 0,
            "draw": 0
        ];
    }
    mutating func playAgain() {
    result = "Paper! Rock! Scissor! Go!"
    user = "";
    computer = "";
    }
}
