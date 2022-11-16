import SwiftUI

struct ContentView: View {
    var cards : [[String]] = []
    @State var players : [Int] = [0,0,0,0,0,0,0,0,0,0]
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
                Text("Player1")
                Spacer()
                Text("Player2")
                Spacer()
            }
            VStack{
            HStack{
                ForEach(0..<5, id:\.self){ item in
                    Card(number: cards[ players[item] ][1], suit: cards[players[item]][0])
                }
            }
                HStack{
                ForEach(5..<10, id:\.self){ item in
                    Card(number: cards[ players[item] ][1], suit: cards[players[item]][0])
                }
                }
            }
            Button("Random"){
                var cs : [Int] = []
                for i in 0...51{
                    cs.append(i)
                }
                
                let shuffledCs = cs.shuffled()
                players = Array(shuffledCs.prefix(10))
                
                let player1 = shuffledCs[0...4].max()!
                let player2 = shuffledCs[5...9].max()!
                
                if player1>player2{
                    state = "Player 1 Won"
                }else if player1==player2 {
                    state = "Tie"
                }else{
                    state = "Player 2 Won"
                }
            }
        }
        .padding()
    }
}
