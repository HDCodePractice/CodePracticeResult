import SwiftUI

struct ContentView: View {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var result : String = "Please Choose"
    
    func winOrLoose() {
        let all = ["rock","paper","scissors"]
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
    }
    
    var body: some View {
        VStack {
            Text(computer)
                .font(.largeTitle)
            Image(systemName: "desktopcomputer")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .frame(width: 100, height: 100)
                .padding()
            Text(result)
                .font(.largeTitle)
            HStack{
                Image("rock")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .onTapGesture {
                        user = "rock"
                        winOrLoose()
                    }
                Image("paper")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .onTapGesture {
                        user = "paper"
                        winOrLoose()
                    }
                Image("scissors")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(30)
                    .onTapGesture {
                        user = "scissors"
                        winOrLoose()
                    }
            }
            .padding()
            Text(user)
                .font(.largeTitle)
        }
    }
}
