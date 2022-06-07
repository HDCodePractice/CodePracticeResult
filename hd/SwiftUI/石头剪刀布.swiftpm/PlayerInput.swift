import SwiftUI

struct PlayerInput: View {
    // 0P/1S/2R
    @Binding var player : Int
    @Binding var computer : Int
    // 0Start/1Results
    @Binding var gameStep : Int
    
    var body: some View {
        VStack{
            Text("Your choice:")
                .font(.largeTitle)
            Image(systemName: "pencil.circle")
                .resizable()
                .scaledToFit()
                .foregroundColor(.cyan)
                .onTapGesture {
                    player=0
                    computer=[0,1,2].randomElement()!
                    gameStep=1
                }
            Image(systemName: "scissors")
                .resizable()
                .scaledToFit()
                .foregroundColor(.red)
                .onTapGesture {
                    player=1
                    computer=[0,1,2].randomElement()!
                    gameStep=1
                }
            Image(systemName: "hand.wave")
                .resizable()
                .scaledToFit()
                .foregroundColor(.mint)
                .onTapGesture {
                    player=2
                    computer=[0,1,2].randomElement()!
                    gameStep=1
                }
        }
        .padding()
    }
}

struct PlayerInput_Previews: PreviewProvider {
    @State static var player = 0
    @State static var computer = 0
    @State static var gameStep = 0
    static var previews: some View {
        PlayerInput(player: $player, computer: $computer, gameStep: $gameStep)
    }
}
