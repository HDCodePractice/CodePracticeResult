import SwiftUI

struct ContentView: View {
    var cards : [[String]] = []
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
                Text("Player1")
                Spacer()
                Text("Player2")
                Spacer()
            }
            HStack{
                ForEach(0..<2, id:\.self){ item in
                    Card(number: cards[ players[item] ][1], suit: cards[players[item]][0])
                }
                
            }
            Button("Random"){
                var cs : [Int] = []
                for i in 0...51{
                    cs.append(i)
                }
                let shuffledCs = cs.shuffled()
                let max = shuffledCs[0...7].max()
                let player1 : [Int] = shuffledCs[0,1,2,3]
                let player2 : [Int] = shuffledCs[4,5,6,7]
                players = [player1,player2]
                
                
            }
        }
        .padding()
    }
}
