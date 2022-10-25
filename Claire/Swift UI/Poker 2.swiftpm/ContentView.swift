import SwiftUI

struct ContentView: View {
    var cards : [[String]] = []
    @State var suit = "♥️"
    @State var number = "A"
    @State var players : [Int] = [0,0]
    @State var state : String = "tie"
    
    init(){
        for i in ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]{
            for j in ["♦️","♣️","♥️","♠️"]{
                cards.append([j,i])
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("State: \(state)")
                .font(.largeTitle)
            HStack{
                Spacer()
                Text("player 1")
                Spacer()
                Text("player 1")
                Spacer()
            }
            HStack{
                Card(number: cards[ players[0] ][1], suit: cards[players[0][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
                Card(number: cards[ players[0] ][1], suit: cards[players[0][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
                Card(number: cards[ players[1] ][1], suit: cards[players[1][0]])
            }
            Button("Random"){
                let player1 = Int.random(in: 0...51)
                let player2 = Int.random(in: 0...51)
                players = [player1,player2]
                if player1>player2{
                    state = "Player 1 won"
                } else if player1==player2{
                    state = "tie"
                }else{
                    state = "player 2 won"
                }
            }
        }
        .padding()
    }
}
