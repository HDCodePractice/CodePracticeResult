import SwiftUI

struct ContentView: View {
    @State var user : String = "Please choose!"
    @State var computer : String = "AI not choose yet"
    @State var wl : String = "Scissors paper rock!"
    @State var scoreW : Int = 0
    @State var scoreL : Int = 0
    @State var scoreT : Int = 0
    @State var gameMode : Int  = 1
    //0 start 1 gameing 2 result
    func triggerAI() {
        let all = ["Rock","Paper","Scissors"]
        
        if let c = all.randomElement() {
            computer = c
        }else{
            computer = "AI not choose yet"
        }
        caculateResult()
    }
    func caculateResult() {
        let result = ["You win!", "L", "Tie!"]
        if user == "Rock" {
            if computer == "Rock"{
                wl = result[2]
                scoreT += 1
            }else if computer == "Paper"{
                wl = result[1]
                scoreL += 1
            }else{
                wl = result[0]
                scoreW += 1
            }
        }else if user == "Paper"{
            if computer == "Rock"{
                wl = result[0]
                scoreW += 1
            }else if computer == "Paper"{
                wl = result[2]
                scoreT += 1
            }else{
                wl = result[1]
                scoreL += 1
            }
        }else{
            if computer == "Rock"{
                wl = result[1]
                scoreL += 1
            }else if computer == "Paper"{
                wl = result[0]
                scoreW += 1
            }else{
                wl = result[2]
                scoreT += 1
            }
        }
    }
    func scoreReset() {
        scoreW = 0
        scoreL = 0
        scoreT = 0
    }
    var gameResult: some View {
        VStack{
            Text(wl).font(.largeTitle).fontWeight(.medium)
            Text("win round:\(scoreW)\nlose round:\(scoreL)\ntie round:\(scoreT)\n")
                .font(.subheadline).fontWeight(.light)
            HStack {
                ZStack {
                    Rectangle().fill(Color.blue)
                        .frame(width: 150, height: 50).cornerRadius(20)
                    Text("go back")
                        .font(.title2).fontWeight(.medium).foregroundColor(.white).onTapGesture {
                            gameMode = 1
                        }
                }
                ZStack {
                    Rectangle().fill(Color.blue)
                        .frame(width: 150, height: 50).cornerRadius(20)
                    Text("restart")
                        .font(.title2).fontWeight(.medium).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).onTapGesture {
                            scoreReset()
                            wl = "Scissors paper rock!"
                            gameMode = 1
                        }
                }
            }
        }
    }
    var gamePlay: some View {
        VStack {
            Text(computer).font(.title2)
                .fontWeight(.medium)
            Image(systemName: "desktopcomputer").resizable().scaledToFit()
                .foregroundColor(.accentColor)
                .padding(.all, 20)
                .frame(width: 200, height: 200)
            //.imageScale(.large)
            Text(wl).font(.largeTitle).fontWeight(.medium)
            HStack {
                Image("Rock")
                    .resizable().scaledToFit()
                    .cornerRadius(5).onTapGesture {
                        user = "Rock"
                        triggerAI()
                    }
                Image("Paper").resizable().scaledToFit()
                    .cornerRadius(5).onTapGesture {
                        user = "Paper"
                        triggerAI()
                    }
                Image("Scissors").resizable().scaledToFit().cornerRadius(5).onTapGesture {
                    user = "Scissors"
                    triggerAI()
                }
            }
            .padding(.all, 10.0)
            Text(user)
                .font(.title2)
                .fontWeight(.medium)
            ZStack {
                Rectangle().fill(Color.blue)
                    .frame(width: 200, height: 50).cornerRadius(20)
                Text("pause game")
                    .font(.title2).fontWeight(.medium).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).onTapGesture {
                        gameMode = 2
                    }
            }
        }
    }
    var body: some View {
        VStack {
            if gameMode == 1{
                gamePlay
            }else if gameMode == 2{
                gameResult
            }
        }
    }
}
