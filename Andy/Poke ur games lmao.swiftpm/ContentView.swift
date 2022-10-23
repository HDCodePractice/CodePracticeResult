import SwiftUI

struct ContentView: View {
    let numbers : [String] = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    let suits : [String] = ["♦️","♣️","♥️","♠️"]
    @State var cards : [[String]] = [["♥️","3"]]
    @State var player1 = 0
    @State var player2 = 0
    @State var whowin = 0
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Text("Player 1")
                    Card_LoL(number: cards[player1][1], suit: cards[player1][0])
                        .frame(height: 450)
                }
                VStack{
                    Text("Player 2")
                    Card_LoL(number: cards[player2][1], suit: cards[player2][0])
                        .frame(height: 450)
                }
            }
            Button("random lol"){
                cards = []
                for i in numbers{
                    for j in suits{
                        cards.append([j,i])
                    }
                }
                player1 = Int.random(in: 0...51)
                player2 = Int.random(in: 0...51)
                print(player1)
                print(player2)
                print(cards)
                if player1 > player2{
                    whowin = 1
                }else if player2 > player1{
                    whowin = 2
                }else{
                    whowin = 0
                }
            }
            Text(whowin==0 ? "no one wins(Tie)" : whowin==1 ? "Player 1 Wins" : "Player 2 Wins")
            
        }
    }
}
