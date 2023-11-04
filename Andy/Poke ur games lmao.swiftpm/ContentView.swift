import SwiftUI
struct ContentView: View {
    var cards : [[String]] = [["♥️","3"]]
    @State var player = [0,0,0,0,0,5,0,0]
    @State var playerA = 0
    @State var playerB = 0
    @State var stats = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    init(){
        cards = []
        for i in ["2","3","4","5","6","7","8","9","10","J","Q","K","A"] {
            for j in ["♦️","♣️","♥️","♠️"] {
                cards.append([j,i])
            }
        }
    }
    var body: some View {
        VStack {
            HStack{
                ForEach(0...1,id:\.self){ l in
                    VStack{
                        Text("Player \(l+1)")
                        ForEach(0...1,id:\.self){ i in
                            HStack{
                                ForEach(0...1,id:\.self){ j in
                                    var x : Int = i*2+j+(l*4)
                                    Card_LoL(number: cards[player[x]][1], suit: cards[player[x]][0])
                                }
                            }
                        }
                    }
                }
            }
            Text(playerA != playerB ? (playerA > playerB ? "player 1 Wins" : "player 2 Wins") : "Tie" )
            Button("random lol"){
                var lol : [Int] = []
                for i in 0...51{lol.append(i)}
                player = [Int](lol.shuffled()[0...7])
                playerA = 0
                playerB = 0
                for i in 0...3{
                    playerA += (stats.firstIndex(of: cards[player[i]][1]) ?? 0)+2
                    playerB += (stats.firstIndex(of: cards[player[i+4]][1]) ?? 0)+2
                }
                print(playerA)
                print(playerB)
            }
        }
    }
}
