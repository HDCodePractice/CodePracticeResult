import SwiftUI

struct ContentView: View {
    var cards : [[String]] = []
    @State var cardsInNumbers : [[Int]] = []
    @State var players : [Int] = [0,0,0,0,0,0,0,0]
    @State var state : String = "tie"
    
    init(){
        for i in ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]{
            for j in ["♦️","♣️","♥️","♠️"]{
                cards.append([j,i])
            }
        }
        for a in cardsInNumbers{
            for b in a{
                if cards[a.count][b] == "2"{
                    cardsInNumbers.append([2])
                } else if cards[a.count][b] == "3"{
                    cardsInNumbers.append([3])
                } else if cards[a.count][b] == "4"{
                    cardsInNumbers.append([4])
                } else if cards[a.count][b] == "5"{
                    cardsInNumbers.append([5])
                } else if cards[a.count][b] == "6"{
                    cardsInNumbers.append([6])
                } else if cards[a.count][b] == "7"{
                    cardsInNumbers.append([7])
                } else if cards[a.count][b] == "8"{
                    cardsInNumbers.append([8])
                } else if cards[a.count][b] == "9"{
                    cardsInNumbers.append([9])
                } else if cards[a.count][b] == "10"{
                    cardsInNumbers.append([10])
                } else if cards[a.count][b] == "J"{
                    cardsInNumbers.append([11])
                } else if cards[a.count][b] == "Q"{
                    cardsInNumbers.append([12])
                } else if cards[a.count][b] == "K"{
                    cardsInNumbers.append([13])
                } else if cards[a.count][b] == "A"{
                    cardsInNumbers.append([2])
                } 
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
                ForEach(0..<8, id:\.self){ item in
                    Card(number: cards[ players[item] ][1], suit: cards[players[item]][0])
                }
                
            }
            Button("Random"){
                var cs : [Int] = []
                for i in 0...51{
                    cs.append(i)
                }
                let shuffledCs = cs.shuffled()
                let max = shuffledCs[0...8].max()
                players = Array(shuffledCs.prefix(8))
                
                let player1 = 0
                let player2 = 0
                
                player1 += cardsInNumbers[shuffledCs[0]]
//                let player1 = shuffledCs[0...3].max()!
//                let player2 = shuffledCs[4...7].max()!
//                
//                if player1>player2{
//                    state = "Player 1 Won"
//                }else if player1==player2 {
//                    state = "Tie"
//                }else{
//                    state = "Player 2 Won"
//                }
            }
        }
        .padding()
    }
}
