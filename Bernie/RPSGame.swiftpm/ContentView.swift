import SwiftUI

struct ContentView: View {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var result : String = "Please Choose"
    
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
    var body: some View {
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
                            winorloose()
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
                            winorloose()
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
                            winorloose()
                        }else{
                            computer = "No Choose"
                        }
                    }
            }.padding()
            Text(user)
                .font(.largeTitle)
        }
    }
}


