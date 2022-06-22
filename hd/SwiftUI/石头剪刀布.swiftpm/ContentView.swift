import SwiftUI

struct ContentView: View {
    // 0P/1S/2R
    @State var player = 0
    // 0Start/1Results
    @State var gameStep = 0
    @State var computer = 0
    
    var body: some View {
        if gameStep==0{
            PlayerInput(player: $player, computer: $computer, gameStep: $gameStep)
        }else{
            GameResults(player: $player, computer: $computer, gameStep: $gameStep)
        }
    }
}
