import SwiftUI
struct Game {
    var user : String = "Please choose!"
    var computer : String = "AI not choose yet"
    var wl : String = "Scissors paper rock!"
    var scoreW : Int = 0
    var scoreL : Int = 0
    var scoreT : Int = 0
    var gameMode : Int  = 1
    let all = ["Rock","Paper","Scissors"]
    //0 start 1 gameing 2 result
    mutating func triggerAI() {
        if let c = all.randomElement() {
            computer = c
        }else{
            computer = "AI not choose yet"
        }
        caculateResult()
    }
    mutating func caculateResult() {
        let result = ["You win!", "You lose!", "Tie!"]
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
    mutating func scoreReset() {
        scoreW = 0
        scoreL = 0
        scoreT = 0
    }
}

struct ContentView: View {
    @State var game = Game()
    var startPage: some View{
        VStack {
            Text("Scissors paper rock!").font(.largeTitle).fontWeight(.medium)
            ZStack {
                Rectangle().fill(Color.blue)
                    .frame(width: 150, height: 50).cornerRadius(20)
                Text("Start!")
                    .font(.title2).fontWeight(.medium).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).onTapGesture {
                        game.gameMode = 1
                    }
            }
        }
    }
    var gameResult: some View {
        VStack{
            Text(game.wl).font(.largeTitle).fontWeight(.medium)
            Text("win round:\(game.scoreW)\nlose round:\(game.scoreL)\ntie round:\(game.scoreT)\n")
                .font(.subheadline).fontWeight(.light)
            HStack {
                ZStack {
                    Rectangle().fill(Color.blue)
                        .frame(width: 150, height: 50).cornerRadius(20)
                    Text("go back")
                        .font(.title2).fontWeight(.medium).foregroundColor(.white).onTapGesture {
                            game.gameMode = 1
                        }
                }
                ZStack {
                    Rectangle().fill(Color.blue)
                        .frame(width: 150, height: 50).cornerRadius(20)
                    Text("restart")
                        .font(.title2).fontWeight(.medium).foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/).onTapGesture {
                            game.scoreReset()
                            game.wl = "Scissors paper rock!"
                            game.gameMode = 1
                        }
                }
            }
        }
    }
    var gamePlay: some View {
        VStack {
            
            Text(game.computer).font(.title2)
                .fontWeight(.heavy).foregroundColor(Color.white)
            if game.computer == "Rock"||game.computer == "Paper"||game.computer == "Scissors"{
                Image(game.computer).imageScale(.small).padding(.all, 20.0)
            }else {
                Image(game.computer).imageScale(.small).padding(.all, 20.0).hidden()
            }
            
            Image(systemName: "desktopcomputer").resizable().scaledToFit()
                .foregroundColor(.accentColor)
                .padding(.all, 20)
                .frame(width: 200, height: 100)
                .imageScale(.small)
            Text(game.wl).font(.largeTitle).fontWeight(.medium)
            HStack {
                ForEach(game.all,id: \.self)
                { i in
                    Image(i)
                        .resizable().scaledToFit()
                        .cornerRadius(5).onTapGesture {
                            game.user = i
                            game.triggerAI()
                        }
                }
            }
            .padding(.all, 10.0)
            Text(game.user)
                .font(.title2)
                .fontWeight(.medium)
            ZStack {
                Rectangle().fill(Color.blue)
                    .frame(width: 200, height: 50).cornerRadius(20)
                Text("pause game")
                    .font(.title2).fontWeight(.medium).foregroundColor(.white).onTapGesture {
                        game.gameMode = 2
                    }
            }
            //.padding(.bottom, 150.0)
        }
    }
    var body: some View {
        ZStack {
            Rectangle().fill(Color.blue).frame(width: .infinity, height: 85).padding(.bottom, 650).ignoresSafeArea()
            if game.gameMode == 0 {
                startPage
            }else if game.gameMode == 1{
                gamePlay
            }else if game.gameMode == 2{
                gameResult
            }

        }
        
    }
}
