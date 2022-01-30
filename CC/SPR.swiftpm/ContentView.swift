import SwiftUI

struct ContentView: View {
    @State var strImage:String = "question"
    @State var strResult:String = "Let's start! Choose one"
    @State var strUser:String = ""
    @State var strComputer:String = ""
    @State var intCountPlay:Int = 0
    @State var intCountWin:Int = 0
    @State var intCountLoss:Int = 0
    @State var intCountTied:Int = 0
    func WinOrLoss(user:String){
        let all = ["rock","paper","scissors"]
        intCountPlay += 1
        
        if let c = all.randomElement() {
            strComputer = c
            strImage = strComputer
        }
        if user == strComputer {
            strResult = "Tied"
            intCountTied += 1
        }else if (user == "rock" && strComputer == "scissors"){
            strResult = "You win"
        }else if (user == "rock" && strComputer == "paper"){
            strResult = "You loss"
        }else if (user == "scissors" && strComputer == "rock"){
            strResult = "You loss"
        }else if (user == "scissors" && strComputer == "paper"){
            strResult = "You win"
        }else if (user == "paper" && strComputer == "scissors"){
            strResult = "You loss"
        }else if (user == "paper" && strComputer == "rock"){
            strResult = "You win"
        }
        if strResult == "You win" {
            intCountWin += 1
        }else if strResult == "You loss" {
            intCountLoss += 1
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(.sRGB, red: 0.28, green: 0.68, blue: 0.73))
            Text("Rock！Paper！Scissors!")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .shadow(color: Color.white, radius: 4, x: 2, y: 2)
        }
        //.padding(.top, -5)
        .frame(height: 125)
        
        VStack {
            Image(strImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 140, height: 100)
                .padding(.top, 25)
            
            Text(strResult)
                .font(.title2)
                .padding(.vertical, 20.0)
                .foregroundColor(Color(.sRGB, red: 0.28, green: 0.68, blue: 0.73))
            
            if strResult == "Let's start! Choose one" {
                HStack(alignment: .center){
                    Image("rock")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture {
                            strUser = "rock"
                            WinOrLoss(user: strUser)
                        }
                    Image("paper")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture {
                            strUser = "paper"
                            WinOrLoss(user: strUser)
                        }
                    Image("scissors")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .onTapGesture {
                            strUser = "scissors"
                            WinOrLoss(user: strUser)
                        }
                }
                .frame(height: 100)
                .padding(.bottom, 25.0)
            }else {
                ZStack{
                    Image(strUser)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(width: 140, height: 100)
                        .padding(.top, 25)
                    Image("playagain")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .frame(width: 100, height: 80)
                        .padding(.leading, 200.0)
                        .onTapGesture {
                            strResult = "Let's start! Choose one"
                            strImage = "question"
                        }
                }
                .frame(height: 100)
                .padding(.bottom, 25.0)
            }
            
            ZStack(alignment: .top){
                Rectangle()
                    .fill(Color(.sRGB, red: 0.28, green: 0.68, blue: 0.73))
                    .frame(height: 145)

                HStack{
                    VStack(alignment: .trailing){
                        Text("You played:")
                        Text("You won:")
                        Text("You lost:")
                        Text("Tied ")
                    }
                    .padding(.top, 20.0)
                    .foregroundColor(Color.white)
                    VStack(alignment: .leading){
                        Text("\(intCountPlay)")
                        Text("\(intCountWin)")
                        Text("\(intCountLoss)")
                        Text("\(intCountTied)")
                    }
                    .padding(.top, 20.0)
                    .foregroundColor(Color.white)
                }
            }
        }
    }
}
