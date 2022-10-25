import SwiftUI

struct ContentView: View {
    var cards : [[String]] = [["♥️","3"]]
    @State var player = [0,0,0,0,0,0,0,0]
    @State var biggest = 8
    init(){
        for i in ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]{
            for j in ["♦️","♣️","♥️","♠️"]{
                cards.append([j,i])
            }
        }
    }
    var body: some View {
        VStack {
            HStack{
                VStack{
                    Text("Player 1")
                    ForEach(0...1,id:\.self){ i in
                        HStack{
                            ForEach(0...1,id:\.self){ j in
                                var x : Int = i*2+j
                                Card_LoL(number: cards[player[x]][1], suit: cards[player[x]][0])
                            }
                        }
                    }
                }
                VStack{
                    Text("Player 2")
                    ForEach(0...1,id:\.self){ i in
                        HStack{
                            ForEach(0...1,id:\.self){ j in
                                var x2 : Int = i*2+j+4
                                Card_LoL(number: cards[player[x2]][1], suit: cards[player[x2]][0])
                            }
                        }
                    }
                }
            }
            Text(biggest < 8 ? biggest < 4 ? "player 1 Wins" : "player 2 Wins" : "Game Not Started" )
            Button("random lol"){
                var lol = false
                while lol == false{
                    lol = true
                    for i in 0...7{
                        player[i] = Int.random(in:0...51)
                        for j in 0...7{
                            if player[j] == player[i] && j != i{
                                lol = false
                            }
                        }
                    }
                    print(player)
                }
                for i in 0...7{
                    var loll = true
                    for j in 0...7{
                        if player[i] < player[j]{
                            loll = false
                        }
                    }
                    if loll{
                        biggest = i
                        print(biggest)
                    }
                }
            }
        }
    }
}

