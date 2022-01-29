import SwiftUI

struct ContentView: View {
    @State var outcome : Outcome = Outcome()
    @State var tie = 0
    @State var win = 0
    @State var lose = 0
    @State var text = "Choose one"
    @State var comp = "4"
    @State var result = 0
    @State var player = ""
    @State var image1 = "1"
    @State var image2 = "2"
    @State var image3 = "3"
    @State var record = ""
    var body: some View {
        VStack {
            Spacer()
            Text("Record: Wins: \(win) Ties: \(tie) Loses: \(lose)")
            Spacer()
            Image(comp)
                .resizable()
                .frame(width: 100, height: 100)
                .background(
                    Image("5")
                        .resizable()
                        .cornerRadius(20)
                )
            Spacer()
            Text(text)
                .font(.largeTitle)
                .foregroundColor(.red)
            Spacer()
            HStack{
                
                Spacer()
                Button {
                    outcome.recordTie()
                    outcome.recordWin()
                    outcome.recordLose()
                    lose = outcome.loses
                    win = outcome.wins
                    tie = outcome.ties
                    outcome.player = "1"
                    outcome.randomcomp()
                    comp = outcome.comp
                    text = outcome.result
                } label: {
                    Image(image1)
                        .resizable()
                        .frame(width: 70, height: 70)
                        .background(
                            Image("5")
                                .resizable()
                                .cornerRadius(20)
                        )

                }
                Spacer()
                Button {
                    outcome.recordTie()
                    outcome.recordWin()
                    outcome.recordLose()
                    lose = outcome.loses
                    win = outcome.wins
                    tie = outcome.ties
                    outcome.player = "2"
                    outcome.randomcomp()
                    comp = outcome.comp
                    text = outcome.result
                } label: {
                Image(image2)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .background(
                        Image("5")
                            .resizable()
                            .cornerRadius(20)
                    )
                }
                
                Spacer()
                Button {
                    outcome.recordTie()
                    outcome.recordWin()
                    outcome.recordLose()
                    lose = outcome.loses
                    win = outcome.wins
                    tie = outcome.ties
                    outcome.randomcomp()
                    comp = outcome.comp
                    outcome.player = "3"
                    text = outcome.result
                } label: {
                Image(image3)
                    .resizable()
                    .frame(width: 70, height: 70)
                    .background(
                        Image("5")
                            .resizable()
                            .cornerRadius(20)
                    )
                }
                Spacer()
                    
            }
            Spacer()

        }
    }
}
struct Outcome{
    var player = ""
    var text = "Choose one"
    var image = ""
    var rando = Int.random(in: 1..<4)
    var comp : String {
        return String(rando)
    }
    mutating func randomcomp(){
        rando = Int.random(in: 1..<4)
    }
    var ties = 0
    var wins = 0
    var loses = 0
    mutating func tiecount(){
        ties += 1
    }
    mutating func wincount(){
        wins += 1
    }
    mutating func losecount(){
        loses += 1
    }
    mutating func recordWin(){
        if player == "3" && comp == "2"{
            wincount()
        }else if player == "2" && comp == "1"{
            wincount()
        }else if player == "1" && comp == "3"{
            wincount()
        }
    }
    mutating func recordTie(){
        if player == "3" && comp == "3"{
            tiecount()
        }else if player == "2" && comp == "2"{
            tiecount()
        }else if player == "1" && comp == "1"{
            tiecount()
        }
    }
    mutating func recordLose(){
        if player == "3" && comp == "1"{
            losecount()
        }else if player == "2" && comp == "3"{
            losecount()
        }else if player == "1" && comp == "2"{
            losecount()
        }
    }


    var result : String{
        if player == "3" && comp == "3"{
            return "It's A Tie"
        }else if player == "3" && comp == "2"{
            return "You Win"
        }else if player == "3" && comp == "1"{
            return "You Lose"
        }else if player == "2" && comp == "2"{
            return "It's A Tie"
        }else if player == "2" && comp == "3"{
            return "You Lose"
        }else if player == "2" && comp == "1"{
            return "You Win"
        }else if player == "1" && comp == "1"{
            return "It's A Tie"
        }else if player == "1" && comp == "2"{
            return "You Lose"
        }else if player == "1" && comp == "3"{
            return "You Win"
        }else{
            return ""
        }
    }

}
