import SwiftUI

struct ContentView: View {
    @State var p1suit = "♠️"
    @State var p1integer = 0
    @State var p1number = "A"
    @State var p2suit = "♠️"
    @State var p2integer = 0
    @State var p2number = "A"
    @State var tie = false
    @State var p1win = false
    @State var p2win = false
    
    func checkWin(){
        p1integer = 0
        p2integer = 0
        tie = false
        p1win = false
        p2win = false
        if p1number == "J"{
            p1integer = 11
        }else if p1number == "Q"{
            p1integer = 12
        }else if p1number == "K"{
            p1integer = 13
        }else if p1number == "A"{
            p1integer = 14
        }else{
            p1integer = Int(p1number) ?? 0
        }
        print(p1integer)
        if p2number == "J"{
            p2integer = 11
        }else if p2number == "Q"{
            p2integer = 12
        }else if p2number == "K"{
            p2integer = 13
        }else if p2number == "A"{
            p2integer = 14
        }else{
            p2integer = Int(p2number) ?? 0
        }
        print(p2integer)
        if p1integer == p2integer && p1suit == p2suit{
            print("tie")
            tie = true
        }else if p1integer > p2integer{
            print("p1win")
            p1win = true
        }else if p2integer > p1integer{
            print("p2win")
            p2win = true
        }else{
            if p1suit == "♠️"{
                p1win = true
            }else if p1suit == "♥️"{
                if p2suit == "♣️" || p2suit == "♦️"{
                    p1win = true
                }else{
                    p2win = true
                }
            }else if p1suit == "♣️"{
                if p2suit == "♦️"{
                    p1win = true
                }else{
                    p2win = true
                }
            }else{
                p2win = true
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack{
                if tie == true{
                    Text("It's a tie")
                }else if p1win == true{
                    Text("Player 1 Wins")
                }else if p2win == true{
                    Text("Player 2 Wins")
                }else{
                    Text("")
                }
            }
            HStack{
                Card(testNumber: p1number, testSuit: p1suit)
                Card(testNumber: p2number, testSuit: p2suit)
            }
            Button("Random"){
                p1number = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"].randomElement()!
                p1suit = ["♦️","♣️","♥️","♠️"].randomElement()!
                p2number = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"].randomElement()!
                p2suit = ["♦️","♣️","♥️","♠️"].randomElement()!
                checkWin()
            }
            .buttonStyle(.borderedProminent)
        }.onAppear(){
            p1number = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"].randomElement()!
            p1suit = ["♦️","♣️","♥️","♠️"].randomElement()!
            p2number = ["2","3","4","5","6","7","8","9","10","J","Q","K","A"].randomElement()!
            p2suit = ["♦️","♣️","♥️","♠️"].randomElement()!
            checkWin()
        }
    }
}
