import SwiftUI
struct ContentView: View {
    var cards : [[String]] = []
    @State var players : [Int] = [0,0,0,0,0,0,0,0]
    @State var state = "Tie"
    init(){for i in ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]{ for j in ["♦️","♣️","♥️","♠️"]{ cards.append([j,i])}}}
    var body: some View {
        VStack {
            Text("State: \(state)")
                .font(.largeTitle)
            HStack{
                Spacer()
                Text("Player 1")
                Spacer()
                Text("Player 2")
                Spacer()
            }
            HStack{
                ForEach(0..<8,id:\.self){ i in
                    Card(number: cards[players[i]][1], suit: cards[players[i]][0])
                }
            }
            Button("Random"){
                players = []
                let numbers = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51]
                let x = numbers.shuffled()
                for i in 0...7{ players.append(x[i])}
                if x.firstIndex(of: x[0...7].max()!)! >= 0 && x.firstIndex(of: x[0...7].max()!)! <= 3{ state = "Player 1 Won" }else{ state = "Player 2 Won"}
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
