import SwiftUI

struct ContentView: View {
    @State var game: Game = Game()
    let buttons = ["Rock","Paper","Scissors"]
    var body: some View {
        NavigationView {
            let statistics = game.GetStats()
            let playresults = game.play()
            VStack (spacing: 60) {
                if game.Game == false {
                    VStack(spacing:15) {
                        HStack {
                            Text("Wins: " + String(statistics[1]))
                            Spacer()
                            Text("Loses: " + String(statistics[2]))
                            Spacer()
                            Text("Ties: " + String(statistics[0]))
                        }
                    }.padding(20)
                    DrawButtons()
                    HStack {
                        ForEach(buttons, id: \.self) { each in
                            Button() {
                                game.Player = each
                                game.Game = true
                            } label: {
                                ZStack {
                                    Color.accentColor
                                    Image(each)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                }
                                    .frame(width: 110, height: 110)
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                            }
                        }
                    }
                    Spacer()
                } else if game.Game == true {
                    VStack(spacing:15){
                        HStack {
                            Text("Wins: " + String(statistics[1]))
                            Spacer()
                            Text("Loses: " + String(statistics[2]))
                            Spacer()
                            Text("Ties: " + String(statistics[0]))
                        }
                        VStack(spacing:30) {
                            Text("Computer Chose:")
                                .font(.title)
                            Image(playresults[1])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                            VStack(alignment: .center) {
                                Text("You \(playresults[0])!")
                                    .bold()
                                    .font(.largeTitle)
                            }
                            Text("You Chose:")
                                .font(.title)
                            Image(game.Player)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                        }
                        Button() {
                            game.Game = false
                        } label: {
                            ZStack {
                                Color.accentColor
                                Text("Play again")
                                    .foregroundColor(.white)
                            }
                                .frame(width: 140, height: 50)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                        }
                    }.padding()
                    Spacer()
                }
            }
            .navigationTitle("Rock, Paper, Scissors")
        }
        
    }
}
