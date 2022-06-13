import SwiftUI

struct ContentView: View {
    @State var player = 0
    @State var gameStats = 0
    @State var computer = 0
    var body: some View {
        if gameStats==0{
            PlayerInput(player: $player, gameStats: $gameStats, computer: $computer)
        }else{
            GameResults(player: $player, computer: $computer, gameStats: $gameStats)
        }
    }
}
