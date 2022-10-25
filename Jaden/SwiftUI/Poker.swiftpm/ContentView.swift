import SwiftUI

struct ContentView: View {
    var cards : [[String]] = []
    @State var players : [Int] = [0,0,0,0,0,0,0,0]
    @State var state = "Tie"
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
                Text("Player 1")
                Spacer()
                Text("Player 2")
                Spacer()
            }
            HStack{
                Card(number: cards[players[0]][1], suit: cards[players[0]][0])
                Card(number: cards[players[1]][1], suit: cards[players[1]][0])
                Card(number: cards[players[2]][1], suit: cards[players[2]][0])
                Card(number: cards[players[3]][1], suit: cards[players[3]][0])
                VStack{
                    Divider()
                }
                Card(number: cards[players[4]][1], suit: cards[players[4]][0])
                Card(number: cards[players[5]][1], suit: cards[players[5]][0])
                Card(number: cards[players[6]][1], suit: cards[players[6]][0])
                Card(number: cards[players[7]][1], suit: cards[players[7]][0])
                
            }
            Button("Random"){
                players = []
                var player11 = Int.random(in: 0...51)
                var player12 = Int.random(in: 0...51)
                var player13 = Int.random(in: 0...51)
                var player14 = Int.random(in: 0...51)
                if player11 == player12{
                    player12 += 1
                    if player12>51{
                        player12 -= 2
                    }
                }else if player11 == player13{
                    player13 += 1
                    if player13>51{
                        player13 -= 2
                    }
                }else if player11 == player14{
                    player14 += 1
                    if player14>51{
                        player14 -= 2
                    }
                }else if player12 == player13{
                    player13 += 1
                    if player13>51{
                        player13 -= 2
                    }
                }else if player12 == player14{
                    player14 += 1
                    if player14>51{
                        player14 -= 2
                    }
                }else if player13 == player14{
                    player14 += 1
                    if player14>51{
                        player14 -= 2
                    }
                }
                var player111 = 0
                var player112 = 0
                var player1 = 0
                if player11>player12{
                    player111 = player11
                }else if player11==player12{
                    player111 = player11
                }else{
                    player111 = player12
                }
                if player13>player14{
                    player112 = player13
                }else if player11==player12{
                    player112 = player13
                }else{
                    player112 = player14
                }
                if player111>player112{
                    player1 = player111
                }else if player11==player12{
                    player1 = player111
                }else{
                    player1 = player112
                }
                
                let player21 = Int.random(in: 0...51)
                var player22 = Int.random(in: 0...51)
                var player23 = Int.random(in: 0...51)
                var player24 = Int.random(in: 0...51)
                
                if player21 == player22{
                    player22 += 1
                    if player22>51{
                        player22 -= 2
                    }
                }else if player21 == player23{
                    player23 += 1
                    if player23>51{
                        player23 -= 2
                    }
                }else if player21 == player24{
                    player24 += 1
                    if player24>51{
                        player24 -= 2
                    }
                }else if player22 == player23{
                    player23 += 1
                    if player23>51{
                        player23 -= 2
                    }
                }else if player22 == player24{
                    player24 += 1
                    if player24>51{
                        player24 -= 2
                    }
                }else if player23 == player24{
                    player24 += 1
                    if player24>51{
                        player24 -= 2
                    }
                }
                
                var player211 = 0
                var player212 = 0
                var player2 = 0
                
                if player21>player22{
                    player211 = player21
                }else if player21==player22{
                    player211 = player21
                }else{
                    player211 = player22
                }
                if player23>player24{
                    player212 = player23
                }else if player21==player22{
                    player212 = player23
                }else{
                    player212 = player24
                }
                if player211>player212{
                    player2 = player211
                }else if player21==player22{
                    player2 = player211
                }else{
                    player2 = player212
                }
                
                players.append(player11)
                players.append(player12)
                players.append(player13)
                players.append(player14)
                players.append(player21)
                players.append(player22)
                players.append(player23)
                players.append(player24)
                
                if player1>player2{
                    state = "Player 1 Won"
                }else if player1==player2{
                    state = "Tie"
                }else{
                    state = "Player 2 Won"
                }
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
