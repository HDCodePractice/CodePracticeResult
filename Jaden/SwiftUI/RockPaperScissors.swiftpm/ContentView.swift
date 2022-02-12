import SwiftUI

struct ContentView: View {
    @State var game = false
    @State var outcome : Outcome = Outcome()
    @State var text = ""
    @State var text2 = "Choose one"
    @State var comp = "4"
    @State var result = 0
    @State var player = ""
    @State var image1 = "1"
    @State var image2 = "2"
    @State var image3 = "3"
    @State var record = ""
    var body: some View {
        if game == false{
            VStack {
                Spacer()
                Text("Record: Wins: \(outcome.won) Ties: \(outcome.tied) Loses: \(outcome.lost)")
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
                Text(text2)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                Spacer()
                HStack{
                    
                    Spacer()
                    Button {
                        outcome.recordAll()
                        outcome.player = "1"
                        outcome.randomcomp()
                        comp = outcome.comp
                        text = outcome.result
                        text2 = ""
                        game = true
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
                        outcome.recordAll()
                        outcome.player = "2"
                        outcome.randomcomp()
                        comp = outcome.comp
                        text = outcome.result
                        text2 = ""
                        game = true
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
                        outcome.recordAll()
                        outcome.randomcomp()
                        comp = outcome.comp
                        outcome.player = "3"
                        text = outcome.result
                        text2 = ""
                        game = true
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
        } else if game == true {
            VStack(spacing:15){
                
                HStack {

                    Text("Record: Wins: \(outcome.won) Ties: \(outcome.tied) Loses: \(outcome.lost)")
                }
                VStack(spacing:30) {
                    Text("Computer")
                        .font(.title)
                    Image(comp)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                    VStack(alignment: .center) {
                        Text(text)
                            .bold()
                            .font(.largeTitle)
                    }
                    Text("You")
                        .font(.title)
                    Image(outcome.player)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110, height: 110)
                }
                Button() {
                    comp = "4"
                    text2 = "Choose One"
                    game = false
                } label: {
                    ZStack {
                        Color.accentColor
                        Text("Play again?")
                            .foregroundColor(.white)
                    }
                        .frame(width: 140, height: 50)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                }
            }.padding()
            Spacer()
        }
    }
}
struct Outcome{
    var player = ""
    var rando = Int.random(in: 6..<9)
    var comp : String {
        return String(rando)
    }
    mutating func randomcomp(){
        rando = Int.random(in: 6..<9)
    }
    var tied = 0
    var won = 0
    var lost = 0
    mutating func wins(){
        won += 1
    }
    mutating func ties(){
        tied += 1
    }
    mutating func loses(){
        lost += 1
    }
    

    mutating func recordAll(){
        if player == "3" && comp == "7"{
            wins()
        }else if player == "2" && comp == "6"{
            wins()
        }else if player == "1" && comp == "8"{
            wins()
        }else if player == "3" && comp == "8"{
            ties()
        }else if player == "2" && comp == "7"{
            ties()
        }else if player == "1" && comp == "6"{
            ties()
        }else if player == "3" && comp == "6"{
            loses()
        }else if player == "2" && comp == "8"{
            loses()
        }else if player == "1" && comp == "7"{
            loses()
        }
//        return wins, ties, loses
    }


    var result : String{
        if player == "3" && comp == "8"{
            return "It's A Tie"
        }else if player == "3" && comp == "7"{
            return "You Win"
        }else if player == "3" && comp == "6"{
            return "You Lose"
        }else if player == "2" && comp == "7"{
            return "It's A Tie"
        }else if player == "2" && comp == "8"{
            return "You Lose"
        }else if player == "2" && comp == "6"{
            return "You Win"
        }else if player == "1" && comp == "6"{
            return "It's A Tie"
        }else if player == "1" && comp == "7"{
            return "You Lose"
        }else if player == "1" && comp == "8"{
            return "You Win"
        }else{
            return ""
        }
    }

}
