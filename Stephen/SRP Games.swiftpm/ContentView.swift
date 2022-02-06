import SwiftUI

struct ContentView: View {
    @State var user : String = "No Choose"
    @State var computer : String = "No Choose"
    @State var comImage : String = "robot"
    @State var result : String = "Please choose"
    @State var gameCounts : Int = 0
    @State var winCounts : Int = 0
    @State var lossCounts : Int = 0
    @State var tiedCounts : Int = 0
    
    func caiQ(){
        let all = ["rock", "paper","scissors"]
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
    
    var body: some View {
        VStack {
            Text(computer)
//                .font(.largeTitle)
            Image(comImage)
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .cornerRadius(20)
                .frame(width:400,height: 200)
            Text(result)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
        }
        if result == "Please choose"{
            HStack{
                Image("rock")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture {
                        user = "rock"
                        caiQ()
                    }
                Image("scissors")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture {
                        user = "scissors"
                        caiQ()
                    }
                Image("paper")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .onTapGesture {
                        user = "paper"
                        caiQ()
                    }
                
            }
            .padding(.all, 5.0)
            Text(user)
        }else{
            VStack{
                Image(user)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(20)
                    .frame(width:400,height: 200)
                Text(user)
               
                Image(systemName: "restart.circle")
                    .frame(width: 25, height:25)
                    .onTapGesture {
                        result = "Please choose"
                        user = "No Choose!"
                        computer = "No Choose!"
                        comImage = "robot"
                    }
                VStack(
                       alignment: .leading,
                       spacing: 3
                ) {
                    Text("You played \(gameCounts) times.")
                    Text("You won \(winCounts) times.")
                    Text("You tied \(tiedCounts) times.")
                    Text("You lost \(lossCounts) times.")
                }
            }
        }
    }
}
