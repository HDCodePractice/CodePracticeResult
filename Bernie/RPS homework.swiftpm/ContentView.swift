import SwiftUI

struct ContentView: View {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var result : String = "Please Choose"
    @State var playingornot : Bool = true
    @State var won = 0
    @State var lost = 0
    @State var tied = 0
    
    func winorloose(){
        if  (computer == "rock" && user == "paper") || (computer == "scissor" && user == "rock") ||
                (computer == "paper" && user == "scissor") {
            result = "You won!"
        }else if computer == user {
            result = "You tied!"
        }else{
            result = "You lost!"
        }
    }
    
    func count(){
        if (result == "You won!"){
            won += 1
        }else if (result == "You tied!"){
            tied += 1
        }else if (result == "You lost!"){
            lost += 1
        }
    }
    
    var body: some View {
        if ( playingornot == true){
            VStack {
                Text(computer )
                    .font(.largeTitle)
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .frame(width: 100, height:100)
                    .padding()
                    .onTapGesture {
                        user = "computer"
                    }
                Text(result)
                    .font(.largeTitle)
                HStack {
                    Image("rock")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .onTapGesture {
                            user = "rock"
                            let all = ["rock", "paper", "scissor"]
                            if let c = all.randomElement(){
                                computer = c
                                playingornot = false
                                winorloose()
                                count()
                            }else{
                                computer = "No Choose"
                            }
                        }
                    Image("paper")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .onTapGesture {
                            user = "paper"
                            let all = ["rock", "paper", "scissor"]
                            if let c = all.randomElement(){
                                computer = c
                                playingornot = false
                                winorloose()
                                count()
                            }else{
                                computer = "No Choose"
                            }
                        }
                    Image("scissor")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(30)
                        .onTapGesture {
                            user = "scissor"
                            let all = ["rock", "paper", "scissor"]
                            if let c = all.randomElement(){
                                computer = c
                                playingornot = false
                                winorloose()
                                count()
                            }else{
                                computer = "No Choose"
                            }
                        }
                }.padding()
                Text(user)
                    .font(.largeTitle)
            }
        }else if(playingornot == false){
            VStack {
                Image(computer)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                Text(computer )
                    .font(.largeTitle)
                Image(systemName: "desktopcomputer")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.accentColor)
                    .frame(width: 100, height:100)
                    .padding()
                    .onTapGesture {
                        user = "computer"
                    }
                Text(result)
                    .font(.largeTitle)
                Image(user)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                Text(user)
                    .font(.largeTitle)
                Text("Play it again")
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3))
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                        playingornot = true
                        computer = "No Choose"
                        user = "No Choose"
                        result = "Please Choose"
                    }
                    
                HStack {
                    Text("won: \(won)")
                        .font(.title)
                    Text("lost: \(lost)")
                        .font(.title)
                    Text("tied: \(tied)")
                        .font(.title)
                }
                Text("Restart")
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(lineWidth: 3))
                    .foregroundColor(Color.blue)
                    .onTapGesture {
                        playingornot = true
                        computer = "No Choose"
                        user = "No Choose"
                        result = "Please Choose"
                        won = 0
                        lost = 0
                        tied = 0
                    }
            }
        }
    }
}



