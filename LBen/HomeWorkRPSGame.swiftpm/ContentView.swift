import SwiftUI

struct ContentView: View {
    @State var result:String = "Paper! Rock! Scissor! Go!";
    @State var user:String = "";
    @State var computer:String = "";
    @State var resultCount:[String: Int] =  [
        "win": 0,
        "lose": 0,
        "draw": 0
    ];
    @State var rpsSet:[Int:String] = [
        1: "rocks",
        2: "paper",
        3: "scissors"
    ];
    
    func winOrLose(userOutput:Int) -> String{
        var statement:String = "";
        let computerOutput = rpsSet.randomElement()!.key
        computer = rpsSet[computerOutput]!
        if (userOutput == computerOutput) {
            statement = "Draw!!"
            resultCount["draw"]! = resultCount["draw"]! + 1;
        } else if (userOutput ==  computerOutput + 1) {
            statement = "You Win!!"
            resultCount["win"]! = resultCount["win"]! + 1;
        } else {
            statement = "You Lose!!"
            resultCount["lose"]! = resultCount["lose"]! + 1
        }
        return statement;
    }
    
    func resetResultCount() {
        resultCount =  [
            "win": 0,
            "lose": 0,
            "draw": 0
        ];
    }
    func playAgain() {
    result = "Paper! Rock! Scissor! Go!"
    user = "";
    computer = "";
    }
    var body: some View {
        if (result == "Paper! Rock! Scissor! Go!") {
            VStack {
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .frame(width: 80, height: 80,alignment: .center)
                    .foregroundColor(.accentColor)
                    .padding()
                Text(result)
                HStack {
                    Image("rocks")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding()
                        .onTapGesture{
                            result = winOrLose(userOutput: 1)
                            user = "rocks"
                        }
                    Image("paper")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding()
                        .onTapGesture{
                            result = winOrLose(userOutput: 2)
                            user = "paper"
                        }
                    Image("scissors")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding()
                        .onTapGesture{
                            result = winOrLose(userOutput: 3)
                            user = "scissors"
                        }
                    }
                }
        } else {
            VStack {
                HStack{
                    Text("Win: " + String(resultCount["win"]!))
                    Text("Lose: " + String(resultCount["lose"]!))
                    Text("Draw: " + String(resultCount["draw"]!))
                }
                
                Image(computer)
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
                Text(result)
                HStack {
                    Image(user)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .padding()
                    }
                HStack {
                    Button( "Play Again?", action:{
                        playAgain()
                    }).foregroundColor(.blue)
                    Button("Reset Count!",action:{
                        resetResultCount();
                        playAgain()
                    }).foregroundColor(.red)
                }
            }
        }
    }
}
