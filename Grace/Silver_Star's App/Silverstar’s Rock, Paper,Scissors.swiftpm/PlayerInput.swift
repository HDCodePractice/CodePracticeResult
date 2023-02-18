import SwiftUI

struct PlayerInput: View {
    @Binding var player : Int
    @Binding var gameStats : Int
    @Binding var computer : Int
    var body: some View {
        VStack{
            Text (" Your choice:")
                .font(.largeTitle)
            Image(systemName: "pencil.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .onTapGesture {
                    player=0
                    computer=[0,1,2].randomElement()!
                    gameStats=1
                }
            Image(systemName: "scissors")
                .resizable()
                .scaledToFit()
                .foregroundColor(.yellow)
                .onTapGesture {
                    player=1
                    computer=[0,1,2].randomElement()!
                    gameStats=1
                }
            Image(systemName: "hand.wave")
                .resizable()
                .scaledToFit()
                .foregroundColor(.green)
                .onTapGesture {
                    player=2
                    computer=[0,1,2].randomElement()!
                    gameStats=1
                }
        }
        .padding()
    }
}

struct PlayerInput_Previews: PreviewProvider {
    @State static var player = 0
    @State static var gameStats = 0
    @State static var computer = 0
    static var previews: some View {
        PlayerInput(player: $player, gameStats: $gameStats, computer: $computer)
    }
}
