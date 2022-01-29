import SwiftUI

struct ContentView: View {
    @State var game: Game = Game()
    let buttons = ["Rock","Paper","Scissors"]
    let toggles = ["Win%","Winstreak","Player vs Computer icon"]
    var body: some View {
        NavigationView {
            VStack (spacing: 60) {
                if game.Game == false {
                    DrawStats.padding(20)
                    if game.pve {
                        DrawComputerButton
                    }
                    DrawChoiceButtons
                    SettingsButton
                    Spacer()
                } else if game.Game == true {
                    VStack(spacing: 15){
                        DrawStats
                        DrawGame
                        PlayAgainButton
                    }.padding(20)
                    Spacer()
                }
            }
            .navigationTitle("Rock, Paper, Scissors")
        }
    }
    
    var SettingView: some View {
        NavigationView {
            Form {
                Section {
                    Toggle("Show \(toggles[0])", isOn: $game.winPer)
                    Toggle("Show \(toggles[1])", isOn: $game.ws)
                    Toggle("Show \(toggles[2])", isOn: $game.pve)
                }
            }
        }
        .navigationTitle("Settings")
    }
    
    var DrawStats: some View {
        VStack {
            HStack {
                Text("Wins: \(game.PlayerWins)")
                Spacer()
                if game.winPer {
                    Text("Win %: \(game.WinPercent,specifier: "%.2f")")
                        .bold()
                } else {
                    Text("Ties: \(game.PlayerTies)")
                }
                Spacer()
                Text("Loses: \(game.PlayerLoses)")
                
            }
            HStack {
                if game.ws {
                    Text("Winstreak: \(game.Winstreak)")
                }
                Spacer()
                if game.winPer {
                    Text("Ties: \(game.PlayerTies)")
                }
            }
        }
    }
    
    var DrawComputerButton: some View {
        HStack {
            ForEach(["person.fill","greaterthan.circle.fill","desktopcomputer"], id: \.self) { each in
                HStack {
                    if each != "greaterthan.circle.fill" {
                        Spacer()
                        ZStack {
                            Color.accentColor
                            Image(systemName: each)
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 90, height: 90)
                        }
                        .frame(width: 120, height: 120)
                        .cornerRadius(5)
                        .shadow(radius: 5)
                        Spacer()
                    } else {
                        Text("vs")
                            .font(.title)
                            .bold()
                    }
                }
            }
        }
        
    }
    
    var DrawChoiceButtons: some View {
        VStack {
            Text("Choose one")
                .font(.largeTitle)
                .foregroundColor(.black)
            HStack {
                ForEach(buttons, id: \.self) { each in
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
                        .onTapGesture() {
                            game.Player = each
                            game.Game = true
                            game.genComputer()
                        }
                }
            }
        }
    }
    
    var DrawGame: some View {
        VStack(spacing:30) {
            Text("Computer")
                .font(.title)
            Image(game.Computer)
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
            VStack(alignment: .center) {
                Text("You \(game.Result)!")
                    .bold()
                    .font(.largeTitle)
            }
            Text("You")
                .font(.title)
            Image("Player\(game.Player)")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
        }
    }
    
    var PlayAgainButton: some View {
        Button() {
            game.Game = false
        } label: {
            ZStack {
                Color.accentColor
                Text("Play again?")
                    .foregroundColor(.white)
            }
                .frame(width: 140, height: 50)
                .cornerRadius(5)
                .shadow(radius: 5)
        }
    }
    
    var SettingsButton: some View {
        NavigationLink(){
            SettingView
        } label: {
            ZStack {
                Color.accentColor
                Text("Settings")
                    .foregroundColor(.white)
            }
                .frame(width: 140, height: 50)
                .cornerRadius(5)
                .shadow(radius: 5)
        }
    }
}
