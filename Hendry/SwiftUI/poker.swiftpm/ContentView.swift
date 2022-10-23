import SwiftUI

struct ContentView: View {
    @State var number = "A"
    @State var suit = "♠️"
    @State var number2 = "A"
    @State var suit2 = "♠️"
    @State var suitArray = ["♦️","♣️","♥️","♠️"]
    @State var numberArray = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]
    var body: some View {
        VStack{
            HStack{
                Text("Player1:")
                Card(number:number, suit:suit)
            }
            HStack{
                Text("Player2:")
                Card(number:number2, suit:suit2)
            }
            Button("random"){
                suit = suitArray.randomElement()!
                number = numberArray.randomElement()!
                suit2 = suitArray.randomElement()!
                number2 = numberArray.randomElement()!
//                if numberArray.firstIndex(of: number) ??0 > numberArray.firstIndex(of: number2) ??0 {
//                    Text("Player1 wins")
//                }else if numberArray.firstIndex(of: number) ??0 < numberArray.firstIndex(of: number2) ??0{
//                    Text("player2 wins")
//                }else if suitArray.firstIndex(of: suit) ??0 > suitArray.firstIndex(of: suit2) ??0 {
//                    Text("player1 wins")
//                }else if suitArray.firstIndex(of: suit) ??0 < suitArray.firstIndex(of: suit2) ??0 {
//                    Text("player2 wins")
//                }else {
//                    Text("Tie")
//                }
            }
        }
        .padding()
    }
}
